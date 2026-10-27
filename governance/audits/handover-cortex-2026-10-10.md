# HANDOVER CÓRTEX → ADAPTA — 10/10/2026 ~09:00 BRT

## 1. Placar conectores: 13/14 verdes
- Pendente único: **Meta Ads token**. Token atual morto (API access blocked / sessão expirada 08/10 14h).
- Desbloqueio em curso (CEO): atribuir função **Admin** ao usuário do sistema Cortex no app **PeptiCore App (122105628627487385)** → gerar token 60 dias com 6 escopos (ads_management, ads_read, business_management, pages_read_engagement, pages_manage_posts, pages_show_list).
- Janela "Nenhuma permissão disponível" = app sem função atribuída ao usuário do sistema (não é regressão).

## 2. Google Ads (campanha 24311792835 — PeptiCore)
- Status: ENABLED. 06–10/10: 436 cliques, 0 conversões rastreadas.
- Fix gtag v1.42.1 no ar (rota /lista-de-espera coberta). Monitor 2h ativo: 1ª conversão → alerta WhatsApp + auto-remove.
- Resíduo cosmético: budget órfão R$0,01 (sem risco).

## 3. Ponte Córtex ↔ Adapta (Nível 3 — repo = fila única de comandos)
- Webhook GitHub→Córtex: VIVO (ping recebido 14:20, hook_id 12345). Aguardando 1º push real da Adapta p/ prova E2E.
- Volta Córtex→Adapta: PULL no início do turno (webhook de saída Adapta 401 — pendência da plataforma deles).
- Drive = só artefatos. INBOX Drive rejeitado (violaria Diretriz v2.0 §4).

## 4. Chancelas pendentes do CEO
1. **2 previews de qualificação** (Master 10→7 passos; Engine 5→6) → libera MC-QUALIF-REV-001.
2. Token Meta Ads 60 dias (em curso).

## 5. Pendências Adapta (prazo 20/10)
1. Implementar **MC-QUALIF-REV-001** pós-chancela (directive + handover: commits bce17a6f + 756176d3 neste diretório).
2. Entregar fontes pendentes.
3. Resolver webhook 401 de saída.

## 6. P-QUEUE (Drive) — cauda relevante
- PUR-04: publicar form HubSpot (gate LGPD).
- BL-001..BL-015: backlog Consolidação Estratégica (personas Adapta/Base44).
- PQ-006 resolvida de facto: 4 templates pepticore_*_v2 APPROVED na WABA.
- PQ-009: re-upload V2 YouTube (voz nova). PQ-013: DNS enginecore.com.br.

## 7. WABA (YCloud)
- 4× pepticore_*_v2 APPROVED · 4× cortex_* PENDING (aguardando Meta) · saldo US$10,50.

## 8. Housekeeping Córtex (esteira própria)
- 4 crons duplicados/zumbis removidos — frota: 7 ativos, 1 função cada.
- TODO: receptor N3 registrar (não ignorar) pushes próprios; budget órfão no console Ads.

— Córtex (control plane MasterCore)