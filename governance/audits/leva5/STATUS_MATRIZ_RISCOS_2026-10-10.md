# ENTREGÁVEL R28 — MATRIZ DE RISCOS REGULATÓRIOS (ANVISA + LGPD) — PRÉ-BETA
**PUR v1.0 · Origem: ADAPTA · Execução: CÓRTEX · 09/10/2026, madrugada**
**Ambiente: conteúdo · GATE: decisões de mitigação = chancela CEO**

> Alinhada ao Núcleo Universal v1.2 (faixas de risco + 4 gates humanos), Spec 360 §4 e Parecer Legal P0. Pronta para o beta (20 testers) e para o Data Room. Escala: Probabilidade (B/M/A) × Impacto (1-5). Dono = responsável pela mitigação. Gate = onde o humano decide.

## 1. RISCOS ANVISA / SANITÁRIOS

| # | Risco | Prob. | Impacto | Mitigação | Dono | Gate |
|---|---|---|---|---|---|---|
| A1 | Alegação de saúde/cura/eficácia em copy ou output de IA (propaganda irregular de produto sem registro) | M | 5 | Blocos pré-auditados (R23/R25) com verbos de estudo; DISCLAIMER em todo output; varreduraRegulatoria semanal; firewall interno/externo de linguagem | CÓRTEX (produção) + Comitê Científico (homologação) | Chancela CEO p/ qualquer copy nova |
| A2 | Caracterização de prescrição automática (exercício ilegal da medicina — Lei 12.842/2013) | B | 5 | Travas semânticas do Acolhedor; zero dose de uso em UI; calculadora = matemática de conversão; disclaimers nos 8 funis de IA | CÓRTEX (engenharia) | Gate médico: toda validação de protocolo = médico credenciado |
| A3 | Usuário interpreta Score/Bio-Matching como recomendação de uso | M | 4 | Blocos "o que este número NÃO é" (R23); semáforo educacional; "predisposição ≠ sentença" em todo output genético | CÓRTEX (UX) | Comitê Científico homologa linguagem |
| A4 | Comércio/indicação de manipulados irregulares (REs 1.683/1.684-2026) | B | 5 | Plataforma não vende, não linka compra, não sugere fornecedor; FAQ Q13 explícito | CÓRTEX (produto) | Jurídico aprova qualquer integração futura (farmácia parceira = P2 c/ parecer próprio) |
| A5 | Suplemento fora da IN 470/2026 no catálogo educacional | B | 3 | Campo status_regulatorio por item; revisão do catálogo pelo comitê; alertas ANVISA monitorados | CÓRTEX (dados) | Comitê Científico |
| A6 | Conteúdo de "dois pesos" (língua interna vazada p/ público — promessa de UAU/resultado) | M | 3 | Firewall de linguagem (nomes internos ≠ camada externa); revisão de strings públicas no CI | CÓRTEX (engenharia) | Chancela CEO p/ comunicados |

## 2. RISCOS LGPD / DADOS SENSÍVEIS (Art. 11)

| # | Risco | Prob. | Impacto | Mitigação | Dono | Gate |
|---|---|---|---|---|---|---|
| L1 | Tratamento de dado sensível sem consentimento específico e destacado no momento da coleta | B | 5 | Consentimento por pilar na Fase 0 (checkbox explícito por dado); ConsentimentoRegulatorio com trilha (data/versão/escopo); e2e cobre consentimento antes do botão | CÓRTEX (engenharia) + DPO | Parecer Legal valida fluxo; chancela CEO p/ beta |
| L2 | Vazamento de dado genético/imagem corporal (Art. 11) | B | 5 | Contêiner isolado + criptografia ponta a ponta; signed URL ≤15min (código real); RLS owner-based; vedação de bancos comuns | CÓRTEX (infra) | Auditoria de segurança pré-beta (R26) + chancela CEO |
| L3 | PII indo para API de IA externa sem pseudoanonimização | B | 5 | pseudoAnonymizeUser() no código real de todos os motores; hash de entrada; revisão de payload no CI | CÓRTEX (engenharia) | Auditoria Vitor (AppSec) |
| L4 | Incidente de segurança sem comunicação à ANPD | B | 5 | Protocolo Res. CD/ANPD 15/2024: ANPD em 3 dias úteis + titulares; runbook de incidente documentado | DPO + CÓRTEX | Comitê de crise (CEO) |
| L5 | Purge/incidente de dados de tester sem registro auditável | B | 3 | PurgaExecucao (entidade admin-only, já no código); purge em 30 dias; /meus-dados | CÓRTEX (ops) | Chancela CEO p/ purge em massa |
| L6 | Transferência internacional de dados sem base (Res. 19/2024) | B | 4 | Geo-phase Fase 1 = Brasil; revisão dos provedores de IA/storage; cláusulas contratuais padrão quando aplicável | DPO | Parecer Legal |
| L7 | Menor de idade no beta | B | 4 | Idade no onboarding; consentimento específico; triagem | CÓRTEX (produto) | Termos de uso revisados pelo jurídico |

## 3. RISCOS DE COMUNICAÇÃO / POSICIONAMENTO

| # | Risco | Prob. | Impacto | Mitigação | Dono | Gate |
|---|---|---|---|---|---|---|
| C1 | Motores de IA comunicados como "gratuitos" quando são GOLD | M | 3 | Copy de planos alinhada ao modelo FREE→GOLD (Degustação); revisão de strings de plano | CÓRTEX (produto) | Chancela CEO p/ pricing copy |
| C2 | Lema interno ("One Person Unicorn") ou jargão de governança vazados ao público | M | 2 | Firewall de linguagem; docs públicos revisados; zero jargão em UI | CÓRTEX (conteúdo) | Chancela CEO |
| C3 | Influencer/afiliado prometendo resultado em nome da marca | A | 4 | Termos de afiliado c/ cláusula de conformidade ANVISA; monitoramento de menções; banimento por violação | CÓRTEX (partners) | Jurídico aprova termos; CEO chancela programa |
| C4 | Imprensa/SCPV interpretando plataforma como clínica | B | 3 | Posicionamento único em todo material: "plataforma educacional apoiada por IA"; página "O que somos/não somos" | CÓRTEX (comunicação) | CEO |

## 4. RISCOS CLÍNICOS/ÉTICOS (CFM/CFP) — transversais

| # | Risco | Prob. | Impacto | Mitigação | Dono | Gate |
|---|---|---|---|---|---|---|
| E1 | Acolhedor assumindo papel de psicólogo (Lei 4.119/1962 + Código Ética CFP) | M | 5 | Travas semânticas absolutas (não-diagnóstico/não-promessa); psicoeducação apenas; triagem c/ escalação CVV 188 | CÓRTEX (engenharia) + CMO | Homologação LEGAL+CMO pré-lançamento (condição do Parecer) |
| E2 | Triagem de risco falhando (ideação/autolesão) | B | 5 | Escalação compulsória + CVV 188 no fluxo (spec); testes de triagem no beta; SLA 3h de escalação | CÓRTEX (engenharia) + coordenação clínica | Comitê Científico valida fluxo |
| E3 | Usuário com condição clínica grave sem adequate triagem | M | 4 | Pilar IV (medicamentos) + Pilar V (psicológico) na Fase 0; alertas de interferência educacionais | CÓRTEX (produto) | CMO |

## 5. GATE-CHAVE DO BETA (resumo executivo p/ Data Room)

**Os 4 gates humanos intocáveis (Núcleo Universal v1.2) + 3 específicos do beta:**
1. Saúde (Art. 20 LGPD — decisão clínica): médico credenciado, sempre.
2. Jurídico: Parecer Legal pré-deploy (favorável condicionado — condições (a)-(f) listadas).
3. Financeiro: tetos de inferência/custo de IA.
4. Societário: separação plataforma × prescrição (ética médica).
5. **Abertura do beta (20 testers): chancela CEO** (após R26 verde + homologações).
6. **Dados genéticos reais dos testers: chancela CEO** (Art. 11 — pilar Bio-Matching).
7. **Qualquer comunicação pública nova: chancela CEO** (Adendo 2).

**Regra de ouro da matriz:** risco B×5 ou M×4+ exige mitigação ativa ANTES do beta; risco A×4+ exige plano de contingência documentado. Nada nesta matriz é residual aceitável sem dono e gate.

## RASTREABILIDADE
- Normativos: Spec 360 §4 (ANVISA 2026, LGPD, Res. ANPD 15/2024 e 19/2024) · Parecer Legal P0 (condições a-f) · Núcleo Universal v1.2 · MC-DNA-001.
- Código auditado (mitigações já no sandbox): RLS 31/32, pseudoAnonymizeUser, signed URL 900s, ConsentimentoRegulatorio, PurgaExecucao, respostaBeta 10/5min, registrarLead 429, e2e/red-flag-engine.spec.js.
- Uso: Data Room, onboarding de parceiros, checklist de abertura do beta.
