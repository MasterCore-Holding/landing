# ÍNDICE — R25 · BASE DE CONTEÚDO EDUCACIONAL (FAQ + GUIAS + MELHORES PRÁTICAS)
**PUR v1.0 · Origem: ADAPTA · Execução: CÓRTEX · 10/10/2026 · Ambiente: conteúdo (sem build) · GATE: publicação exige chancela CEO (Adendo 2)**

## ENTREGÁVEIS (3 arquivos)
1. `faq-peptideos.md` — 13 perguntas educacionais (o que são peptídeos, venda/prescrição, Score 360, Bio-Matching, IA, ANVISA, riscos, LGPD, beta, preço, anabolizante ≠ peptídeo). Complementa o FAQ de landing existente (5 Qs de marketing em `FAQ.jsx`) — sem duplicação.
2. `guias-11-categorias.md` — 1 guia por categoria canônica (enum real do banco `Peptideo.jsonc`, ordem B10/v1.4.81): o que a categoria estuda, mecanismos gerais por nível de evidência, o que a plataforma faz/NÃO faz, remissão ao médico. Oncologia com restrição máxima.
3. `melhores-praticas-reconstituicao-aplicacao.md` — física/bioquímica da reconstituição e armazenamento como CONCEITO (Arrhenius, pH, cadeia de frio, RDC 304/2019), procedência e NOTIVISA. Linha dura: zero técnica de uso, zero veículo/volume, zero fornecedor.

## CRITÉRIOS DE ACEITE — status
- [x] Base completa (FAQ 13 Qs + 11 guias + melhores práticas)
- [x] Fronteira ANVISA desenhada em cada bloco (audit de verbos: estudo ≠ uso; zero dose/via/fornecedor/promessa)
- [x] Referências científicas visíveis (fontes DM-1..DM-7 do Parecer Científico v1.0 citadas; níveis de evidência marcados por categoria)
- [x] Disclaimer canônico em todo conteúdo
- [ ] Validação ANVISA formal pelo comitê (Dr. Ricardo + CMO + Dra. Patricia) = GATE HUMANO — conteúdo chega pré-auditado pelo Córtex
- [ ] Chancela CEO de publicação

## DESTINO PÓS-CHANCELA (quando o CEO abrir o Gate)
- FAQ → página educacional do app (nova rota) + base do FAQ-bot do grupo do beta
- Guias → seção "Estudar por categoria" do catálogo
- Melhores práticas → módulo educacional pós-onboarding

## RASTREABILIDADE
- Enum categorias: `base44/entities/Peptideo.jsonc` + `src/lib/categoriaMap.js` (lidos na fonte 10/10)
- FAQ existente: `src/components/landing/FAQ.jsx` (5 Qs — mantido, sem conflito)
- Normativos: RDC 18/1999 · NT 43/2025 · LGPD Art. 11 · Lei 12.842/2013 · Núcleo Universal v1.2 (P8)
- Relacionados: R23 (blocos Score 360 — mesmo padrão de fronteira) · STATUS_BLOCOS_SCORE360 (mesma leva)
