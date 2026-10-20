from datetime import date
from typing import Optional
from pydantic import BaseModel, EmailStr, Field


# ==========================================
# USUÁRIO
# ==========================================
class UsuarioBase(BaseModel):
    nome: str
    email: EmailStr
    tipo_usuario: str
    status: Optional[str] = "ativo"


class UsuarioCreate(UsuarioBase):
    senha: str
    data_cadastro: Optional[date] = None


class UsuarioResponse(UsuarioBase):
    id_usuario: int
    data_cadastro: Optional[date] = None