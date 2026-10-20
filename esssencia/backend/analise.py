from pathlib import Path
import pandas as pd


CAMINHO_CSV = Path(__file__).resolve().parent / 'database' / 'essencia.csv'


def ler_dados():
    # Lê o arquivo CSV
    df = pd.read_csv(CAMINHO_CSV)

    # Colunas esperadas no CSV
    colunas = [
        'id',
        'tipo_problema',
        'local_exemplo',
        'descricao',
        'causa_principal',
        'impacto',
        'medida_solucao'
    ]

    # Verifica se todas as colunas existem
    if not set(colunas).issubset(df.columns):
        colunas_faltantes = set(colunas) - set(df.columns)
        raise ValueError(
            f'Colunas faltantes no CSV: {colunas_faltantes}'
        )

    # Mantém somente as colunas esperadas
    df = df[colunas].copy()

    # Verifica se o CSV está vazio
    if df.empty:
        raise ValueError('O CSV está vazio.')

    # Verifica campos vazios
    if df.isna().any().any():
        raise ValueError(
            'O CSV contém campos vazios ou ausentes.'
        )

    # Converte o ID para número inteiro
    df['id'] = pd.to_numeric(df['id'], errors='raise')

    # Verifica valores infinitos
    if df['id'].isin([float('inf'), -float('inf')]).any():
        raise ValueError('O CSV contém valores infinitos.')

    # Verifica se os IDs são inteiros
    if (df['id'] % 1 != 0).any():
        raise ValueError('Os IDs devem ser números inteiros.')

    # Verifica se os IDs são positivos
    if (df['id'] <= 0).any():
        raise ValueError('Os IDs devem ser positivos.')

    # Verifica IDs duplicados
    if df['id'].duplicated().any():
        raise ValueError(
            'Há IDs duplicados. Verifique a fonte dos dados.'
        )

    # Verifica linhas completamente duplicadas
    if df.duplicated().any():
        raise ValueError(
            'Há linhas idênticas. Verifique a fonte antes de analisar.'
        )

    return df


def resumo(df):
    """Retorna um resumo geral dos problemas cadastrados."""

    return {
        'total_registros': int(len(df)),
        'total_tipos_problema': int(
            df['tipo_problema'].nunique()
        ),
        'total_locais': int(
            df['local_exemplo'].nunique()
        ),
        'total_causas': int(
            df['causa_principal'].nunique()
        ),
        'total_impactos': int(
            df['impacto'].nunique()
        ),
        'total_solucoes': int(
            df['medida_solucao'].nunique()
        ),
    }


def por_tipo_problema(df):
    """Agrupa os registros por tipo de problema."""

    tabela = (
        df.groupby('tipo_problema')
        .size()
        .reset_index(name='quantidade')
    )

    tabela = tabela.sort_values(
        'quantidade',
        ascending=False
    )

    return tabela.to_dict(orient='records')


def por_local(df):
    """Agrupa os problemas por local."""

    tabela = (
        df.groupby('local_exemplo')
        .size()
        .reset_index(name='quantidade')
    )

    tabela = tabela.sort_values(
        'quantidade',
        ascending=False
    )

    return tabela.to_dict(orient='records')


def por_causa(df):
    """Agrupa os problemas pela causa principal."""

    tabela = (
        df.groupby('causa_principal')
        .size()
        .reset_index(name='quantidade')
    )

    tabela = tabela.sort_values(
        'quantidade',
        ascending=False
    )

    return tabela.to_dict(orient='records')


def por_impacto(df):
    """Agrupa os problemas pelo impacto."""

    tabela = (
        df.groupby('impacto')
        .size()
        .reset_index(name='quantidade')
    )

    tabela = tabela.sort_values(
        'quantidade',
        ascending=False
    )

    return tabela.to_dict(orient='records')


def buscar_problema(df, termo):
    """Busca problemas em todas as colunas de texto."""

    termo = termo.lower()

    resultado = df[
        df.astype(str)
        .apply(
            lambda coluna: coluna.str.lower().str.contains(
                termo,
                na=False
            )
        )
        .any(axis=1)
    ]

    return resultado.to_dict(orient='records')


if __name__ == '__main__':
    dados = ler_dados()

    print('\n===== PRIMEIROS CINCO REGISTROS =====')
    print(dados.head())

    print('\n===== RESUMO =====')
    print(resumo(dados))

    print('\n===== PROBLEMAS POR TIPO =====')
    print(por_tipo_problema(dados))

    print('\n===== PROBLEMAS POR LOCAL =====')
    print(por_local(dados))

    print('\n===== PROBLEMAS POR CAUSA =====')
    print(por_causa(dados))

    print('\n===== PROBLEMAS POR IMPACTO =====')
    print(por_impacto(dados))
