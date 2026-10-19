from pydantic import BaseModel, ConfigDict
from datetime import date


class UsuarioCreate(BaseModel):
    nome: str
    email: str
    senha: str
    tipo_usuario: str
    data_cadastro: date
    status: str


class UsuarioResponse(BaseModel):
    id_usuario: int
    nome: str
    email: str
    senha: str
    tipo_usuario: str
    data_cadastro: date
    status: str

    model_config = ConfigDict(from_attributes=True)