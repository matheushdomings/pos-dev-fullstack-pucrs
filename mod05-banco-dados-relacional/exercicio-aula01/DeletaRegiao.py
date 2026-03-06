import sqlalchemy as sa
import ocorrencias as oc

engine = sa.create_engine(r"sqlite:///C:/Users/mhdom/OneDrive/Documents/Pós - Desenvolvimento Full Stack/Módulo 5 - Banco de dado relacional/exercicios/ocorrencias.db")

metadado = sa.MetaData()
metadado.reflect(bind=engine)

tbMunicipio = metadado.tables[oc.municipio.__tablename__]

atualiza_regiao = sa.delete(tbMunicipio).where(
                                            tbMunicipio.c.regiao == "Capital"
                                        )

try:
    with engine.connect() as conn:
        result = conn.execute(atualiza_regiao)
        conn.commit()    
        print("Dados deletados")
except ValueError:
    ValueError()
    
