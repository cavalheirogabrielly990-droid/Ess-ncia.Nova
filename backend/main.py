from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session

from database import Base, engine, SessionLocal

import models
import schemas

Base.metadata.create_all(bind=engine)

app = FastAPI()


def get_db():
    db = SessionLocal()

    try:
        yield db
    finally:
        db.close()


@app.post("/usuarios", response_model=schemas.UsuarioResponse)
def criar_usuario(
    dados: schemas.UsuarioCreate,
    db: Session = Depends(get_db)
):
    usuario = models.Usuario(
        nome=dados.nome,
        email=dados.email,
        senha=dados.senha,
        tipo_usuario=dados.tipo_usuario,
        data_cadastro=dados.data_cadastro,
        status=dados.status
    )

    db.add(usuario)
    db.commit()
    db.refresh(usuario)

    return usuario


@app.get("/usuarios", response_model=list[schemas.UsuarioResponse])
def listar_usuarios(db: Session = Depends(get_db)):
    return db.query(models.Usuario).all()