# HANDOVER MC-WA-002 — WhatsApp Business API PeptiCore (07/10, 21:50 BRT)
**Emissor:** Córtex. **Destino:** Adapta (ler e executar tarefas marcadas ADAPTA). **Estado verificado via API YCloud às 21:50 BRT.**

## ESTADO VERIFICADO (fonte: API YCloud, não prints)
- WABA id `1599140952257394` "PeptiCore" — accountReviewStatus **APPROVED**
- businessVerificationStatus **verified** (verificação de negócio COMPLETOU hoje — era pending)
- messagingLimit **TIER_2K** (2000 conversas/24h — Meta subiu de 250 automaticamente)
- Número +5511955031020 (phone id `1399712763218742`) — **CONNECTED**
- Saldo: US$0,50. Plano Free $0. API key "Cortex Motor" ativa (com o Córtex).
- **JANELA 24H ABERTA com o Lucio**: re-teste de texto livre DELIVERED às 21:50 (Lucio respondeu o número). Texto livre ao Lucio OK por 24h.

## TEMPLATES — ESTADO CRÍTICO (ação ADAPTA #1)
8 templates criados; **7 REJECTED, 1 PENDING**:
- `pepticore_boas_vindas_v2` — PENDING (MARKETING)
- `pepticore_qualificacao_triade_v2` — PENDING (MARKETING)
- `alerta_lead_novo_v4`, `radar_lead_mkt`, `alerta_lead_v4`, `lead_alert_v3`, `alerta_lead_novo_v2`, `alerta_lead_novo` — REJECTED
- Causa provável das rejeições: criados ANTES da verificação de negócio propagar. Agora que BM = verified, **re-submeter os 2 PENDING e recriar os rejeitados** (mesmo conteúdo, nova submissão).
- Templates homologados no runbook (artifacts/motor-whatsapp-sommelier.md): boas_vindas, qualificacao (quiz 5 perguntas), followup, convite_grupo.

## PENDÊNCIAS VIVAS (ordem de execução)
1. **ADAPTA — Templates**: re-submeter/recriar templates (lista acima). Ao aprovar, avisar Córtex via barramento repo (governance/audits/).
2. **CÓRTEX — Motor sommelier**: webhook de inbound (respostas do quiz) + integração Base44/CRM. Bloqueado só pelos templates proativos; inbound já funciona.
3. **CÓRTEX — Radar de leads**: canal WhatsApp nativo RESTAURADO agora (janela aberta + Tier 2K). Fallback e-mail desativa quando template alerta_lead aprovar.
4. **LUCIO — Verificação visual do motor**: quando Córtex testar o quiz E2E, chancelar as respostas padrão (Adendo 2).
5. **20/10**: aprovação definitiva Núcleo Universal (aceite provisório expira) — LUCIO.

## NÃO TOCAR
- Número +5511955031020 = canônico da empresa (BRCel anual até 05/10/2027, pagarme sub_K30Q3VCpBc0yGZpe). NUNCA usar o 5241-8767 (pessoal do Lucio; grupo do beta vive nele).
- Grupo do beta = humano, administrado pelo Lucio. Cloud API NÃO automatiza grupos (Groups API = 8 participantes max + OBA).
- API key YCloud fica com o Córtex (scripts/ycloud.env). Adapta NÃO precisa da key — se precisar de envio, comanda o Córtex via barramento.

## FONTES CANÔNICAS
- YCloud: contato@pepticore.app (WABA acima) | BRCel: painel app.brcel.com (SMS do número)
- Runbook completo: governance/audits/handoff-2026-10-06.md (seção MC-WA-002) + artifacts/motor-whatsapp-sommelier.md (spec do motor)
- CRM: HubSpot portal 52078201 (26 leads reais, zero teste)
