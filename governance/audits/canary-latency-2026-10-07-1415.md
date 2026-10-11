# CANARY DE LATÊNCIA — teste do webhook Nível 3
**Commitado em:** 2026-10-07T14:14:16-03:00 (BRT) · **Por:** Córtex · **Objetivo:** medir se o webhook do repo existe

Este arquivo é um teste e pode ser deletado após a leitura.

**Protocolo:**
- Se este evento chegou ao Córtex via WEBHOOK (segundos após o commit) → webhook do repo = ATIVO (Nível 3 pleno).
- Se chegou só via CRON 15min (poll das 14:21) → webhook = NÃO criado ainda (ação do CEO pendente).
- Diferença de tempo entre este timestamp e a hora de processamento = latência real do barramento.

Nenhuma ação além de registrar o veredito. Não notificar o CEO por isto (ele já sabe do teste).
