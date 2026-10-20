import bcrypt
from fastapi import FastAPI, HTTPException, Request, status
from fastapi.responses import JSONResponse
from postgrest.exceptions import APIError
from database import supabase
import schemas

app = FastAPI(
    title="API do Projeto Integrador",
    version="1.0.0"
)


# TRATAMENTO GLOBAL DE ERROS DO SUPABASE
@app.exception_handler(APIError)
async def supabase_api_error_handler(request: Request, exc: APIError):
    mensagem_detalhada = exc.message or "Erro de validação ou restrição no banco de dados."
    if exc.details:
        mensagem_detalhada += f" Detalhes: {exc.details}"
    return JSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST,
        content={"detail": mensagem_detalhada, "code": exc.code}
    )


def hash_senha(senha_plana: str) -> str:
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(senha_plana.encode('utf-8'), salt).decode('utf-8')


@app.get("/")
def inicio():
    return {"mensagem": "API e conexão com Supabase funcionando!"}


# ==========================================
# USUÁRIO
# ==========================================
@app.post("/usuarios", status_code=status.HTTP_201_CREATED)
def criar_usuario(usuario: schemas.UsuarioCreate):
    # 1. Verifica e-mail duplicado
    busca = supabase.table("usuario").select("id_usuario").eq("email", usuario.email).execute()
    if busca.data:
        raise HTTPException(status_code=400, detail="E-mail já cadastrado.")

    dados_usuario = usuario.model_dump(mode="json")
    dados_usuario["senha"] = hash_senha(usuario.senha)

    # 2. Busca o último ID cadastrado e gera o próximo (solução para o erro 23502)
    ultimo_registro = supabase.table("usuario").select("id_usuario").order("id_usuario", desc=True).limit(1).execute()
    
    if ultimo_registro.data:
        proximo_id = ultimo_registro.data[0]["id_usuario"] + 1
    else:
        proximo_id = 1

    dados_usuario["id_usuario"] = proximo_id

    # 3. Insere o registro no Supabase
    resposta = supabase.table("usuario").insert(dados_usuario).execute()
    return resposta.data[0]

@app.get("/usuarios")
def listar_usuarios():
    return supabase.table("usuario").select("*").execute().data