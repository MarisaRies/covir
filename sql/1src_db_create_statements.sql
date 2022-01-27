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
     patient              NVARCHAR(256), 
     code                 NVARCHAR(256), 
     description          NVARCHAR(256) DEFAULT NULL,
     PRIMARY KEY (id, code), 
     FOREIGN KEY (patient) REFERENCES tb_patients(id)
  );

CREATE TABLE tb_conditions 
  ( 
     encounter      NVARCHAR(256),  
     start          DATE, 
     stop           DATE, 
     patient        NVARCHAR(256), 
     code           NVARCHAR(256), 
     description    NVARCHAR(256) DEFAULT NULL, 
     PRIMARY KEY (encounter, start, stop, patient, code), 
     FOREIGN KEY (patient) REFERENCES tb_patients(id),
     FOREIGN KEY (encounter) REFERENCES tb_encounters (id) 
  );
  
  CREATE TABLE tb_immunizations 
  ( 
     encounter      NVARCHAR(256),   
     date           TIMESTAMP, 
     patient        NVARCHAR(256), 
     code           NVARCHAR(256), 
     description    NVARCHAR(256) DEFAULT NULL, 
     PRIMARY KEY (encounter, date, patient, code), 
     FOREIGN KEY (patient) REFERENCES tb_patients(id),
     FOREIGN KEY (encounter) REFERENCES tb_encounters (id) 
  );
