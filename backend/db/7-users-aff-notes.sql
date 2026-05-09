-- 1) Filiere already present in 2-Filiere_db.sql
-- 2) TypeEvaluation present in 1-eval_db.sql
-- 3) UniteEnseignement present in 3-ue_db.sql
-- 4) Matiere present in matieres_*.sql

-- 5) Insert base users into t_user (User table using JOINED inheritance)
-- Note: column names must match generated DDL. Assuming t_user columns (cin, first_name, last_name, email, password, role)
INSERT INTO t_user (cin, first_name, last_name, email, password, role,filiere_id, nce) VALUES
  ('00000010', 'Mr.', 'Kharrat', 'eating-canon-pound@duck.com', '$2a$12$W8fuDb8htp//C.T6yo4ldOjf.GHVQw1Hh6GE/7/owdp.wj0rpwsI6', 'ADMIN', NULL,NULL), --A123456789a!
  ('00000011', 'Yassine', 'Kharrat', 'mohamedyassinekharrat@duck.com', '$2a$10$/wK8vg1QR1Q3azm1z916k.XGrfuOs90ZS1nQKIrYbkOJG6tnNzK4O', 'ETUDIANT', 'ING2_INFO','123123'), --123456789
  ('CINSTU002', 'Brahim', 'Cherif', 'brahim.cherif@example.com', '$2a$10$/wK8vg1QR1Q3azm1z916k.XGrfuOs90ZS1nQKIrYbkOJG6tnNzK4O','ETUDIANT','ING2_INFO','123113'),
  ('CINENS001', 'Sami', 'Prof', 'sami.prof@example.com', '$2a$10$/wK8vg1QR1Q3azm1z916k.XGrfuOs90ZS1nQKIrYbkOJG6tnNzK4O','ENSEIGNANT',NULL, NULL);


-- 8) Insert Affectation example linking enseignant to a matiere
/*INSERT INTO affectation (id, type, ens_id, matiere_id, ue_id, filiere_id) VALUES
  ('AFF001', 'COURS', 'CINENS001', 'UEF111', 'UE110', 'L1_INFO');
*/
-- 9) Insert sample MoyenneMatiere rows (requires etudiant and matiere)
INSERT INTO moyenne_matiere (id, valeur, etudiant_id, matiere_id, filiere_id, ue_id, created_at) VALUES
  (1, 12.5, '00000011', 'UEF111', 'L1_INFO', 'UE110', now()),
  (2, 10.0, 'CINSTU002', 'ECUE111', 'CPI1', 'UE110', now());

-- 10) Insert sample Note rows
INSERT INTO note (note_id, valeur, etudiant_id, type_eval_id, matiere_id, filiere_id, ue_id, created_at) VALUES
  (1, 14.0, '00000011', 0, 'UEF111', 'L1_INFO', 'UE110', now()),
  (2, 11.5, '00000011', 1, 'UEF111', 'L1_INFO', 'UE110', now()),
  (3, 9.0, 'CINSTU002', 0, 'ECUE111', 'CPI1', 'UE110', now());


