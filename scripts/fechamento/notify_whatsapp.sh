#!/usr/bin/env bash
# notify_whatsapp.sh — notificação WhatsApp em tempo real (Etapa 3). Nunca falhar em silêncio:
# sem secrets configurados ou com falha de envio, registra auditoria NOTIFICACAO-PENDENTE e commita.
set -uo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
STAMP="$(date -u +%Y%m%d-%H%M%SZ)"
AUD="governance/audits"
mkdir -p "$AUD"

MSG="${NOTIF_WHATSAPP:-}"
if [ -z "$MSG" ]; then
  if [ "${WF_CONCLUSION:-}" = "success" ]; then
    MSG="✅ *Fechamento de ciclo concluído* — detalhes no run."
  else
    MSG="❌ *Fechamento de ciclo FALHOU* (${WF_CONCLUSION:-desconhecido}) — ver run."
  fi
fi
MSG="${MSG} — ${RUN_URL:-sem URL}"

env_ok() { [ -n "${YCLOUD_API_KEY:-}" ] && [ -n "${YCLOUD_WABA_NUMBER:-}" ] && [ -n "${CEO_WHATSAPP:-}" ]; }

OK=0
if env_ok; then
  BODY=$(python3 -c 'import json,sys; print(json.dumps(sys.argv[1]))' "$MSG")
  for i in 1 2 3; do
    RESP=$(curl -sS --max-time 25 -X POST "https://api.ycloud.com/v2/whatsapp/messages/sendDirectly" \
      -H "X-API-Key: ${YCLOUD_API_KEY}" -H "Content-Type: application/json" \
      -d "{\"from\":\"${YCLOUD_WABA_NUMBER}\",\"to\":\"${CEO_WHATSAPP}\",\"type\":\"text\",\"text\":{\"body\":${BODY}}}" 2>/dev/null || true)
    if echo "$RESP" | grep -q '"id"'; then
      OK=1
      echo "WhatsApp enviado: $RESP"
      break
    fi
    sleep 3
  done
fi

if [ "$OK" != "1" ]; then
  {
    echo "# NOTIFICACAO-PENDENTE-$STAMP"
    echo "- O fechamento rodou, mas a notificação WhatsApp NÃO partiu (secrets ausentes ou falha de envio — Etapa 3: nunca falhar em silêncio)."
    echo "- Mensagem pendente: \`$MSG\`."
    echo "- Ação: configurar secrets \`YCLOUD_API_KEY\`, \`YCLOUD_WABA_NUMBER\`, \`CEO_WHATSAPP\` (Settings > Secrets and variables > Actions) ou reenviar manualmente."
  } > "$AUD/NOTIFICACAO-PENDENTE-$STAMP.md"
  git add "$AUD/NOTIFICACAO-PENDENTE-$STAMP.md"
  git commit -m "auditoria: notificação WhatsApp pendente ($STAMP)"
  git push
  echo "NOTIFICAÇÃO PENDENTE registrada em $AUD/NOTIFICACAO-PENDENTE-$STAMP.md"
  exit 0
fi
