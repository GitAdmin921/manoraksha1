# ManoRaksha architecture

Frontend: responsive PWA-style web UI.
Backend: Node.js + Express + Socket.IO.
Database: PostgreSQL.
AI: FastAPI baseline support-risk service.
Source: GitHub.

Flow:
User -> HTTPS frontend -> API -> PostgreSQL
                         -> AI service
                         -> Socket.IO live events -> authorized dashboards

Production should put the API, database and AI service behind TLS, private networking/firewall rules, secrets management, backups, monitoring and audited access controls.
