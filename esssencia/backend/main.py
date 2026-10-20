from fastapi import FastAPI, HTTPException
import pandas as pd

from analise import (
    ler_dados,
    resumo,
    por_tipo_problema,
    por_local,
    por_causa,
    por_impacto,
)


app = FastAPI(
    title='Análise de Problemas de Trânsito',
    description='API para análise do CSV de problemas urbanos.',
    version='1.0.0'
)


def carregar_dados():
    try:
        return ler_dados()

    except (OSError, UnicodeError) as erro:
        raise HTTPException(
            status_code=503,
            detail='Não foi possível abrir database/essencia.csv.'
        ) from erro

    except (ValueError, pd.errors.ParserError) as erro:
        raise HTTPException(
            status_code=422,
            detail='Confira o cabeçalho e os dados do CSV.'
        ) from erro


@app.get('/')
def inicio():
    return {
        'mensagem': 'Backend de análise de problemas funcionando'
    }


@app.get('/analise/resumo')
def consultar_resumo():
    dados = carregar_dados()
    return resumo(dados)


@app.get('/analise/tipos')
def consultar_tipos():
    dados = carregar_dados()
    return por_tipo_problema(dados)


@app.get('/analise/locais')
def consultar_locais():
    dados = carregar_dados()
    return por_local(dados)


@app.get('/analise/causas')
def consultar_causas():
    dados = carregar_dados()
    return por_causa(dados)


@app.get('/analise/impactos')
def consultar_impactos():
    dados = carregar_dados()
    return por_impacto(dados)
