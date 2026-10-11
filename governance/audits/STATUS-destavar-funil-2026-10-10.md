# STATUS_DESTRAVAR_FUNIL_2026-10-10

**Despacho**: DESTRAVAR FUNIL (PRIORIDADE 1) — 10/10/2026 · Executor: Córtex · Modo: Assistido
**Evidência runtime por item (proposto ≠ aplicado):**

## 1. BITLY CORE — PARCIAL (bloqueio de plano)
- **Plano Core ativo** (org Oq9p26MyuWf, tier `core-dec25-annual`, US$60/ano) ✓ VERIFICADO via API Bitly.
- **Domínio go.pepticore.app = BLOQUEADO por plano**: `bitly_prevalidate_custom_domain` → 409 `MAX_ORGANIZATION_BRANDED_SHORT_DOMAINS`. Confirmando 3 fontes de pricing independentes (bitly.com/pages/pricing, bitly.com/blog/bitly-free-plan, rebrandly.com/blog/bitly-pricing): **domínio de marca começa no plano Growth (~US$29-35/mo)**; Core NÃO inclui. CNAME do GoDaddy só adiantaria depois do upgrade.
- **5 links por rede JÁ EXISTEM** (criados 25/09 e 04/10) e apontam p/ form HubSpot com UTM da rede: IG bit.ly/4yYp6TT · FB bit.ly/46Ky8YB · LI bit.ly/4iJrT2→bit.ly/4iJ5rT2 · X bit.ly/4d2MO8W · TT bit.ly/47edKiG.
- **Redirect direto SEM intersticial: VERIFICADO AO VIVO (browser)** — bit.ly/4yYp6TT → `v07sp.share.hsforms.com/2EB_Qghh...?utm_source=instagram...` e bit.ly/46Ky8YB → `...utm_source=facebook...`, ambos com `url` final direto, zero tela intermediária (a decisão Bitly 04/10 removeu o intersticial de cookies para links existentes).
- **MC-BITLY-001 (bio IG MasterCore, UTM mastercore_launch)** e **MC-BITLY-002 (story/Ads/DM)**: criados no domínio bit.ly (único disponível no plano) — ver seção de links abaixo. Migração para go.pepticore.app = 1 clique pós-upgrade Growth (destinos já preservados).

## 2. FORM HUBSPOT (PUR-04) — PUBLICADO ✓
- URL pública `https://v07sp.share.hsforms.com/2EB_QghhOSPKC9xsfFOr0uw` → HTTP 200 (live).
- Campos verificados no DOM ao vivo: Nome*, Email*, WhatsApp*, Nível* (Iniciante/Intermediário/Biohacker), Dispositivo* (Mobile/Desktop/Ambos), exames (Sangue/Genética/Bioimpedância/DEXA), consentimento WhatsApp*, LGPD*. CAPTCHA Enterprise invisível (score-based) ✓.
- **E2E automatizado: BLOQUEADO pelo reCAPTCHA** (desafio exibido ao submit a partir de IP datacenter; 2 tentativas "PULAR" não efetivaram). Prova de captura vigente = E2E humano 05/10 04:02 BRT (contato teste.e2e no CRM, UTM YouTube confirmada). **Lead humano novo = prova recomendada em aba anônima do Lucio (2 min).**

## 3. META PIXEL + EVENTO LEAD — NO AR ✓
- Produção pepticore.app: HTML com `fbq('init', 1469974055198223)` + PageView (2 ocorrências) e bundle `index-CTQkVA_5.js` (deploy 10/10 21:41) contendo evento Lead no Waitlist (regra: só status 'gravado') + gtag AW-18493068118 + ponte global.
- **Print do Gerenciador de Eventos = ação humana** (login do Lucio no Events Manager). Instalação verificada por código-fonte de produção.

## 4. CONVERSÃO GOOGLE ADS — INSTRUMENTADA ✓ / E2E DebugView = humano
- gtag AW-18493068118 + label 9vwFCLDc7o8dENaml_JE + ponte global em TODAS as rotas (fix v1.42.1) — confirmado no bundle de produção.
- E2E com lead de teste em aba anônima + DebugView = **ação humana do Lucio** (re-submit do mesmo e-mail NÃO duplica — dedupe por e-mail no backend, provado 04/10). Campanha 24311792835: monitorada; conversões rastreadas seguem 0 até tráfego retomar.

## 5. WORKFLOW PÓS-CAPTURA (BL-105) — BLOQUEADO (decisão financeira)
- Trial Marketing Hub Pro = ativação com cartão no portal HubSpot — **ação do CEO** (não executável daqui; PAT Cortex Sync sem escopo de workflows/trial).
- Spec do workflow (boas-vindas + sinalização de triagem) já entregue no handover 10/10 (barramento, commit 8891c68d). Aguardando GO do Lucio.

## 6. HIGIENIZAR BASE (BL-104) — EXECUTADO ✓ (conferido ao vivo hoje)
- CRM: **27 leads reais, 0 duplicados, 0 sem origem** (busca por lifecyclestage=lead, 21:36 UTC).
- Flávio: **JÁ CORRIGIDO** — contato 253546434361 = `flaviosilvanascimentoflavio@outlook.com` (typo @outloook eliminado na merge de 07/10; hs_additional_emails preserva o histórico), nivel=iniciante, origem=Landing Page.
- Pendente cosmético: 2 leads sem `nivel` (Nicolas hplay2827, Bayard bayardgalvao — aguardam re-submissão/DAIS).
- Fix da FONTE (Base44 registrarLeadAppsScript p/ gravar nivel/origem em leads novos): parte do roteiro importação HubSpot+triagem (barramento 98a8e761) — Fase A executada hoje pela esteira paralela.

## 7. DISPARO ORGÂNICO (LOTE CHANCELADO) — PARCIAL
- **Instagram: NO AR** — reel Manifesto V2 publicado 05/10 (instagram.com/reel/DeIBidYDTvW, copy §3 verbatim) + post novo hoje 22:32 UTC (instagram.com/p/DeVKj8BHfsJ, links bit.ly por rede + disclaimer). Ritmo ≥15 min respeitado.
- **Facebook: BLOQUEADO nesta sessão** — conector FB sem conta conectada + token de página 190/458 + token de sistema "API access blocked" (3x — re-gerar NUNCA é ação do CEO). Copy pronta no pack V2 §4.
- **LinkedIn: PÁGINA DA EMPRESA NÃO CONECTADA** (protocolo: vedado perfil pessoal). Copy pronta §2.
- **X/TikTok: MANUAIS** (API X cara — US$2/post c/ link; TikTok via widget Higgsfield). Copy pronta §§5-6.
- **Bio Instagram MasterCore**: API do IG NÃO edita bio — **ação manual do Lucio** (texto 150 car + link MC-BITLY-001 abaixo).
- **Handles verificados ao vivo**: IG @pepticore.app 200 ✓ · TikTok @pepticore.app 200 ✓ · YT @PeptiCoreApp 200 ✓ · **X @pepticore.app = 404** (handle não existe/reservado — criar no X ou escolher alternativo; ação Lucio).

## Links criados hoje (domínio bit.ly — migrar p/ go.pepticore.app pós-upgrade)
- MC-BITLY-001 — bio IG MasterCore → mastercore.app/?utm_source=instagram&utm_medium=bio&utm_campaign=mastercore_launch = **bit.ly/mastercore-bio (301 verificado ao vivo)**
- MC-BITLY-002 — story/Ads/DM → pepticore.app/lista-de-espera?utm_source=instagram&utm_medium=story&utm_campaign=mastercore_launch = **bit.ly/pepticore-story** (1ª keyword "pepi-story" criou e 404ou — recriada; não usar a antiga)

## CRITÉRIO DE ACEITE — estado
- [x] Evidência runtime por item (este arquivo)
- [x] Zero link com tela intersticial (2 testados ao vivo; demais mesma origem/plano)
- [~] Form capturando (publicado + E2E humano vigente; captcha bloqueia bot)
- [x] Pixel/gtag com evento (bundle produção)
- [ ] 5 redes publicadas (IG ok; FB/LI bloqueados por conector/token; X/TT manuais)

**Bloqueios CEO:** (1) upgrade Bitly Growth p/ go.pepticore.app; (2) re-gerar token Meta NUNCA; (3) conectar página FB + página LI ao toolkit; (4) bio IG manual; (5) handle X; (6) trial HubSpot Pro; (7) E2E DebugView humano.
