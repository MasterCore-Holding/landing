#!/usr/bin/env bash
# close_cycle.sh — mecânica de fechamento do ciclo (Padrão Opção A).
# Roda no GitHub Actions com checkout do repo. Depende de: git, jq, python3, curl.
# Falha reversível (validação) = exit 1 antes de qualquer escrita. Irreversível = run FAILED + auditoria.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
CYCLE="_RETORNO/ciclo.json"
LEDGER="ledger/system-ledger.json"
CHANGELOG="CHANGELOG.md"
AUD="governance/audits"
TELEMETRIA="governance/telemetria/contrapesos.jsonl"
STAMP="$(date -u +%Y%m%d-%H%M%SZ)"
NOW_ISO="$(date +%Y-%m-%dT%H:%M:%S%:z)"

echo "== 0. Preparação =="
mkdir -p "$AUD" governance/telemetria _RETORNO/arquivo
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

echo "== 1. Origem do push (nunca aceitar push não autenticado) =="
ALLOWED_EMAILS="pepticoreapp@gmail.com|contato@mastercore.app|agent@picoclaw.local"
AUTHOR_EMAIL="$(git log -1 --format='%ae')"
COMMITTER_EMAIL="$(git log -1 --format='%ce')"
if ! echo "$AUTHOR_EMAIL" | grep -Eq "^($ALLOWED_EMAILS)$" || ! echo "$COMMITTER_EMAIL" | grep -Eq "^($ALLOWED_EMAILS)$"; then
  echo "BLOQUEIO: autor/committer não autorizado ($AUTHOR_EMAIL / $COMMITTER_EMAIL)."
  echo "# BLOQUEIO-ORIGEM-$STAMP" > "$AUD/BLOQUEIO-ORIGEM-$STAMP.md"
  echo "- Push de _RETORNO com autor fora da allowlist. Autor: \`$AUTHOR_EMAIL\` · Committer: \`$COMMITTER_EMAIL\`." >> "$AUD/BLOQUEIO-ORIGEM-$STAMP.md"
  echo "- Allowlist vigente: \`$ALLOWED_EMAILS\`. Evolução futura: assinatura HMAC do payload (Padrão Opção A §5)." >> "$AUD/BLOQUEIO-ORIGEM-$STAMP.md"
  git add "$AUD"; git commit -m "auditoria: bloqueio de origem — push não autenticado em _RETORNO ($STAMP)"; git push
  echo "NOTIF_WHATSAPP=🚨 *Fechamento BLOQUEADO* — push de _RETORNO com autor não autorizado (\`$AUTHOR_EMAIL\`). Auditoria: BLOQUEIO-ORIGEM-$STAMP" >> "$GITHUB_ENV"
  exit 1
fi
echo "Origem OK: $AUTHOR_EMAIL"

echo "== 2. Sanitização (Art. 11 LGPD) =="
python3 scripts/fechamento/sanitize_check.py "$CYCLE" || {
  echo "BLOQUEIO: conteúdo sensível detectado no _RETORNO — ciclo NÃO fechado."
  cp "$CYCLE" "$AUD/CICLO-REJEITADO-SANITIZACAO-$STAMP.json"
  git add -A; git commit -m "auditoria: ciclo rejeitado por sanitização ($STAMP)"; git push
  echo "NOTIF_WHATSAPP=🚨 *Fechamento BLOQUEADO* — dados sensíveis (Art. 11 LGPD) no _RETORNO/ciclo.json. Auditoria: CICLO-REJEITADO-SANITIZACAO-$STAMP" >> "$GITHUB_ENV"
  exit 1
}

echo "== 3. Validação do schema =="
python3 scripts/fechamento/validate_retorno.py "$CYCLE" || {
  echo "Schema inválido — ciclo NÃO fechado."
  cp "$CYCLE" "$AUD/CICLO-REJEITADO-SCHEMA-$STAMP.json"
  git add -A; git commit -m "auditoria: ciclo rejeitado por schema inválido ($STAMP)"; git push
  echo "NOTIF_WHATSAPP=🚨 *Fechamento BLOQUEADO* — _RETORNO/ciclo.json fora do schema. Auditoria: CICLO-REJEITADO-SCHEMA-$STAMP" >> "$GITHUB_ENV"
  exit 1
}

echo "== 4. Gates de Controle (bloqueio mecânico) =="
GATES=$(python3 scripts/fechamento/check_gates.py "$CYCLE")
if [ "$GATES" != "nenhum" ]; then
  echo "GATE DE CONTROLE acionado: $GATES — ciclo NÃO fechado; escala ao CEO."
  {
    echo "# BLOQUEIO-GATE-$STAMP"
    echo "- Runbook: \`$(jq -r '.versao_runbook' "$CYCLE")\` · Executor: \`$(jq -r '.executor' "$CYCLE")\`."
    echo "- Gates acionados: **$GATES** (bloqueio mecânico — intervenção exclusiva do CEO)."
    echo "- Blocos com gate: \`$(python3 scripts/fechamento/check_gates.py "$CYCLE" --blocos)\`."
    echo "- Resumo do ciclo: $(jq -c '.resumo' "$CYCLE")"
    echo "- O ciclo permanece em _RETORNO/ciclo.json aguardando decisão do CEO (não arquivado, não fechado)."
  } > "$AUD/BLOQUEIO-GATE-$STAMP.md"
  cp "$CYCLE" "$AUD/CICLO-BLOQUEADO-GATE-$STAMP.json"
  git add -A; git commit -m "governança: BLOQUEIO de Gate de Controle ($GATES) — escala ao CEO ($STAMP)"; git push
  echo "NOTIF_WHATSAPP=🚨 *Fechamento BLOQUEADO* — Gate de Controle acionado: *$GATES*. Intervenção exclusiva do CEO. Auditoria: BLOQUEIO-GATE-$STAMP" >> "$GITHUB_ENV"
  exit 1
fi
echo "Gates: nenhum."

echo "== 5. Ler ledger + changelog (read-before-write) =="
CUR_VER=$(jq -r '.currentVersion' "$LEDGER")
echo "Ledger atual: $CUR_VER"
TIPO=$(jq -r '[.blocos[].tipo // empty] | if length > 0 then .[0] else empty end' "$CYCLE")
FALHAS=$(jq -r '.resumo.falhas' "$CYCLE")
if [ -z "$TIPO" ]; then
  if [ "$FALHAS" = "0" ]; then TIPO="feature"; else TIPO="fix"; fi
fi
if [ "$TIPO" = "sync" ]; then
  NEW_VER="$CUR_VER"
  BUMP_KIND="sem-bump (reparo de sync)"
elif [ "$TIPO" = "fix" ]; then
  NEW_VER="$(echo "$CUR_VER" | awk -F. '{printf "%d.%d.%d", $1, $2, $3+1}')"
  BUMP_KIND="patch"
else
  NEW_VER="$(echo "$CUR_VER" | awk -F. '{printf "%d.%d.%d", $1, $2+1, 0}')"
  BUMP_KIND="minor"
fi
echo "Tipo: $TIPO → bump: $BUMP_KIND ($CUR_VER → $NEW_VER)"

echo "== 6. Fechamento de pendências =="
PEND_FECHADAS=$(python3 scripts/fechamento/close_pendencias.py "$CYCLE" "$LEDGER" "$NEW_VER" "$NOW_ISO")
echo "Pendências fechadas: ${PEND_FECHADAS:-nenhuma}"

echo "== 7. Atualizar ledger =="
TMP=$(mktemp)
jq --arg v "$NEW_VER" --arg d "$NOW_ISO" --arg t "$TIPO" --arg ex "$(jq -r '.executor' "$CYCLE")" \
   --arg rb "$(jq -r '.versao_runbook' "$CYCLE")" --argjson p "$(jq -c '[.blocos[] | {id, nome, status, evidencia, gate_controle}]' "$CYCLE")" \
   --arg pf "$PEND_FECHADAS" '
  .currentVersion = $v |
  .entries = [ (({
    version: $v,
    date: $d,
    type: (if $t == "sync" then "SYNC" elif $t == "fix" then "FIX" else "FEATURE" end),
    description: ("Fechamento automatico de ciclo (Padrao Opcao A) — runbook v" + $rb + " executado por " + $ex + ". Blocos: " + ($p | map(.id + ":" + .status) | join(", ")) + "."),
    blocos: $p
  }) + (if $pf != "" then {pendencias_fechadas: ($pf | split(","))} else {} end)) ] + .entries' "$LEDGER" > "$TMP"
mv "$TMP" "$LEDGER"

echo "== 8. Atualizar CHANGELOG =="
if [ "$TIPO" != "sync" ]; then
  BLOCOS_MD=$(jq -r '.blocos[] | "- **\(.id) \(.nome)** — \(.status): \(.evidencia)"' "$CYCLE")
  {
    echo "## [$NEW_VER] - $(date -u +%Y-%m-%d)"
    echo ""
    echo "### Fechamento automático de ciclo (Padrão Opção A)"
    echo "$BLOCOS_MD"
    echo ""
    echo "*Runbook v$(jq -r '.versao_runbook' "$CYCLE") · Executor: $(jq -r '.executor' "$CYCLE") · Fechamento: github-actions[bot] — $(date -u +%Y-%m-%dT%H:%M:%SZ).*"
    echo ""
    cat "$CHANGELOG"
  } > "$CHANGELOG.new"
  mv "$CHANGELOG.new" "$CHANGELOG"
fi

echo "== 9. Telemetria dos 4 contrapesos =="
python3 scripts/fechamento/telemetria.py "$CYCLE" >> "$TELEMETRIA"

echo "== 10. Auditoria do fechamento =="
{
  echo "# FECHAMENTO-CICLO-$STAMP"
  echo "- Runbook v$(jq -r '.versao_runbook' "$CYCLE") · Executor: $(jq -r '.executor' "$CYCLE") · Origem: $AUTHOR_EMAIL."
  echo "- Bump: $CUR_VER → $NEW_VER ($BUMP_KIND)."
  echo "- Resumo: concluídos=$(jq -r '.resumo.concluidos' "$CYCLE") · falhas=$FALHAS · pendentes=$(jq -r '.resumo.pendentes' "$CYCLE") · gates=nenhum."
  echo "- Pendências fechadas: ${PEND_FECHADAS:-nenhuma}."
  echo "- Telemetria: $TELEMETRIA (linha nova)."
  echo "- Integridade: sha256 do ciclo = $(sha256sum "$CYCLE" | cut -d' ' -f1)."
} > "$AUD/FECHAMENTO-CICLO-$STAMP.md"

echo "== 11. Arquivar ciclo + commit =="
RB_VER="$(jq -r '.versao_runbook' "$CYCLE")"
BLOCOS_SUM="$(jq -r '[.blocos[] | "\(.id):\(.status)"] | join(" · ")' "$CYCLE")"
mv "$CYCLE" "_RETORNO/arquivo/ciclo-$STAMP.json"
git add -A
git commit -m "chore(ciclo): fechamento automático $CUR_VER → $NEW_VER ($BUMP_KIND) — runbook v$RB_VER [$STAMP]"
git push
echo "Fechamento concluído: $CUR_VER → $NEW_VER ($BUMP_KIND). Pendências fechadas: ${PEND_FECHADAS:-nenhuma}."
echo "NOTIF_WHATSAPP=✅ *Ciclo fechado automaticamente* — bump $CUR_VER → $NEW_VER ($BUMP_KIND). Blocos: $BLOCOS_SUM. Pendências fechadas: ${PEND_FECHADAS:-nenhuma}. Auditoria: FECHAMENTO-CICLO-$STAMP" >> "$GITHUB_ENV"
