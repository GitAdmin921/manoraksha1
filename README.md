# ManoRaksha — SIH26094

AI-assisted dynamic wellbeing monitoring and distress-support prediction prototype.

## Stack
- Responsive frontend
- Node.js + Express
- PostgreSQL
- Socket.IO real-time events
- FastAPI AI baseline
- Multilingual UI structure
- RBAC/access-control design
- Privacy lock and consent controls
- Data masking architecture
- Emergency support trigger

## Run locally

### 1. Database
Create PostgreSQL database `manoraksha`, then:
`psql "$DATABASE_URL" -f database/schema.sql`
`psql "$DATABASE_URL" -f database/seed.sql`

### 2. Backend
`cp .env.example .env`
Set a strong JWT_SECRET and DATABASE_URL.
`npm install`
`npm start`

### 3. AI service
`python -m venv .venv`
Activate it, then:
`pip install -r requirements.txt`
`uvicorn ai.main:app --host 0.0.0.0 --port 8000`

Open http://localhost:3000

## Demo accounts
Any email can use demo login. The selected role controls the dashboard. Seeded demo emails are in `database/seed.sql`.

## Add training data
Put ethically sourced/de-identified JSONL files in `data/training/`. Start with the format in `data/training/README.md`. Do not commit identifiable victim data.

## Important
This is a hackathon prototype. The AI baseline is not a clinical diagnostic system. Production use requires security review, privacy/legal review, safeguarding governance, validated multilingual data, human oversight, monitoring and an approved emergency-response process.
