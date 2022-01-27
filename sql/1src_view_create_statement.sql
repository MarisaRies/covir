DROP VIEW IF EXISTS v_encounters_star;
CREATE VIEW v_encounters_star AS 
SELECT 
  enc.Id,
  enc.start as date, 
  enc.patient,
  con.code,
  con.description 
FROM 
  tb_encounters as enc,
  tb_conditions as con
WHERE
(
  con.encounter = enc.Id
)
UNION
SELECT 
  enc.Id,
  enc.start as date, 
  enc.patient,
  imm.code,
  imm.description 
FROM 
  tb_encounters as enc,
  tb_immunizations as imm
WHERE
(
  imm.encounter = enc.Id
);
