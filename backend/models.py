from sqlalchemy import Column, Integer, String, Date
from database import Base


class Usuario(Base):
    __tablename__ = "usuario"

    id_usuario = Column(
        Integer,
        primary_key=True,
        index=True
    )

    nome = Column(
        String,
        nullable=False
    )

    email = Column(
        String,
        nullable=False,
        unique=True
    )

    senha = Column(
        String,
        nullable=False
    )

    tipo_usuario = Column(
        String,
        nullable=False
    )

    data_cadastro = Column(
        Date,
        nullable=False
    )

    status = Column(
        String,
        nullable=False
    )