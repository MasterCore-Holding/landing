# STATUS_VERIFICACAO_ARTEFATOS_REPO_2026-10-11

**Executor**: Córtex (serial, live checks na fonte)
**Pedido**: Lucio (11/10 19:43 BRT) — "o maestro executa a verificação no repo e devolve o reporte no _RETORNO"
**Objetivo**: mapa das evoluções da semana já no ar (base p/ msg do grupo de beta testers)

## 1. Páginas no ar (live check 19:45 BRT, todas 200)

| Artefato | URL | Estado |
|---|---|---|
| Landing Master | mastercore.app | ✅ 200 — hero "Sua ideia vira uma empresa" + DPD |
| Beta Ads (policy-safe) | mastercore.app/beta-ads.html | ✅ 200 — CTA waitlist UTM google |
| Composição Corporal (sitelink) | mastercore.app/composicao-corporal.html | ✅ 200 — "gordura e músculo" |
| Sobre (sitelink) | mastercore.app/sobre.html | ✅ 200 |
| Contato (sitelink) | mastercore.app/contato.html | ✅ 200 |
| DAIS landing | mastercore.app/dais/ | ✅ 200 |
| EngineCore (espelho) | mastercore.app/enginecore/ | ✅ 200 |
| Discovery (DPD) | mastercore.app/discovery.html | ✅ 200 |
| Lander+Qualificação | mastercore.app/lander/ + /qualificacao/ | ✅ 200 |
| EngineCore standalone | enginecore.app | ✅ 200 — "A agência que aposta no resultado" |
| EngineCore qualificação | enginecore.app/qualificacao/ | ✅ 200 |
| PeptiCore app | pepticore.app | ✅ 200 — policy-safe |
| Waitlist | pepticore.app/lista-de-espera | ✅ 200 |
| Política v1.4 | pepticore.app/politica-privacidade.html | ✅ 200 |
| Redirects go/{rede} (8) | mastercore.app/go/*/ | ✅ 200 |

## 2. Vídeos no CDN (assets/video/)
master-916.mp4 ✅ · v2-916.mp4 ✅ · v2-11.mp4 ✅ · lote-linkedin-191.mp4 ✅ (todos 200)

## 3. Evoluções da semana (05/10 → 11/10) — 30 commits
- **07/10**: DPD consolidado na landing (jargão oficial) + captura no Passo 1 (3 superfícies) + botão Avançar fix
- **09/10**: CHANCELA DEFINITIVA trinca normativos + DNA (fim dos regimes provisórios) — ledger 1.0.10
- **10/10**: DAIS landing publicada (3 versões, final = Skip higienizado); favicons/avatar/peça família (runbook 3 sites); chancela R23+R25 (FAQ 13Qs + guias); matriz captação segmentada BL-040; card IG beta segmentado; importação HubSpot+triagem emitida
- **11/10**: 3 páginas policy-safe p/ sitelinks (composição/sobre/contato); Padrão de Fechamento de Ciclo (Opção A); kill-switch + Política de Publicação v1.0 (PERFIL-ALVO); restauração do Pages404 (revert bb5a671/dc1331d); MC-VERIFY-1110

## 4. Fora do repo (outras esteiras provaram hoje)
- EngineCore GTM novo no ar (hero comercial + pacotes piso + Pacote Fundador) + Ver pacotes → #modelos + Pacote Top skin-in-the-game
- Logo PeptiCore corrigido (favicons data-URI/SVG no ar)
- v1.45.0 PeptiCore (landing captura policy-safe — simuladores removidos)
- Google Ads: Campaign #1 LIBERADA por ordem do CEO (19:43 BRT)

## 5. Pendências (não bloqueiam a msg do grupo)
- Post IG/FB compliance (decisão CEO) · Lead form PMax (print CEO) · Token Meta NUNCA (PQ-022) · NDA Dr. Bayard

**Assinatura**: Córtex — verificação executada na fonte (curl live + git log), zero memória.
