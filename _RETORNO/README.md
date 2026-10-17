# `_RETORNO/` — Retorno de execução de runbooks (Padrão Opção A)

Este diretório é a **fila de fechamento de ciclo**. O executor (Maestro/Base44) grava aqui o
resultado de cada runbook e o workflow `.github/workflows/fechamento-ciclo.yml` fecha o ciclo
automaticamente (bump + changelog + ledger + pendências + telemetria + WhatsApp).

## Como o executor grava um ciclo

1. Escreva **`_RETORNO/ciclo.json`** conforme `_RETORNO/schema.json` (obrigatório: `versao_runbook`,
   `data_execucao`, `executor`, `blocos[]`, `resumo`). Um ciclo por commit.
2. Cada bloco precisa de `status` explícito e `evidencia` real de runtime — **proposto ≠ aplicado**.
3. **Sanitize antes de gravar** (Art. 11 LGPD): nada de credenciais, tokens, CPF, dados de saúde
   de titular. O workflow escaneia o arquivo (padrões de credencial/CPF) e BLOQUEIA o ciclo se
   encontrar algo — a escalada vai ao CEO.
4. Se um bloco toca um dos 4 Gates de Controle (saúde / jurídico / financeiro / societário),
   marque `gate_controle`. O workflow **não fecha** o ciclo, grava `governance/audits/BLOQUEIO-*`
   e escala o CEO. Automação de processo sim; decisão de domínio crítico nunca.
5. Opcional por bloco: `"tipo": "feature|fix|sync"` (feature→bump minor, fix→patch, sync→sem bump)
   e `"fecha_pendencia": "<path no ledger>"` (fecha item de `artifacts_pending` do ledger —
   histórico preservado em `ledger.pendencias_fechadas`).
6. Commit com autor permitido: `pepticoreapp@gmail.com` (Base44), `contato@mastercore.app` ou
   `agent@picoclaw.local` (Córtex). Push de autor fora da allowlist é BLOQUEADO pelo workflow
   (nunca aceitar push não autenticado). Evolução futura: assinatura HMAC do payload.

## O que o workflow faz

- Guard anti-loop: commits do próprio `github-actions[bot]` não re-disparam fechamento.
- Valida origem → sanitização → schema → gates → bump (ledger `currentVersion`) →
  CHANGELOG → telemetria (`governance/telemetria/contrapesos.jsonl`) → auditoria
  (`governance/audits/FECHAMENTO-*.md`) → arquiva o ciclo em `_RETORNO/arquivo/`.
- Notificação WhatsApp em tempo real (YCloud). Sem secrets configurados, registra
  `governance/audits/NOTIFICACAO-PENDENTE-*.md` — nunca falha em silêncio.
- Falha reversível antes da escrita = nada é gravado; irreversível/estrutural = run FAILED +
  `governance/audits/FALHA-FECHAMENTO-*.md`.
