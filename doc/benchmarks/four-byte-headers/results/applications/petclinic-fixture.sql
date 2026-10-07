INSERT INTO owners (first_name,last_name,address,city,telephone)
SELECT 'Owner' || X, 'Bench' || LPAD(CAST(X AS VARCHAR),5,'0'),
       '123 Test Street', 'Madison', '6085550000' FROM SYSTEM_RANGE(11,10000);
INSERT INTO pets (name,birth_date,type_id,owner_id)
SELECT 'Pet' || X, DATE '2020-01-01', MOD(X,6)+1, X FROM SYSTEM_RANGE(11,10000);
INSERT INTO visits (pet_id,visit_date,description)
SELECT id, DATE '2025-01-01', 'Routine check' FROM pets WHERE owner_id >= 11;
