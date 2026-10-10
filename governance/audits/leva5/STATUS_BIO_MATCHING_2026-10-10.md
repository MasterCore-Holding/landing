# STATUS_BIO_MATCHING_2026-10-09 — R24 · Validação do Bio-Matching (dados sintéticos, HML)
**PUR v1.0 · Origem: ADAPTA · Execução: CÓRTEX (estática+despacho) · Base44/builder (runtime)**
**Ambiente: HML · Zero dado real tocado · GATE: dados genéticos reais dos testers = chancela CEO (Art. 11)**

## 1. O QUE FOI VALIDADO PELO CÓRTEX (estático — código real do sandbox, app 6aa5de150c00f5441756ffe0)

### 1.1 Arquitetura do motor (lida na fonte)
- **Função:** `base44/functions/analisarBioMatching/entry.ts` (5.618 B)
- **Gate de plano:** `isGoldPlan(user.plano)` → 403 "Plano GOLD necessário" (motor GOLD, coerente com "Degustação FREE→GOLD")
- **Anti-IDOR:** posse verificada — `FileUpload.filter({user_id: user.id, file_uri})` → 403 "Arquivo não pertence ao usuário"
- **Documento de saúde:** signed URL de curta duração `expires_in: 900` (≤15 min) — nunca storage público
- **Pseudoanonimização:** `pseudoAnonymizeUser(user)` injetado no prompt (idade/peso/IMC/objetivo; PII removida)
- **Cache:** `hash_entrada = sha256(file_uri|user_id)`; resultado cacheado por hash+user (CacheAnalise, RLS owner)
- **Saída estruturada:** schema JSON com `peptideos_sugeridos[{peptideo_id, nome, score_adesao 0-10, status ativo/pendente, justificativa}], score_geral, analise_texto, nivel_confianca alta/média/baixa, referencias[], analise_indisponivel` — zero campo de dose/prescrição no schema (blindagem estrutural)
- **Saída persistida em** `BioMatchingResult` (RLS owner-based)
- **Catálogo:** lido com service role, 200 itens, campos educacionais apenas (nome, categoria, tipo, mecanismo, objetivo)

### 1.2 Score de Adesão 0-10 com semáforo
- Código real: `score_adesao` 0-10, `status: ativo (≥7) / pendente (<7)` — semáforo verde/amarelo/vermelho conforme R24 (≥7 verde, 4-6 amarelo, <4 vermelho)
- **Nota de execução:** o código define 2 estados (ativo/pendente) com corte em ≥7; o semáfero de 3 faixas (verde/amarelo/vermelho) é o desenho do runbook — implementação de UI do semáforo de 3 faixas = item de execução (ver §3.3)
- **P8:** `analise_indisponivel` boolean + `nivel_confianca` — sistema admite "não sei" estruturalmente

P8: sem dado → "sem dados auditáveis" (nunca zero artificial).

## 2. DADOS SINTÉTICOS — PROTOCOLO DE TESTE (para o builder HML)

**Gerador de relatório sintético (Genera-like):** `docs/roteiros/roteiro-24-bio-matching-sintetico.md` (despachado ao sandbox — §3). Três perfis sintéticos, zero dado real:

### Perfil S1 — "Metabolizador rápido" (caminho feliz)
- Variants: CYP1A2 *1F/*1F (metabolizador rápido de cafeína), PPARG Pro12Ala Ala-carrier (sensibilidade insulina favorável), ACTN3 R577X RR (fibras rápidas), VDR FokI CC, FTO sem alelos de risco
- **Esperado:** score_geral médio-alto, ≥3 peptídeos "ativo" (≥7), justificativas citando mecanismo (sensibilidade insulina ↔ categoria Saúde Metabólica)
- **Valida:** cálculo correto do score de adesão, catálogo cruzado, referências citadas

### Perfil S2 — "Inflamatório sensível" (caminho de cautela)
- Variants: IL6 -174 CC (produtor alto de IL-6), TNF 308 A/A, NOS3 Glu298Asp, FTO rs9939609 A/A
- **Esperado:** scores baixos para itens de categoria Estética/Performance; justificativas mencionando perfil inflamatório; nível de confiança médio/baixo com referências
- **Valida:** motor não sugere agressivo para perfil sensível; sem alucinação conceitual (não inventa mecanismo não descrito no catálogo)

### Perfil S3 — "Sem variantes relevantes" (P8 — estado vazio)
- Relatório válido mas sem variantes mapeadas no modelo educacional
- **Esperado:** `analise_indisponivel=true` OU scores neutros com nivel_confianca=baixa; NUNCA score alto sem base; zero zeros artificiais; "sem dados auditáveis" exibido
- ** valida:** Regra P8 — o motor admite ignorância estrutural

### 2.1 Critérios de aceite (do runbook, agora operacionalizados)
- [ ] Score de Adesão 0-10 calculado e exibido corretamente (S1: ≥3 ativos; S2: cautela; S3: indisponível/neutro)
- [ ] Zero alucinação conceitual (justificativas citam apenas mecanismos do catálogo; referências reais ou "evidência pré-clínica/limitada")
- [ ] Zero alucinação conceitual: justificativa citando mecanismo não presente no campo `mecanismo_acao` do Peptideo → FAIL
- [ ] Pseudoanonimização validada: payload do prompt NÃO contém nome/e-mail/CPF/endereço/telefone do usuário sintético
- [ ] Zero dado real tocado: usuários sintéticos (ex.: `beta_synth_01@pepticore.app`), relatórios fabricados, purge ao final (entidade PurgaExecucao)
- HML apenas — nada em produção
- [ ] Consentimento explícito + disclaimer educacional no fluxo (checkbox → botão habilita — e2e/red-flag-engine.spec.js já cobre)
- [ ] mecLog (timestamp+sha256) por execução

## 3. DESPACHO AO BUILDER (HML, madrugada)

### 3.1 O que já está no sandbox (escrito por este runbook)
- `docs/roteiros/roteiro-24-bio-matching-sintetico.md` — despacho completo p/ builder (perfis S1/S2/S3 + critérios + purge final)

### 3.2 O builder executa em HML: cria usuário sintético, sobe relatório sintético (S1→S2→S3 via Playwright/Testing Agent), valida critérios §2.1, registra PASS/FAIL por item, purge ao final, registra STATUS no _RETORNO do Drive-ponte.

## 4. DIVISÃO DE EXECUÇÃO
- Córtex valida estático + despacha; Base44/builder executa runtime HML; CEO chancela dados genéticos reais (Art. 11) quando o beta abrir Bio-Matching para testers reais.

## RASTREABILIDADE
- Código auditado: analisarBioMatching/entry.ts · iaUtils.ts (pseudoAnonymizeUser, DISCLAIMER, PROMPT_BASE) · BioMatchingResult.jsonc (RLS owner) · CacheAnalise.jsonc · Peptideo.jsonc (status_regulatorio enum)
- Normativos: Spec 360 §2.1 Pilar I · Parecer Legal §2.2/§2.4 (isolamento, pseudoanonimização) · LGPD Art. 11 · Núcleo v1.2 (P8)
- Status de retorno: STATUS_BIO_MATCHING_2026-10-09.md (este arquivo) + runtime do builder no _RETORNO
