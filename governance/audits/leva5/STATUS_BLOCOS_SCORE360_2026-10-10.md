# ENTREGÁVEL R23 — BLOCOS DE TEXTO DO SCORE 360 (copy educacional blindada)
**PUR v1.0 · Origem: ADAPTA · Execução: CÓRTEX · 09/10/2026, madrugada · CHANCELADO — CEO Lucio Bicalho, 10/10/2026 (despacho no chat web)**
**Ambiente: conteúdo (sem build) · GATE de publicação: ATENDIDO (chancela CEO 10/10/2026) — registro em governance/audits/CHANCELA-R23-R25-2026-10-10.md**

> Fronteira ANVISA desenhada em cada bloco: zero alegação de saúde, cura, eficácia ou diagnóstico. Tom UAU: "entendi meu corpo pela primeira vez" — sem prometer resultado. Regra P8: sem dados → "sem dados auditáveis", nunca número artificial.

---

## PARTE 1 — BLOCOS POR MOTOR (4 blocos-mãe)

### M1 · BODY-SCAN — Composição Corporal
**Título do bloco:** "Seu corpo em números que você entende"
**Texto didático (resultado):**
"Seu Score 360 usa sua composição corporal — massa magra, massa gordura e distribuição — como uma das lentes do panorama. Não existe número 'bom' ou 'ruim' aqui: existe o seu ponto de partida, medido, registrado e comparável consigo mesmo ao longo do tempo. O que a plataforma faz é organizar essa leitura para que você e seu médico conversem com dados na mesa, não com impressões."

**"O que este número significa" (micro-texto do cartão):**
"Este score reflete a qualidade e a completude dos dados corporais que você enviou — não avalia sua saúde nem seu corpo."

**Disclaimer específico:** "Leitura educacional de composição corporal. Não avalia saúde, não diagnostica e não define metas clínicas. Discussão de metas é com seu médico."

### M2 · CLINIC-SCAN — Painel Laboratorial
**Título do bloco:** "Seus exames, traduzidos para a conversa com seu médico"
**Texto didático (resultado):**
"Cada marcador do seu exame (glicemia, lipídios, hormônios, inflamação, micronutrientes) entra no Score 360 como uma dimensão. A plataforma mostra tendências e faixas de referência educacionais — para você chegar na consulta entendendo o vocabulário do seu próprio corpo. A interpretação clínica — o que isso significa para a sua saúde e o que fazer a respeito — é exclusivamente do seu médico."

**"O que este número significa":**
"Este score mede a completude e a organização dos seus dados laboratoriais. Faixas de referência são educacionais e não substituem a leitura do seu médico."

**Disclaimer específico:** "Organização educacional de resultados laboratoriais. A plataforma não interpreta exames com finalidade diagnóstica, não emite laudo e não sugere alteração de tratamento."

### M3 · BIO-MATCHING — Perfil Genético
**Título do bloco:** "Seu DNA como contexto — não como sentença"
**Texto didático (resultado):**
"Seu relatório genético ajuda a entender predisposições — como seu corpo tende a metabolizar nutrientes e responder a estímulos. O Bio-Matching cruza esse contexto com o catálogo educacional de peptídeos e mostra, de 0 a 10, o grau de adesão conceitual entre seu perfil e cada substância estudada. Predisposição não é destino: é informação para uma conversa mais rica com quem prescreve."

**"O que este número significa":**
"Score de Adesão 0–10 = proximidade conceitual entre o perfil genético (pseudonimizado) e o mecanismo de ação descrito na literatura. Verde ≥7, amarelo 4–6, vermelho <4. É um mapa educacional, não uma recomendação."

**Disclaimer específico:** "Análise educacional de dados genéticos pseudonimizados. Não diagnostica, não prediz resultado de tratamento e não recomenda uso de qualquer substância. Decisão e dosagem: exclusivamente médico."

### M4 · GLOBAL-SCORE — Panorama 360
**Título do bloco:** "Seu panorama completo — e o que ele não é"
**Texto didático (resultado):**
"O Global-Score consolida suas dimensões em um número de 0 a 100, ponderando regulação, evidência e risco — sempre pelo elo mais fraco: uma dimensão fraca puxa o conjunto, porque é nela que mora a sua maior alavanca de melhoria. Ele existe para dar direção ao seu estudo e priorizar a conversa com o seu médico — não para resumir sua saúde em um número."

**"O que este número significa":**
"Consolidação ponderada (Regulação 50% · Evidência 40% · Risco 10%) das dimensões com dados auditáveis. Dimensões sem dados entram como 'sem dados auditáveis' — e o score exibe isso, não inventa número."

**Disclaimer específico:** "Score educacional consolidado. Não é indicador de saúde, não diagnostica, não prevê resultado e não substitui avaliação médica."

---

## PARTE 2 — BLOCOS POR DIMENSÃO DO UI (7 — código real `Score360Onboarding.jsx`, cartões da Tela 5)

Padrão de cada cartão: **label · score/10 · "o que significa" · "fonte" · disclaimer curto**.

| # | Dimensão (ID real) | Texto "o que significa" (para colar no UI) | Fonte citada (já no código) |
|---|---|---|---|
| 1 | Glicemia / HbA1c (`glicemia`) | "Reflete como seu organismo regula a glicose ao longo do tempo. É uma das dimensões mais sensíveis a sono, dieta e consistência — e uma das mais faladas nas consultas de performance metabólica." | Sinha 2021; Lind 2021 (DM-1) |
| 2 | Perfil lipídico (`lipides`) | "Mostra o equilíbrio das gorduras no sangue. Faixas de referência são educacionais — o significado clínico do seu valor pertence ao seu médico." | Jung 2022; Zhao 2021; Jin 2023 (DM-2) |
| 3 | Hormônios (`hormonios`) | "TSH/T4, testosterona, estradiol e cortisol compõem a camada de regulação hormonal. A plataforma organiza os valores; a leitura clínica é do endocrinologista." | Jansen 2024; Tanticharoenkarn 2025 (DM-3) |
| 4 | Inflamação (`inflamacao`) | "PCR e homocisteína são marcadores de inflamação sistêmica. Neste score, medem a qualidade do sinal — não fazem diagnóstico de doença." | Mehta 2025; Lakhani 2020 (DM-4) |
| 5 | Micronutrientes (`micronutrientes`) | "Vitamina D e ferritina indicam reservas que influenciam energia e recuperação. Baixo estoque de dado = dimensão marcada como 'sem dados auditáveis'." | Gaksch 2017; Theodoratou 2014 (DM-5) |
| 6 | Composição corporal (`composicao`) | "Massa muscular, gordura e água, por bioimpedância. Compare consigo mesmo ao longo do tempo — não com o corpo de outra pessoa." | Day 2018; Appl Sci 2022 (DM-6) |
| 7 | Perfil genético (`genetico`) | "Variantes ligadas à resposta metabólica (Bio-Matching). Contexto educacional — predisposição não é sentença." | Ozen 2022; Ponikowska 2025 (DM-7) |

**Estado vazio (código real — manter/reforçar):** "Aguardando exame para preencher" + "Score parcial — baseado apenas nos dados que você enviou." ✅ já conforme (P8).

---

## PARTE 3 — BLOCOS DE RESULTADO (faixas, não-prescritivos)

**Faixa ALTA (≥70/100):** "Seu panorama está completo e bem documentado. Isso não é atestado de saúde — é a melhor versão da sua conversa com o médico: dados organizados, tendências visíveis, perguntas certas na manga."

**Faixa MÉDIA (40–69):** "Você tem uma base sólida com lacunas pontuais. O caminho educacional aqui é fechar as dimensões faltantes — cada exame adicionado deixa o panorama mais nítido para você e para quem te acompanha."

**Faixa BAIXA (<40) ou dados insuficientes:** "Pouco dado, pouco panorama — e isso é honestidade do sistema, não deficiência sua. Sem dados auditáveis, o score não inventa número. Suba o que você tiver (sangue, DNA ou bioimpedância) e o mapa se constrói."

**Bloco anti-ansiedade (acolhedor, para qualquer faixa):** "Um número baixo não é um veredito sobre o seu corpo — é uma lista do que ainda falta medir. O primeiro passo da jornada é exatamente este: transformar dúvida difusa em dado concreto."

---

## PARTE 4 — DISCLAIMER PADRÃO (canônico, já em produção — manter verbatim)

1. **DisclaimerBar (UI):** "Conteúdo meramente educacional e informativo. Não constitui aconselhamento médico ou prescrição de qualquer natureza. Consulte sempre um profissional de saúde legalmente habilitado." ✅ presente em todas as telas do Score 360.
2. **DISCLAIMER (outputs IA):** "Conteúdo educacional — não substitui prescrição médica. Use como referência para discussão com seu médico." ✅ presente nos motores.
3. **Badge Tela 1:** "Plataforma educacional · Não-prescritiva" ✅ presente.

## PARTE 5 — AUDIT DE FRONTEIRA (checklist ANVISA aplicado aos blocos acima)

- [x] Zero alegação de saúde/cura/eficácia/tratamento em qualquer bloco novo
- [x] Zero verbo prescritivo (usar/tomar/injetar/dosar) — verbos usados: entender, organizar, comparar, conversar
- [x] Zero "recomendado para você" — substituído por "proximidade conceitual"/"contexto educacional"
- [x] Todo bloco fecha com remissão ao médico (condição (a)-(f) do Parecer Legal)
- [x] Regra P8 respeitada: estado vazio nomeado, sem zero artificial
- [x] Tom UAU preservado: linguagem de clareza ("a gente te mostra"), não de promessa

**Ressalva de execução:** validação ANVISA formal = comitê (Dr. Ricardo + CMO + Dra. Patricia) — GATE HUMANO. Estes blocos chegam pré-auditados pelo Córtex; chancela CEO de publicação permanece intocada.

## RASTREABILIDADE
- Código auditado: `src/pages/Score360Onboarding.jsx` (30.479 B), `base44/shared/iaUtils.ts` (DISCLAIMER/PROMPT_BASE), `base44/shared/globalScore.ts`, `base44/functions/analisarBioMatching/entry.ts`
- Normativos: Spec 360 v1.0 §1-§4 · Parecer Legal P0 §3-§5 · Núcleo Universal v1.2 (P8) · MC-DNA-001
