# changelog-draft.md — entradas pendentes de bump/consolidação

## 2026-10-16 (noite) — PACOTÃO NOITE 16-10 (OVERNIGHT-SPRINT) · executor Córtex
- **[landing] B5 DASHBOARDS-MC — EXECUTADO**: rotas internas /stylecore e /longevcore criadas (commit 688d85f @main) — 5/5 rotas 200 OK ao vivo (radar/cockpit/custos/stylecore/longevcore), gate de acesso em 2 camadas (data files 404 server-side + chave client-side), noindex + robots.txt Disallow ampliado. Sem bump de versão (landing não versionada por ledger).
- **[infra] B4/PQ-A5 — EXECUTADO**: drift-check de segredo do canal CEO incorporado ao heartbeat (scripts/249e5a184c4452a8/run.sh) — probe com valor do CLIENTE (lição CORTEX-R5-INBOUND): 200 c/ segredo do env + 401 c/ errado = VERDE (23:30 BRT).
- **[verificação] B1/B2 (PQ-A1/PQ-A2) — PARCIAL**: barramento webhook v2 re-testado — 200 c/ segredo correto, 401 sem/errado; anti-replay e 202+execution_id NÃO provados (endpoint responde 200 vazio) → PENDENTE com causa registrada.
- **[verificação] B3 (PQ-B5) — CONFORME (sem re-escavação)**: deploy produção PeptiCore v1.48.0 já provado hoje (commit f155a2dc, bundle index-BC5-x0v4.js, 3/3 features grep + footer DOM).
- **[fila] Blocos A/C/D — PENDENTES**: execução contínua nos próximos ciclos do cron (skip-and-flag; relatório consolidado RELATORIO-PACOTAO-NOITE.md ~08:00 BRT 17/10).
