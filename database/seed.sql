-- Demo seed only. All records are synthetic.
INSERT INTO users(email,display_name,role,language) VALUES
('victim.demo@example.test','Demo Beneficiary','victim','English'),
('counsellor.demo@example.test','Demo Counsellor','counsellor','English'),
('district.demo@example.test','Demo District Officer','district','English'),
('state.demo@example.test','Demo State Officer','state','English'),
('national.demo@example.test','Demo National Officer','national','English'),
('admin.demo@example.test','Demo Administrator','admin','English')
ON CONFLICT(email) DO NOTHING;
