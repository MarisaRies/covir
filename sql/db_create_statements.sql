DROP TABLE IF EXISTS tb_immunizations; 
DROP TABLE IF EXISTS tb_conditions;
DROP TABLE IF EXISTS tb_encounters; 
DROP TABLE IF EXISTS tb_patients; 

CREATE TABLE tb_patients 
  ( 
     id                  NVARCHAR(256), 
     birthdate           DATE DEFAULT NULL, 
     deathdate           DATE DEFAULT NULL, 
     first               NVARCHAR(256) DEFAULT NULL, 
     last                NVARCHAR(256) DEFAULT NULL, 
     PRIMARY KEY (id) 
  );
  
  CREATE TABLE tb_encounters 
  ( 
     id                   NVARCHAR(256), 
     start                TIMESTAMP DEFAULT NULL, 
     stop                 TIMESTAMP DEFAULT NULL, 
     patient_id           NVARCHAR(256), 
     code                 NVARCHAR(256), 
     description          NVARCHAR(256) DEFAULT NULL,
     PRIMARY KEY (id, code), 
     FOREIGN KEY (patient_id) REFERENCES tb_patients(id)
  );

CREATE TABLE tb_conditions 
  ( 
     start          DATE, 
     stop           DATE, 
     patient_id     NVARCHAR(256), 
     code           NVARCHAR(256), 
     description    NVARCHAR(256) DEFAULT NULL, 
     PRIMARY KEY (start, stop, patient_id, code), 
     FOREIGN KEY (patient_id) REFERENCES tb_patients(id) 
  );
  
  CREATE TABLE tb_immunizations 
  ( 
     date           TIMESTAMP, 
     patient_id     NVARCHAR(256), 
     code           NVARCHAR(256), 
     description    NVARCHAR(256) DEFAULT NULL, 
     PRIMARY KEY (date, patient_id, code), 
     FOREIGN KEY (patient_id) REFERENCES tb_patients(id)
  );
