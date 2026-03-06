import pandas as pd
import sqlalchemy as sa
import sqlalchemy.orm as orm
import ocorrencias as oc

engine = sa.create_engine(r"sqlite:///C:/Users/mhdom/OneDrive/Documents/Pós - Desenvolvimento Full Stack/Módulo 5 - Banco de dado relacional/exercicios/ocorrencias.db")
Sessao = orm.sessionmaker(bind=engine)
sessao = Sessao()

'''
Suponha que o Delegado da Delegacia de Roubos e Furtos de Veículos tenha te solicitado uma
análise relacionada ao ranqueamento de todas as DPs, através da quantidade total de
ocorrências relacionadas a Roubo e furto de Veículos, no Interior do Estado do RJ (é preciso
verificar como o dado está cadastrado na tabela, para realizar o filtro!!!!).
• O resultado desse ranqueamento deve ser enviado em uma tabela, contendo as seguintes
colunas:
• DP
• Total
'''

RankDP = pd.DataFrame( 
            sessao.query(
                oc.dp.nome.label("DP"),
                sa.func.sum(oc.ocorrencia.qtde).label("Total")
            ).join(
                oc.ocorrencia,
                oc.ocorrencia.codDP == oc.dp.codDP
            ).join(
                oc.municipio,
                oc.ocorrencia.codIBGE == oc.municipio.codIBGE
            ).where(
                oc.municipio.regiao == "Interior",
                sa.or_(oc.ocorrencia.ocorrencia == "roubo_veiculo", oc.ocorrencia.ocorrencia == "furto_veiculos")
            ).group_by(
                oc.dp.nome
            ).order_by(
                sa.func.sum(oc.ocorrencia.qtde).label("Total").desc()
            ).all()
        )

print(RankDP)