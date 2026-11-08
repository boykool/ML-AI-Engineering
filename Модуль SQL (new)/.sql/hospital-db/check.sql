-- Ожидается: patients 4530, admissions 5067, doctors 27, province_names 13
SELECT 'patients', COUNT(*) FROM patients
UNION ALL SELECT 'admissions', COUNT(*) FROM admissions
UNION ALL SELECT 'doctors', COUNT(*) FROM doctors
UNION ALL SELECT 'province_names', COUNT(*) FROM province_names;
