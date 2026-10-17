# STATUS_SEGURANCA_PREBETA_2026-10-10 — R26 · Revisão de Segurança e Compliance pré-beta
**PUR v1.0 · Origem: ADAPTA · Execução: CÓRTEX (estática + live check, modo leitura) · 10/10/2026, ~00:20 BRT**
**Ambiente: leitura de código do sandbox + entidades live · Zero escrita em produção · GATE: abertura do beta = chancela CEO**

## RESULTADO POR CRITÉRIO (do runbook)

### 1. RLS nas entidades sensíveis — PASS (31/32 explícitas; 1 estrutural)
- **Owner-based (user_id = {{user.id}}), 17 entidades:** Analise360Result, AplicacaoLog, **BioMatchingResult**, BodyAnalysisResult, CacheAnalise, CheckIn, ConsentimentoRegulatorio, CreditoReferral, Estoque, ExportLog, **FileUpload**, **PainelClinicoResult**, Protocolo, ProtocoloValidado, Referral, **RegistroSintoma**, RegistroSono — **as 3 sensíveis citadas no runbook (PainelClinicoResult, RegistroSintoma, FileUpload) todas com RLS owner-based confirmada no schema real.**
- **Admin-only, 14 entidades:** AtribuicaoEvento, BetaTester, ComissaoAtribuicao, ComissaoLancamento, EmailLog, FechamentoMensal, Lead, MotorConfig, Partner, Peptideo, PurgaExecucao, ReavaliacaoRegulatoria, SyncMeta, WebhookEvent.
- **User (1):** sem bloco RLS no schema — é o próprio subject de autenticação da plataforma (gestão de conta pelo dono); sem exposição cruzada aplicável. Registrado como característica estrutural, não gap.
- Cobertura total: 32 entidades auditadas (17 owner + 14 admin + 1 subject).

### 2. IDOR corrigido (403 em acesso cruzado) — PASS (estático)
- **Posse verificada nos 3 motores de arquivo** (analisarBioMatching, analisarBodyAnalysis, analisarPainelClinico): `FileUpload.filter({user_id: user.id, file_uri})` → 403 "Arquivo não pertence ao usuário" quando não-owner.
- **Signed URL ≤15 min** (`expires_in: 900`) para documento de saúde — nunca storage público.
- **Nota (baixa):** `copilotBuscarProtocolo` é público POR DESIGN (link_token, acesso do paciente sem login, service role) — token opaco é a credencial. Recomendação de endurecimento pós-beta: TTL/revogação de link_token (backlog, não bloqueia).
- **Runtime 403 cruzado:** coberto pelo despacho R3/R4 (Testing Agent, Playwright) — execução do builder.

### 3. Consentimento LGPD (Art. 7º I + Art. 11 II) no onboarding — PASS
- Gate server-side da Fase 0 LIVE: `registrarConsentimentoPilar` + `registrarDadoPilar` + `base44/shared/portalConsentimento.js` (porta sequencial antes de escrita, trilha hash encadeada) — **97/97 testes unitários PASS** (rodados pela esteira da Fase 0, 10/10).
- Wired na UI: Onboarding registra os 5 escopos; PainelPilaresFase0 em /meus-dados (autorizar/revogar + hash SHA-256 por pilar I/II/III).
- Entidade ConsentimentoRegulatorio com RLS owner (data/versão/escopo auditáveis).

### 4. Rate limiting — PASS (código real)
- `respostaBeta`: máx **10 envios / 5 min** por assunto (janela EmailLog) → 429. Confirmado no código.
- `registrarLeadAppsScript`: janela 5 min com **429** (`status:'nao_gravado', motivo:'limite_cadastros'`). Confirmado no código.

### 5. Segredos (nenhum em código/cliente; PII mascarada) — PASS
- Varredura de src/ (todo o front): **zero valor de segredo** — apenas NOMES de env citados em docs GOV (documento-mestre, changelog, build-reference), que é documentação, não credencial.
- Backend usa `secrets.get('BREVO_API_KEY')` etc. (cofre do runtime Base44).
- PII mascarada: `pseudoAnonymizeUser()` (idade/peso/IMC/objetivo; remove nome/e-mail/contato) injetado nos prompts dos motores; `ip_hash` no Lead (não IP cru); anti-fraude por `device_hash` SHA-256.

### 6. Purge de usuários sintéticos pré-beta — PASS (live check agora)
- Entidade Lead lida LIVE: **32 registros, todos reais** (último: flaviosilvanascimentoflavio@outlook.com, 06/10 09:08) — **zero lead sintético/teste** (o candidato "teste.e2e2@pepticore.app" já foi purgado).
- Mecanismo de purga provado: `purgaCron` (prova destrutiva R2 PASS 5/5 em 09/10, idempotente, registro em PurgaExecucao admin-only) + `hardPurgeUsuarios`.

## ACHADOS RESIDUAIS (não bloqueiam beta; backlog)
1. **500 genérico sem auth em 3 motores** (analisarBioMatching/Body/PainelClinico) — normalizar para 401/403 semântico (achado F1.1, já em backlog do builder).
2. **Semáforo de 3 faixas do Bio-Matching** (verde/amarelo/vermelho) é desenho do runbook; código tem 2 estados (ativo ≥7/pendente) — alinhar UI na próxima onda.
3. **copilotBuscarProtocolo:** adicionar TTL/revogação de link_token (pós-beta).
4. **CAPI server-side do Meta Pixel** — pendência futura declarada (sinal próprio).

## VEREDITO
**6/6 critérios do runbook PASS em verificação Córtex** (estática + live). Runtime E2E (403 cruzado, tour mobile) = R3/R4 com Testing Agent. **Abertura do beta = GATE HUMANO — chancela CEO** (com R26 verde, coorte 10/5/5 e pareceres favoráveis condicionados cumpridos).

## RASTREABILIDADE
- Fontes: sandbox files API (399 arquivos lidos 10/10 ~02:20 BRT), entidades Lead live (32), testes portalConsentimento 97/97, STATUS_R2_R3_R4 (R2 PASS 5/5).
- Normativos: Parecer Legal P0 §2-§5 · LGPD Art. 11 + Res. ANPD 15/2024 · Núcleo Universal v1.2.
