CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE IF NOT EXISTS users(
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(),email text UNIQUE NOT NULL,display_name text NOT NULL,
 role text NOT NULL CHECK(role IN ('victim','counsellor','district','state','national','admin')),
 language text NOT NULL DEFAULT 'English',status text NOT NULL DEFAULT 'active',created_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS cases(id uuid PRIMARY KEY DEFAULT gen_random_uuid(),user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,state text,district text,status text NOT NULL DEFAULT 'active',created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS consents(id uuid PRIMARY KEY DEFAULT gen_random_uuid(),user_id uuid UNIQUE NOT NULL REFERENCES users(id) ON DELETE CASCADE,analytics boolean NOT NULL DEFAULT true,voice boolean NOT NULL DEFAULT true,longitudinal boolean NOT NULL DEFAULT true,counsellor_access boolean NOT NULL DEFAULT true,privacy_locked boolean NOT NULL DEFAULT false,updated_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS checkins(id uuid PRIMARY KEY DEFAULT gen_random_uuid(),case_id uuid NOT NULL REFERENCES cases(id) ON DELETE CASCADE,language text NOT NULL,mood int CHECK(mood BETWEEN 1 AND 5),anxiety int CHECK(anxiety BETWEEN 1 AND 5),sleep_difficulty int CHECK(sleep_difficulty BETWEEN 1 AND 5),feels_unsafe boolean NOT NULL DEFAULT false,message text,created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS risk_events(id uuid PRIMARY KEY DEFAULT gen_random_uuid(),case_id uuid NOT NULL REFERENCES cases(id) ON DELETE CASCADE,level text NOT NULL,score numeric,signals jsonb,explanation text,created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS emergency_events(id uuid PRIMARY KEY DEFAULT gen_random_uuid(),case_id uuid NOT NULL REFERENCES cases(id) ON DELETE CASCADE,reason text,status text NOT NULL DEFAULT 'unacknowledged',acknowledged_by uuid REFERENCES users(id),acknowledged_at timestamptz,created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS interventions(id uuid PRIMARY KEY DEFAULT gen_random_uuid(),case_id uuid NOT NULL REFERENCES cases(id) ON DELETE CASCADE,type text,status text NOT NULL DEFAULT 'pending',assigned_to uuid REFERENCES users(id),notes text,created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS audit_logs(id uuid PRIMARY KEY DEFAULT gen_random_uuid(),actor_user_id uuid REFERENCES users(id),action text NOT NULL,resource_type text,resource_id uuid,metadata jsonb,created_at timestamptz NOT NULL DEFAULT now());
CREATE INDEX IF NOT EXISTS risk_case_time ON risk_events(case_id,created_at DESC);
CREATE INDEX IF NOT EXISTS emergency_status_time ON emergency_events(status,created_at DESC);
