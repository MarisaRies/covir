DROP VIEW IF EXISTS v_encounters_star;
CREATE VIEW v_encounters_star AS 

SELECT 
  enc.Id,
  enc.start as date, 
  enc.patient,
  enc.code,
  enc.description,
  con.code as action_code,
  con.description as action_desc,
  'con' as action_src
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
  enc.code,
  enc.description,
  imm.code as action_code,,
  imm.description as action_desc,
  'imm' as action_src
FROM 
  tb_encounters as enc,
  tb_immunizations as imm
WHERE
(
  imm.encounter = enc.Id
);
