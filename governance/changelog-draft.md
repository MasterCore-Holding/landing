# changelog-draft.md — entradas pendentes de bump/consolidação

## 2026-10-16 (noite) — PACOTÃO NOITE 16-10 (OVERNIGHT-SPRINT) · executor Córtex
- **[landing] B5 DASHBOARDS-MC — EXECUTADO**: rotas internas /stylecore e /longevcore criadas (commit 688d85f @main) — 5/5 rotas 200 OK ao vivo (radar/cockpit/custos/stylecore/longevcore), gate de acesso em 2 camadas (data files 404 server-side + chave client-side), noindex + robots.txt Disallow ampliado. Sem bump de versão (landing não versionada por ledger).
- **[infra] B4/PQ-A5 — EXECUTADO**: drift-check de segredo do canal CEO incorporado ao heartbeat (scripts/249e5a184c4452a8/run.sh) — probe com valor do CLIENTE (lição CORTEX-R5-INBOUND): 200 c/ segredo do env + 401 c/ errado = VERDE (23:30 BRT).
- **[verificação] B1/B2 (PQ-A1/PQ-A2) — PARCIAL**: barramento webhook v2 re-testado — 200 c/ segredo correto, 401 sem/errado; anti-replay e 202+execution_id NÃO provados (endpoint responde 200 vazio) → PENDENTE com causa registrada.
- **[verificação] B3 (PQ-B5) — CONFORME (sem re-escavação)**: deploy produção PeptiCore v1.48.0 já provado hoje (commit f155a2dc, bundle index-BC5-x0v4.js, 3/3 features grep + footer DOM).
- **[fila] Blocos A/C/D — PENDENTES**: execução contínua nos próximos ciclos do cron (skip-and-flag; relatório consolidado RELATORIO-PACOTAO-NOITE.md ~08:00 BRT 17/10).

## 2026-10-17 (madrugada) — P1 E2E NO CI + GOVERNANÇA · executor Córtex
- **[pepticore] P1 E2E NO CI — EXECUTADO**: job "e2e" ligado ao sync-check.yml (push/PR main, após check-sync): Playwright (8 specs e2e/ = fluxos críticos Bloco 6 v1.4.72) + validação mobile do tour (viewport iPhone 13, config dedicada). Specs com guard test.skip sem secrets — CI verde sem credenciais. Fecha BL-082/BL-018. Commits 73a097a → 99fdbb7 (fix sha256 real no ledger) → 07e4c9d (npm install sem lockfile + config mobile). check-sync local EXIT 0 (v1.48.0, 423 artefatos) + check-alinhamento OK (81 entradas).
- **[governança] 4 entradas de 16/10 anexadas ao changelog-draft do PeptiCore (SEM bump, SEM tocar src/CHANGELOG)**: (1) Auditoria 360 de skills (10 skills alinhadas ao ledger + tombstone #Growth/Performance Marketing); (2) Avaliação de Hiperautonomia (executor = Córtex Maestro); (3) REGRA P0 homologada (edição de skill de governança → entrada imediata); (4) Homologação do modelo de autonomia (4 Gates de Controle).
- **[verificação] B6 re-teste webhook — PROBE REAL HTTP 200** (HMAC assinado aceito, secret vivo). B5 bundle F1.1 consolidado por referência (zero IA paga). STATUS_P1-E2E-CI_1710.md + STATUS_DEPLOY-FINAL-PREP_1710.md no _RETORNO.
- **[fila] RB-01 dashboard UAU → RB-02 planos → B7 EOD domingo** (CORRECAO-ROTA do PO: alvo domingo = fechar PeptiCore 2.0; beta só após 3.0).
