DROP VIEW IF EXISTS v_encounters_aggr;
CREATE VIEW v_encounters_aggr AS 

SELECT 
	enc.Id,
  enc.START as date, 
  enc.patient,
  con.code,
  con.description 
FROM 
	encounters as enc,
  conditions as con
WHERE
(
  con.ENCOUNTER = enc.Id
)

UNION

SELECT 
	enc.Id,
  enc.START as date, 
  enc.patient,
  imm.code,
  imm.description 
FROM 
	encounters as enc,
  immunizations as imm
	
WHERE
(
  imm.ENCOUNTER = enc.Id
)
;
