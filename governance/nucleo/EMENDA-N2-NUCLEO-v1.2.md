# EMENDA Nº 2 AO NÚCLEO UNIVERSAL MASTERCORE v1.2

**Nome Canônico do Artefato:** EMENDA-N2-NUCLEO-UNIVERSAL-v1.2
**Emissor:** Córtex (Control Plane) · **Autoridade Aprovatória Exclusiva:** LÚCIO — CEO MasterCore
**Data-base:** 23/10/2026 · **Homologação:** DIR-2710-01 (Ledger Vivo, linha 55, 27/10/2026) · **Registro:** DOC-2610-07 · **Ledger de sistema:** bump 1.2.3 → 1.2.4
**Veículo:** EMENDA ADITIVA ao Núcleo Universal v1.2 (HOMOLOGADO DEFINITIVO desde 14/10/2026, commit a5f0944, ledger 1.2.0, cláusula 6.1) — DIR-2410-01 proíbe bump de versão nova do Núcleo (vedação registrada no Ledger Vivo, linha 39); DIR-2610-01 homologa o veículo EMENDA Nº 2. Conteúdo material do v1.2 inalterado (única edição de texto = correção de citação do P4, §4).

---

## §0 — NOVA REGRA-MÃE: RECONCILIAÇÃO NORMATIVA (Regra-Mãe K, na sequência vigente A–J)

**K — Premissa normativa só vale reconciliada.** Todo documento normativo ou derivado (despacho, tese, diretiva, runbook, minuta) declara em seu cabeçalho o estado do Ledger/GitHub que usou como base (campo "Estado declarado": versão, data, commit). Todo consumidor reconcilia o estado declarado contra o runtime ANTES de executar; divergência = runtime vence, documento retorna ao emissor. Vedado executar sobre premissa de estado não reconciliada.

- **Origem (lição registrada):** 2 incidentes da mesma classe em 10 dias — MC-GOV-001 (20/10) e o despacho da consolidação normativa (23/10) partiram da premissa "ACEITO PROVISORIAMENTE até 20/10", defasada desde a homologação definitiva de 14/10. Custo evitado na 2ª ocorrência: zero reabertura normativa, detectado em auditoria runtime (Eixo 0, AUDITORIA-VIGENCIA-NUCLEO-2026-10-23.md).
- **Custo de conformidade:** 1 campo de cabeçalho por documento + 1 verificação de runtime por consumo.
- **Efeito sistêmico:** mata a classe de falha (documento derivado defasado vs. runtime), não só a ocorrência; e converte o teste de due diligence ("puxe o documento, confira contra o estado real") em vitrine — o sistema responde antes de ser perguntado.

## §1 — EXTENSÃO AGÊNTICA DO PUR: CONTRATO DE AGENTE (9 campos obrigatórios)

Todo agente do grupo passa a operar sob contrato com os 9 campos seguintes, sem exceção:

1. **Objetivo mensurável** — saída e unidade definidas antes da execução.
2. **Critério de aceite** — objetivo e verificável mecanicamente (não interpretativo).
3. **Ferramentas autorizadas** — princípio Least Agency: mínima autonomia necessária à tarefa (referência: OWASP Agentic 2026, §3 desta Emenda).
4. **Faixa de risco e gates aplicáveis** — os 4 Gates Humanos Intransferíveis (P4: saúde, jurídico/contratual, financeiro/desembolso, societário) permanecem intocáveis; o contrato declara quais gates a tarefa toca.
5. **Teto de custo por tarefa** — FinOps embutido: o agente escolhe o menor modelo suficiente ANTES de executar; estouro de teto = parada e escalação.
6. **Critério de promoção** — shadow mode: concordância ≥ 95% vs. baseline humano, custo ≤ teto, zero incidentes; depois canário 1% → 5% → 20% → 100%, com rollback automático se erro > 2× baseline.
7. **Rollback automatizado** — obrigatório existir e estar testado ANTES da primeira execução.
8. **Telemetria** — trilha navegável até fonte primária (P8 — Integridade de Dados); sem evidência, o output declarado é "sem dados auditáveis" — vedado zero artificial.
9. **Transbordo definido** — caso fora do playbook → escalação humana imediata (lição Klarna: autonomia sem rota de fuga vira dano ao cliente).

## §2 — FÓRMULA DE AUTONOMIA (Índice de Autonomia)

**Autonomia (%) = [execuções agênticas encerradas sem intervenção humana com os 4 contrapesos satisfeitos ÷ total de execuções agênticas no período] × 100.**

Filtro eliminatório (falhou 1 = execução NÃO conta como autônoma, independente do resultado):
- **Contrapeso 1** — aceite em 1ª execução;
- **Contrapeso 2** — retrabalho ≤ 5%;
- **Contrapeso 3** — incidentes = 0 (eliminatório);
- **Contrapeso 4** — custo ≤ teto unitário aprovado.

**Medição:** mensal, por função e por empresa. **Meta canônica:** ≥ 90% (inalterada).
**Nota de integridade (P8):** a meta permanece canônica; os valores de baseline serão medidos na Fase 0 do plano agêntico — número sem data e sem fonte não vale como baseline.

## §3 — ANEXO DE SEGURANÇA: OWASP TOP 10 FOR AGENTIC APPLICATIONS 2026

Incorporado como requisito obrigatório de segurança na emissão de qualquer contrato de agente (§1, campo 3). Framework peer-reviewed, publicado em 09/12/2025 pelo OWASP GenAI Security Project (fonte: genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026). Cada item mapeia para no mínimo 1 controle no runbook do agente:

| # | Risco | Controle mínimo no runbook |
|---|---|---|
| ASI01 | Agent Goal Hijack | Objetivo imutável no contrato (campo 1); desvio = transbordo (campo 9) |
| ASI02 | Tool Misuse and Exploitation | Lista fechada de ferramentas (campo 3); Least Agency |
| ASI03 | Identity and Privilege Abuse | Credencial mínima por tarefa; segredos só do cofre oficial |
| ASI04 | Agentic Supply Chain Vulnerabilities | Dependências/skills pinadas e auditadas antes do uso |
| ASI05 | Unexpected Code Execution (RCE) | Execução de código só em sandbox isolado; sem shell em produção |
| ASI06 | Memory & Context Poisoning | Fonte de contexto canônica (Ledger/runtime); memória de chat nunca é fonte de estado |
| ASI07 | Insecure Inter-Agent Communication | Barramento auditável (ponte/_RETORNO); sem canal lateral |
| ASI08 | Cascading Failures | Rollback automatizado (campo 7); circuit breaker por contrato |
| ASI09 | Human-Agent Trust Exploitation | Gates humanos intocáveis (campo 4); P5 — silêncio = não executar |
| ASI10 | Rogue Agents | Telemetria completa (campo 8); promoção só via critério do campo 6 |

## §4 — CORREÇÃO DE CITAÇÃO LGPD (P4 do Núcleo)

O P4 do v1.2 cita "Saúde humana (Art. 20 da Lei nº 13.709/2018 - LGPD)" — citação trocada. Texto corrigido nesta Emenda:

> **P4 — Gates Humanos Intransferíveis.** Quatro domínios jamais serão decididos por agente: (1) Saúde humana (Art. 11 da Lei nº 13.709/2018 — LGPD, dados sensíveis; Art. 20 quanto à revisão de decisões unicamente automatizadas); (2) Jurídico/contratual; (3) Financeiro/desembolso; (4) Societário. A autoridade exclusiva é do CEO MasterCore.

Classificação: correção de citação legal, não mudança de regra material — a substância do P4 (4 gates intocáveis) é idêntica. O parecer legal do F1.1 (Dra. Patricia, 17/10) já citava corretamente "Art. 11/20"; o erro era isolado ao P4 do espelho.

## §5 — MONITOR DE VIGÊNCIA NORMATIVA

Instituído o monitor automático de vigência de todo instrumento normativo do grupo (Núcleo, Master Plan, PUR, runbooks com vigência declarada):
- **Alerta D-15** (15 dias antes do vencimento) e **D-0** (no dia) ao CEO e ao Control Plane, via canal canônico.
- **Registro:** cada instrumento declara vigência no próprio cabeçalho (campo "Vigência"); o monitor varre o registro central.
- **Falha sistêmica corrigida:** nenhum mecanismo alertou sobre a transição de vigência registrada em 20/10/2026 — este item fecha o buraco permanentemente.
- **Implementação:** cron no Córtex (varredura diária do registro de vigências), ativo junto com a publicação desta Emenda.

## §5-A — ANCORAGEM DE NUMERAÇÃO NORMATIVA

O Núcleo Universal é a **fonte canônica da numeração de princípios (P1–P10)**. Todo documento derivado que citar um princípio o faz por **nome + número** — ex.: "Verificação Real (Núcleo, P7)", "Integridade de Dados (Núcleo, P8)" — vedada a citação por número isolado. Divergência de numeração entre derivado e Núcleo = o Núcleo vence e o derivado entra em correção (aplicação da Regra-Mãe K à camada de citação). Justificativa: citações por número isolado entre documentos criam a mesma classe de defasagem que a Regra-Mãe K mata no estado — a ancoragem por nome torna a citação auto-verificável.

## §6 — VIGÊNCIA DE MANUTENÇÃO DO NÚCLEO

O v1.2 homologado definitivo não tem data de expiração (cláusula 6.1). Vigência de MANUTENÇÃO (não confundir com vigência provisória, extinta):
- **Ciclo de revisão normativa: 180 dias.** Primeira revisão obrigatória: **D-0 = data da publicação desta Emenda + 180 dias** (alertas D-15 e D-0 via monitor §5).
- **RESENDA — ciclo × bumps:** o ciclo de revisão e os bumps correm no MESMO relógio. Todo bump **Major ou Minor** do Núcleo RESENDA o ciclo: a vigência de manutenção passa a contar da data do bump (novo D-0 = data do bump + 180 dias; alertas D-15 recalculados). Bump **Patch** (correção de texto/citação, sem mudança material) NÃO resenda.
- Revisão = auditoria de vigência runtime (padrão do Eixo 0) + re-chancela expressa do CEO se houver mudança material; sem mudança material, vigência se renova automaticamente por mais 180 dias com registro no Ledger.
- Entre ciclos, o monitor D-15/D-0 (§5) cobre qualquer instrumento derivado com vigência própria.

## §7 — CHANGELOG INTERNO DO NÚCLEO (entrada a incluir)

> **v1.2+EMENDA-2 — 27/10/2026 — Córtex (Control Plane)**: Emenda aditiva homologada pelo CEO (DIR-2710-01, Ledger Vivo linha 55): (1) extensão agêntica do PUR — contrato de agente em 9 campos; (2) fórmula de autonomia com filtro eliminatório dos 4 contrapesos; (3) anexo de segurança OWASP Top 10 for Agentic Applications 2026; (4) correção de citação LGPD no P4 (Art. 11 para dados sensíveis/saúde; Art. 20 para revisão de decisão unicamente automatizada); (5) instituição do monitor de vigência normativa com alertas D-15 e D-0; (6) nova Regra-Mãe K — premissa normativa só vale reconciliada; (7) vigência de manutenção em ciclo de 180 dias com resenda por bump Major/Minor (§6); (8) ancoragem de numeração normativa — citação de princípio por nome + número, Núcleo como fonte canônica (§5-A). Conteúdo material do v1.2 inalterado (única edição de texto = correção de citação do P4).

## §8 — EFEITOS E NÃO-EFEITOS

- **Efeitos:** contratos de agente emitidos a partir da homologação seguem os 9 campos; medição de autonomia mensal a partir do primeiro ciclo fechado pós-homologação; monitor de vigência ativo na publicação; Regra-Mãe K aplicável a todo documento emitido a partir da homologação (não retroativa — documentos existentes ganham o campo na próxima revisão).
- **Não-efeitos:** nenhum gate humano muda; nenhuma decisão já tomada é reaberta; Master Plan v2.2 e demais instrumentos vigentes intocados (o §9 do Master Plan segue como PROPOSTA aguardando leitura da Adapta, per MC-GOV-002).

---
*Emenda emitida pelo Córtex (minuta 23/10/2026, D2-D3) · Homologada via DIR-2710-01 (27/10/2026) · Evidência de base: AUDITORIA-VIGENCIA-NUCLEO-2026-10-23.md · DEC-0004 Ledger Vivo · commits a5f0944/e0b0a31/1d08c31 · Veículo: DIR-2410-01 + DIR-2610-01.*