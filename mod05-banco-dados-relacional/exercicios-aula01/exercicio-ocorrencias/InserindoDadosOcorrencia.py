import pandas as pd
import ocorrencias as oc
import sqlalchemy.orm as orm
import sqlalchemy as sa

endereco = "C:\\Users\\mhdom\\OneDrive\\Documents\\Pós - Desenvolvimento Full Stack\\Módulo 5 - Banco de dado relacional\\exercicios\\"

dp = pd.read_csv(endereco + "DP.csv", sep=",")
responsavelDP = pd.read_excel(endereco + "ResponsavelDP.xlsx")
municipio = pd.read_csv(endereco + "Municipio.csv",sep=",")
ocorrencias = pd.read_excel(endereco + "ocorrencias.xlsx")

tbDP = pd.DataFrame(dp)
tbResponsavelDP = pd.DataFrame(responsavelDP)
tbMunicipio = pd.DataFrame(municipio)
tbOcorrencia = pd.DataFrame(ocorrencias)


engine = sa.create_engine(f"sqlite:///{endereco}ocorrencias.db")

conn = engine.connect()
metadata = sa.schema.MetaData()
sessao = orm.sessionmaker(bind=engine)
sessao = sessao()

#DP
DadosDP = tbDP.to_dict(orient="records")
tabela_DP = sa.Table(oc.dp.__tablename__, metadata, autoload_with=engine)
try: 
    sessao.execute(tabela_DP.insert().values(DadosDP))
    sessao.commit()
except ValueError:
    ValueError()

print("Dados inseridos na tbDP")

#ResponsavelDP
DadosRespDP = tbResponsavelDP.to_dict(orient="records")
tabela_respDP = sa.Table(oc.responsaveldp.__tablename__,metadata, autoload_with=engine)
try: 
    sessao.execute(tabela_respDP.insert().values(DadosRespDP))
    sessao.commit()
except ValueError:
    ValueError()

print("Dados inseridos na tbResponsavelDP")

#Municipio
DadosMunicipio = tbMunicipio.to_dict(orient="records")
tabela_municipio = sa.Table(oc.municipio.__tablename__,metadata, autoload_with=engine)
try: 
    sessao.execute(tabela_municipio.insert().values(DadosMunicipio))
    sessao.commit()
except ValueError:
    ValueError()

print("Dados inseridos na tbMunicipio")

#Ocorrencia
DadosOcorrencia = tbOcorrencia.to_dict(orient="records")
tabela_ocorrencia = sa.Table(oc.ocorrencia.__tablename__,metadata, autoload_with=engine)
try: 
    sessao.execute(tabela_ocorrencia.insert(), DadosOcorrencia)
    sessao.commit()
except ValueError:
    ValueError()

print("Dados inseridos na tbOcorrencia")

sessao.close_all
print("Carga de dados finalizada")