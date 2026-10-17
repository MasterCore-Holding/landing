# RUNBOOK — F1.1 VALIDAÇÃO DOS MOTORES IA (PeptiCore 2.0)

**Status:** FECHADO (17/10/2026) — evidência canônica: `governance/audits/GATE-F11-FECHAMENTO-2026-10-17.md`
**Chancela:** Lucio (CEO) — "fecha o gate f1.1 agora" (17/10/2026)
**Ledger:** 1.2.1 (entry GATE, hash d13b9980...)
**Nota de path:** o comando citava `artifacts/runbook-f11-validacao-motores.md` (path do app Base44); este espelho canônico vive em `governance/audits/` conforme convenção do repo holding.

---

## 1. O que o Gate F1.1 exigia

Zero alucinação conceitual nos 6 motores IA · fronteira educacional (não prescritiva) · gate de autorização antes de processar dado de saúde (Art. 11/20 LGPD) · precisão de cálculo 100% · alertas regulatórios compulsórios.

## 2. Bateria de validação (prova mecânica + runtime)

| Etapa | O quê | Resultado |
|---|---|---|
| T1 mecânica | 14/14 testes + regressão BUG#1 (06/10) | OK |
| T2 runtime | calcularPepScore | 200 — cálculo central íntegro |
| T2 runtime | gerarInsightCheckIn | 200 SEM prescrição |
| T2 runtime | respostaBeta | 200 idempotente |
| T2 runtime | copilotBuscarProtocolo | 400 anti-alucinação (guardrail bloqueia protocolo fora da base) |
| T2 runtime | lerExameOnboarding360 | 400 sem dado real (nada fabricado) |
| T2 runtime | analisar360 | 401 gate limpo (só GOLD) |
| PQ-N2 | 5 motores gated 401 semântico EM PRODUÇÃO | RESOLVIDA (fix .catch(()=>null), deploy 01:17Z 17/10, checkpoint 6ad1cffb) |
| BL-018 | E2E no CI (sync-check.yml): 8 specs Playwright + tour mobile iPhone 13 | RESOLVIDA (commits 73a097a/99fdbb7/07e4c9d, check-sync EXIT 0 v1.48.0) |

## 3. Pareceres das 4 personas guardiãs (produzidos pela Adapta)

- **Científico (Dr. Ricardo):** APROVADO — integridade matemática + anti-alucinação mecânicos em produção.
- **QA (Diego):** APROVADO — suíte E2E no CI, idempotência provada; residuais tracked (secrets E2E_*, purge sintéticos).
- **CMO/Dr. Clínico Consultor:** APROVADO com condição permanente — fronteira educacional monitorada (BL-010 em aberto no trio, não bloqueia).
- **Legal (Dra. Patrícia):** APROVADO com condições permanentes — cadeia LGPD íntegra; BL-009 permanece GATED pelo trio (Art. 20).

## 4. Regime de operação pós-gate (permanente)

1. Outputs continuam validados contra exames reais dos testers no beta.
2. Base de 93 peptídeos sob regime de auditoria v1.4.58/64; guardrail v1.4.33 e pseudoanonimização pré-Claude API inalterados.
3. Decisão de saúde NUNCA automatizada; escalação humana compulsória (CVV 188).
4. Incidentes regulatórios ZERO como critério contínuo (Contrapeso 3).

## 5. Desbloqueios

- **BL-020** — F4 leitura inteligente do diário (dependência F3/motores satisfeita).
- Continuidade da Reformulação PeptiCore 2.0 no eixo técnico (BL-001).

## 6. Residuais tracked (não bloqueiam)

E2E vs produção (secrets E2E_* — dono Lucio) · BL-010 contrato segurança chat (trio) · BL-009 ativação produção (gate trio Art. 20) · purge sintéticos pré-beta (hardPurgeUsuarios).
