-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-12 14:54:45 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE alternativas CASCADE CONSTRAINTS;

DROP TABLE preguntas CASCADE CONSTRAINTS;

DROP TABLE test CASCADE CONSTRAINTS;

CREATE TABLE alternativas (
    id_alternativas          INTEGER NOT NULL,
    descripcion              VARCHAR2(140 CHAR),
    logico_v_o_f             INTEGER,
    porcentaje               NUMBER(100, 2),
    preguntas_id_pregunta    INTEGER NOT NULL,
    preguntas_test_id_unico  NUMBER(10) NOT NULL
);

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_pk PRIMARY KEY ( id_alternativas,
                                                 preguntas_id_pregunta,
                                                 preguntas_test_id_unico );

CREATE TABLE preguntas (
    id_pregunta    INTEGER NOT NULL,
    enunciado      VARCHAR2(140 CHAR),
    puntaje        NUMBER(2, 2),
    test_id_unico  NUMBER(10) NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( id_pregunta,
                                                                test_id_unico );

CREATE TABLE test (
    id_unico        NUMBER(10) NOT NULL,
    nombre          VARCHAR2(40 CHAR),
    descripcion     VARCHAR2(140 CHAR),
    programa        VARCHAR2(50 CHAR),
    unidad          VARCHAR2(50 CHAR),
    autor           VARCHAR2(40 CHAR),
    fecha_creacion  DATE
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( id_unico );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_id_pregunta,
                                                           preguntas_test_id_unico )
        REFERENCES preguntas ( id_pregunta,
                               test_id_unico );

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_id_unico )
        REFERENCES test ( id_unico );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
