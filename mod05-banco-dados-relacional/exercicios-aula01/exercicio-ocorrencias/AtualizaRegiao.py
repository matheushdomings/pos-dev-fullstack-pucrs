import sqlalchemy as sa
import ocorrencias as oc

engine = sa.create_engine(r"sqlite:///C:/Users/mhdom/OneDrive/Documents/Pós - Desenvolvimento Full Stack/Módulo 5 - Banco de dado relacional/exercicios/ocorrencias.db")

metadado = sa.MetaData()
metadado.reflect(bind=engine)

tbMunicipio = metadado.tables[oc.municipio.__tablename__]

atualiza_regiao = sa.update(tbMunicipio).values(
                                            {"regiao":"Capital"}
                                        ).where(
                                            tbMunicipio.c.municipio == "Rio de Janeiro"
                                        )

try:
    with engine.connect() as conn:
        result = conn.execute(atualiza_regiao)
        conn.commit()    
        print("Dados atualizados")
except ValueError:
    ValueError()
    
