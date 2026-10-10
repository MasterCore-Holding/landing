# ROTEIRO_IMPORTACAO_HUBSPOT_TRIAGEM — PUR v1.0
Emissor: Córtex · 10/10/2026 03:15 BRT · Origem: Comando de Verificação 10/10 (Parte 2, item pendente de emissão)
Executor: Córtex/Maestro (APIs) + PO Lucio (gates humanos) · Ambiente: CRM HubSpot portal 52078201 + planilha Leads + Base44
Regra: Proposto ≠ Aplicado — nada verde sem evidência de runtime. Execução SERIAL, 1 fase por vez, recurso: CRM.

## PREMISSAS VERIFICADAS NA FONTE (10/10, 06:05-06:20 BRT)
- CRM: 26 contatos reais lifecyclestage=lead (GET /crm/v3/objects/contacts — leitura executada agora). Zero propriedade de score/triagem existente (414 props varridas).
- PAT "Cortex Sync": escopos contacts read/write APENAS — criação de propriedade REJEITADA (403 "hasn't been granted all required scopes", provado agora). Fase B depende de ação no UI.
- Planilha canônica: 1TBGg25DwwmMm5y2b3Z1wK0vsKHAkNY559c8sdnU4ALw (aba Leads, cabeçalho A:I + UTMs G1:I1). Entidade Lead Base44 = fonte canônica desde 06/10 (observacao ≤4000 chars + whatsapp persistidos).
- Entidade BetaTester (sandbox): status pendente/convidado/ativo/recusado; create/update/delete ADMIN-ONLY; campos email/nome/nivel/origem/data_convite/data_aceite.
- Instrumento de triagem v1 (R9): score 0-100, pesos somam 100, corte ≥60, 3 gates duros, cota 10/5/5, 3 consentimentos LGPD Art.11 granulares. PENDENTE de chancela CEO.
- Material de Admissão (Bloco 1): pronto no Drive (1GWWEhnelQR10E2aFdjM8i5ulqhV98gJWTlIO1ezHhdo). Unlock de leads = 11/10 (gate CEO).
- Templates WABA 4/4 v2 APPROVED (pepticore_boas_vindas_v2, pepticore_confirmacao_fila_v2, pepticore_followup_vagas_v2, pepticore_qualificacao_triade_v2).

## FASE A — RECONCILIAÇÃO DE LEADS → CRM (executável no GO do CEO, independe do unlock)
- A1. Snapshot triplo: planilha (Sheets MCP, aba Leads) + entidade Lead (Apps API Base44) + CRM (HubSpot API) → consolidar por e-mail (dedupe case-insensitive).
- A2. Para cada lead ausente no CRM: POST /crm/v3/objects/contacts com idempotência por e-mail; properties: firstname, email, lifecyclestage=lead; observação da jornada (score/UTM) em propriedade de texto existente — NUNCA inventar propriedade.
- A3. UTMs: preencher utm_source/utm_medium/utm_campaign se existirem como propriedades de contato; senão registrar em observação. First-touch nunca sobrescreve.
- A4. Verificação: re-GET do total esperado + log criados/duplicados/erros + STATUS no _RETORNO. Critério: número de contatos = leads consolidados, zero erro silencioso.
- Duração estimada: 15 min. Já coberta em parte pelo sync 30min (e15192acf1f25234) — esta fase é a reconciliação pontual com evidência.

## FASE B — INSTRUMENTO DE SCORE (bloqueada até G2)
- B1. Lucio cria a propriedade no UI (3 min): Configurações → Propriedades → Criar propriedade (Contatos) → "Score Triagem Beta" (internal name sugerido: pepticore_triagem_score, número 0-100) + "Nível Triagem" (pepticore_triagem_nivel, dropdown iniciante/intermediário/biohacker). PAT sem escopo de properties — verificado; UI é o caminho.
- B2. Lucio publica o form de triagem no HubSpot (ou Base44 nativo com sync) com as 7 seções do questionário-triagem-beta-v1.md. GATE: chancela do instrumento (G2).
- B3. Córtex: mapear respostas → score 0-100 (pesos R9) → UPDATE contato (score + nível). Nenhum dado de substância de uso pessoal nesta fase (minimização).

## FASE C — TRIAGEM E SHORTLIST (após B)
- C1. Filtro: score ≥ 60 (corte R9) + 3 gates duros do instrumento.
- C2. Distribuição por cota: 10 iniciantes / 5 intermediários / 5 biohackers; desempate = ordem de submissão (first-touch). Reserva = suplentes em ordem de score (meta 200+ leads para cobrir dropout).
- C3. Entrega ao PO: lista final 20 + reserva (view no CRM + linhas na planilha de atribuição de testers R18). A lista de nomes reais alimenta R18.

## FASE D — ADMISSÃO (Material de Admissão, após C)
- D1. Iniciantes (10): entrevista 1:1 PO, 10-15 min, roteiro de 6 perguntas (Material de Admissão Parte 1) → score/decisão no CRM.
- D2. Intermediários + Biohackers (10): Meet coletivo 45-60 min (pauta 6 blocos, Parte 2) → decisão por participante.
- D3. Pós-aprovação: e-mail "Acesso Beta" (template Brevo) + convite grupo WhatsApp "Beta Testers" + BetaTester.status=convidado (escrita admin via Apps API) + data_convite.

## GATES HUMANOS (nenhum automatizável)
- G1: unlock de leads 11/10 (CEO) — destrava coleta nova; Fase A pode rodar antes no GO.
- G2: chancela do instrumento de triagem (R9) — destrava Fase B.
- G3: chancela das cópias de convite (e-mail Brevo + templates v2 no fluxo) — destrava Fase D3.
- G4: lista final de 20 = decisão do PO (C3 entrega, PO decide).

## COMPLIANCE
LGPD 13.709/2018 Art. 11 (consentimento granular por finalidade; exclusão via contato@pepticore.app) · minimização radical · ANVISA (zero alegação de saúde/eficácia em toda copy) · disclaimer educacional + CVV 188 nas cópias de risco · dados auditáveis (P8: sem evidência = reportar "sem dados auditáveis", zero zeros artificiais).

## CRITÉRIO DE PRONTO
Fase A: CRM reconciliado com evidência. Fase B: propriedade + form ativos + scores gravados. Fase C: shortlist 20+reserva entregue ao PO. Fase D: 20 admitted com status no CRM e no BetaTester. STATUS consolidado no _RETORNO ao fim de cada fase.
