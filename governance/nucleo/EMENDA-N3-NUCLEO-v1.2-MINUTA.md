# EMENDA Nº 3 AO NÚCLEO UNIVERSAL MASTERCORE v1.2

**Nome Canônico do Artefato:** EMENDA-N3-NUCLEO-UNIVERSAL-v1.2

> ⚠️ **ARTEFATO SUPERSEDIDO.** Esta minuta foi homologada pelo CEO em 27/10/2026 (DIR-2710-03). A norma vigente é `governance/nucleo/EMENDA-N3-NUCLEO-v1.2.md` (sha256 9ae9a30c). Este arquivo permanece como histórico de revisão e NÃO deve ser citado como norma.
**Emissor:** Córtex (Control Plane) · **Autoridade Aprovatória Exclusiva:** LÚCIO — CEO MasterCore
**Data de emissão:** 27/10/2026 · **Trinca:** 27/10/2026
**Veículo:** EMENDA ADITIVA ao Núcleo Universal v1.2 (HOMOLOGADO DEFINITIVO desde 14/10/2026, commit a5f0944, ledger 1.2.0, cláusula 6.1). DIR-2410-01 veda bump de versão nova (Núcleo v1.3 proibido); DIR-2610-01 homologou o veículo EMENDA.
**Numeração:** esta é a **EMENDA Nº 3**. A EMENDA Nº 2 (DOC-2610-07, homologada por DIR-2710-01 em 27/10/2026, ledger linha 55) trata de contrato de agente, fórmula de autonomia, OWASP Agentic, monitor de vigência e Regra-Mãe K. Conteúdo distinto, sem sobreposição.
**Estado declarado (Regra-Mãe K):** Ledger Vivo lido ao vivo em 27/10/2026 23:45 BRT — 64 linhas, último registro DIR-2710-02; repo `MasterCore-Holding/landing` @ `main`; Núcleo v1.2 em `governance/Nucleo-Universal-MasterCore-v1.2.md`.
**STATUS: MINUTA — NÃO VIGENTE.** Só entra em vigor com chancela expressa do CEO. Até lá, o regime da R-Mãe G permanece como está e este documento é peça de decisão, não norma.

---

## §0 — PROBLEMA QUE ESTA EMENDA RESOLVE

A R-Mãe G do Núcleo v1.2 **já** institui três faixas — Rotina (Default-Allow), Supervisionada (validação determinística prévia) e Bloqueada (gate humano) — e o P6 já fixa Default-Allow com auditoria. O problema **não é normativo**: é operacional. Nada no runtime classifica a operação em uma faixa antes de executá-la, então a faixa é escolhida caso a caso, por julgamento, no momento da execução. Resultado observado: o pior caso se torna o padrão e **tudo escala** — a faixa vermelha vira o único caminho, e o gate se degrada de controle em gargalo.

Esta Emenda não cria taxonomia paralela. Ela **ancora-se nos três nomes existentes** (Rotina / Supervisionada / Bloqueada), fixa o que cai em cada uma e **inverte o ônus da prova**: o padrão é executar; a exceção é o gate, restrito ao rol fechado do P4.

**Base externa (corrigida — ver §7):** Gartner, press release de 26/05/2026 — aplicar governança uniforme a todos os agentes de IA, independentemente do nível de autonomia e escopo, leva a falha corporativa em agentes; a empresa prevê que **até 2027, 40% das organizações rebaixarão ou desativarão agentes autônomos por lacunas de governança descobertas apenas após incidentes em produção**. Dois modos de falha nomeados pelo Gartner: **sobre-restrição** de agentes simples (freia entrega e empurra para desenvolvimento paralelo informal) e **sub-restrição** de agentes mais autônomos (aumenta risco operacional, de segurança e de conformidade). Recomendação: governança **multi-nível/proporcional**, avaliando nível de autonomia e escopo de acesso como dimensões independentes.
Fontes: press release Gartner 26/05/2026 (gartner.com/en/newsroom/press-releases/2026-05-26-gartner-says-applying-uniform-governance-across-ai-agents-will-lead-to-enterprise-ai-agent-failure) · cobertura CIO.com 29/05/2026 (cio.com/article/4178628/many-autonomous-agents-doomed-by-governance-failures.html), lida integralmente em 27/10/2026.

> **Correção material de citação.** O Master Plan v2.2, §7, linha "Projeções Gartner (2026)", enuncia o dado como "políticas uniformes indiscriminadas colapsam **até 40% das operações de IA**". O 40% do Gartner refere-se a **organizações que rebaixarão/desativarão agentes até 2027**, não a operações colapsadas. A tese do Master Plan (proporcionalidade por faixa) está correta e é justamente a recomendação do Gartner; **o número está mal atribuído**. Correção do §7 registrada como pendência (PD-2710-05).

---

## §1 — AS TRÊS FAIXAS (definição operacional)

### Faixa 1 — ROTINA (verde) · autônomo, sem gate, revisão posterior

Executa sem autorização prévia, com registro auditável (P6). Se quebrar, `git revert` e registro do incidente. **Não toca dinheiro, contrato, paciente ou produção com usuário real.**

Rol positivo — o que cai aqui, sem consulta:

| Domínio | Operações |
|---|---|
| Código | branch isolada, refactor, teste, correção de bug, migração em ambiente de dev |
| Conteúdo (criação) | copy, roteiro, post, e-mail, criativo, landing page — **em rascunho** |
| Mídia | imagem, vídeo curto, apresentação interna |
| Análise | relatório, diagnóstico, benchmark, pesquisa |
| Documentação | README, changelog, playbook, ata, documentação de processo |
| Governança (não normativa) | handover, nota de estado, registro de pendência, placar |

**Condição de permanência na faixa:** reversibilidade mecânica comprovada. Operação sem rollback testado não é Rotina, seja qual for o domínio.

### Faixa 2 — SUPERVISIONADA (amarela) · executa e notifica, veto em 24h

Executa, **notifica a autoridade no mesmo turno** com escopo e rollback declarados, e abre janela de veto de 24 horas corridas. Sem veto expresso dentro da janela, a operação está **aprovada por decurso de prazo** — e o silêncio fica registrado como aprovação tácita, não como omissão.

| Operação | Condição |
|---|---|
| Deploy em staging / preview | staging declarado como tal, sem usuário real |
| Publicação por **template já aprovado** | peça usa template homologado, sem alteração de claim, preço ou promessa |
| Proposta comercial | **dentro** de faixa de preço pré-aprovada pelo CEO; fora da faixa = vermelha |
| Criação de repo, branch de release, tag | repo novo no namespace do grupo |
| Configuração não-sensível | não concede acesso e não altera domínio/credencial |
| Convite para ambiente de teste | perfil restrito, sem dado de produção |
| Publicação de conteúdo estático em landing própria | sem usuário autenticado, sem transação, sem coleta de dado sensível — ver §3 |

**Veto:** não é preciso justificar. Qualquer veto expresso dentro da janela reverte a operação e a devolve ao estado anterior; o veto é registrado com data e não exige contrapartida do executor.

**Janela de 24h — quando não corre:** operação de caráter irreversível **não entra** nesta faixa. Se o rollback não desfaz o efeito (envio de mensagem a terceiro, gasto incorrido, dado exposto), a operação é vermelha por definição: prazo não convalida o que não se desfaz.

### Faixa 3 — BLOQUEADA (vermelha) · gate humano obrigatório

Rol **fechado** — o P4, sem acréscimo por analogia. Fora destes quatro, nada é vermelho:

1. **Saúde** — dado de paciente, dado pessoal sensível (LGPD Art. 11), decisão clínica, comunicação que possa ser lida como orientação de saúde.
2. **Jurídico/contratual** — contrato assinado, cláusula vinculante, posição jurídica do grupo, resposta a terceiro em disputa.
3. **Financeiro/desembolso** — qualquer saída de caixa, compromisso de gasto, preço fora de faixa aprovada, contratação com custo.
4. **Societário** — cap table, contrato social, PI, marca, entrada ou saída de sócio.

Acrescentam-se, por serem meios dos quatro acima e não matérias novas: **credencial, token e acesso privilegiado** (meio de desembolso e de exposição de dado); **comunicação externa em nome do grupo dirigida a imprensa ou investidor** (meio de posição jurídica e societária); **apagar registro canônico** (irreversível por natureza).

**Comunicação externa — distinção necessária.** Comunicação **de produto e marketing** em canal próprio da marca segue a R-Mãe H e a faixa 2 (template aprovado). Comunicação **institucional, jurídica ou a investidor** em nome do grupo é vermelha. As duas não se confundem.

---

## §2 — INVERSÃO DO ÔNUS DA PROVA

1. **Padrão é executar.** Operação não enquadrada em nenhuma hipótese do rol do P4 é Rotina ou Supervisionada — nunca Bloqueada por precaução.
2. **Bloqueio exige enquadramento nomeado.** Quem classifica como vermelho declara **qual dos quatro** incide e por quê. "É sensível", "é melhor confirmar" e "pode dar problema" não são enquadramento.
3. **Vedado ao executor reclassificar a própria ação** para baixo. Reclassificação para cima é sempre permitida — escalar nunca é infração.
4. **Dúvida genuína sobre enquadramento** resolve pela faixa mais restritiva (princípio do menor teto, DIR-2710-02). O que se veda é a **dúvida fabricada** para transferir decisão ao CEO.
5. **Retrocesso de faixa** é ato do CEO. O executor não promove operação de vermelha para amarela por conta própria, nem por histórico limpo.

---

## §3 — FRONTEIRA DE "PRODUÇÃO COM USUÁRIO REAL"

Critério material, não critério de URL:

- **É produção com usuário real** quando o sistema tem usuário autenticado, transação, ou trata dado real de pessoa — e a operação pode causar dano a essa pessoa.
- **Não é** quando é superfície pública estática de marca: landing, página de produto, conteúdo institucional, material de campanha — sem login, sem transação, sem coleta de dado sensível.

**Consequência prática:** publicar landing própria (ex.: `enginecore.app`, servida por GitHub Pages a partir da `main`) é **faixa 2** — executa e notifica, veto em 24h. Não é faixa 3. Sem esta cláusula, qualquer ajuste de landing vira gate vermelho e o repositório ossifica.

**Contrapartida obrigatória:** toda publicação em landing segue a R-Mãe H — se a peça introduz **claim novo** (número, promessa, comparativo, preço), o claim é vermelho **por si**, ainda que a publicação seja amarela. A faixa protege o ato de publicar; não protege a afirmação publicada.

---

## §4 — RECONCILIAÇÃO COM O QUE JÁ ESTÁ VIGENTE

Emenda aditiva não revoga por omissão. Onde esta Emenda toca norma existente, a convivência é declarada:

| Norma vigente | Interação | Resolução |
|---|---|---|
| **R-Mãe G** (3 faixas) | mesma taxonomia | Esta Emenda **detalha** a R-Mãe G; não a substitui. Nomes canônicos permanecem Rotina / Supervisionada / Bloqueada |
| **P4** (4 gates) | mesmo escopo | Rol do P4 é o rol fechado da faixa 3. **Nenhum gate novo é criado** |
| **P5** (Silêncio = Não Executar) | **conflito aparente** com o decurso de prazo | P5 rege **matéria de gate**, isto é, a faixa 3 — onde o silêncio continua sendo recusa. O decurso de 24h do §1 aplica-se **exclusivamente** à faixa 2, que por definição não é matéria de gate. As duas normas convivem sem exceção |
| **P6** (Default-Allow) | reforço | §2 desta Emenda é a operacionalização do P6 |
| **R-Mãe H** (ritmo humano de publicação) | **conflito aparente** com "post" na faixa 1 | Faixa 1 cobre **criação** de peça (rascunho). **Publicação** em nome da marca continua exigindo template aprovado (faixa 2) ou chancela (faixa 3). Criar é livre; publicar não é |
| **DIR-2710-02** (Orçamento de Autonomia v1.2) | **conflito material** | O orçamento v1.2 fixa D1–D5 com teto e "dúvida = mais restritiva". Esta Emenda não altera teto algum: **D1–D5 continuam valendo por cima das faixas**. Operação na faixa 1 que exceda um teto do orçamento **escala** — a faixa não concede teto |
| **Regra-Mãe K** (reconciliação normativa) | aplicação | Estado declarado no cabeçalho; consumidor reconcilia contra runtime antes de executar |

> **Nota de honestidade normativa.** O §1 (faixa 2, decurso de prazo) e o item "post" da faixa 1 são, na redação literal proposta, **revogação tácita** de P5 e R-Mãe H. Esta minuta **não aceita** a revogação tácita e a substitui por escopo explícito. Se a intenção do CEO for revogar P5 ou R-Mãe H, isso exige emenda própria com esse objeto declarado — não pode vir de arrasto.

---

## §5 — MÉTRICA DE SAÚDE DO SISTEMA

**Indicador primário:** aprovações de faixa vermelha solicitadas ao CEO **por dia**.

| Valor | Leitura | Ação |
|---|---|---|
| **< 3/dia** | meta — gate no lugar certo | manter |
| 3 a 10/dia | zona de atenção | investigar qual matéria concentra |
| **> 10/dia** | **gate no lugar errado** | abrir revisão de enquadramento: operação classificada como vermelha sem enquadramento nomeado no P4 volta à faixa 1 ou 2 |

**Indicadores secundários:** (a) taxa de decurso de prazo na faixa 2 — se > 90%, a janela de 24h não está sendo lida e a faixa 2 é teatro; (b) veto rate na faixa 2 — se ~0% por meses, o executor está escolhendo operações que não interessam, ou o CEO não está lendo; (c) incidentes em faixa 1 — qualquer incidente exige teste impeditivo (não recorrência, Diretriz Córtex v2.0 §3.7).

**Registro:** a contagem sai do Ledger, não de relato. Enquanto a instrumentação automática (DEC-2710-04) não estiver viva, o número é **declarado e sinalizado como NÃO AUDITADO**, conforme DIR-2710-02.

---

## §6 — O QUE ESTA EMENDA NÃO FAZ

- Não altera o P4. Nenhum gate é removido, flexibilizado ou transferido.
- Não concede teto financeiro. D1 continua R$ 0 discricionário + a exceção nominal vigente.
- Não autoriza decisão dentro da faixa. A Camada 3 da DIR-2710-02 segue **não liberada**, com a mesma ordem de condições: trilha auditável em runtime → orçamento instrumentado → kill-switch provado.
- Não retroage. Operação executada antes da chancela é avaliada pela norma então vigente.
- Não cria taxonomia concorrente. Rotina / Supervisionada / Bloqueada permanecem os nomes canônicos.

---

## §7 — CHANGELOG INTERNO DO NÚCLEO (entrada a incluir na chancela)

> **v1.2+EMENDA-3 — dd/mm/2026 — Córtex (Control Plane)**: Emenda aditiva de governança proporcional. (1) detalhamento operacional das três faixas da R-Mãe G com rol positivo por domínio; (2) inversão do ônus da prova — padrão executar, bloqueio exige enquadramento nomeado no P4; (3) janela de veto de 24h na faixa 2, com ressalva expressa de que P5 permanece íntegro na faixa 3; (4) critério material de "produção com usuário real", separando superfície estática de marca de sistema com usuário autenticado; (5) métrica de saúde — aprovações vermelhas/dia, meta < 3, gatilho de revisão > 10; (6) reconciliação declarada com R-Mãe G, P4, P5, P6, R-Mãe H e DIR-2710-02. Nenhum gate suprimido. Nenhum teto concedido.

---

## §8 — EFEITOS E NÃO-EFEITOS

- **Efeitos (na chancela):** operação passa a ser classificada por faixa antes de executar; faixa 1 e 2 dispensam autorização prévia; faixa 3 permanece no CEO; métrica de saúde entra no painel do Cockpit.
- **Não-efeitos:** P4 intocado; DIR-2710-02 intocado; Camada 3 não liberada; nenhuma decisão anterior reaberta.
- **Condição de eficácia:** a Emenda só produz efeito com **chancela expressa**. Sem ela, o regime atual — tudo escalando — permanece, e a métrica de saúde continua sem número.

---
*Minuta emitida pelo Córtex (Control Plane) — 27/10/2026 · Aguardando chancela do CEO · Base: Núcleo Universal v1.2 (P4, P5, P6, R-Mãe G, R-Mãe H, R-Mãe K) · DIR-2710-01 (veículo emenda) · DIR-2710-02 (orçamento) · Gartner press release 26/05/2026 · Master Plan v2.2 §7 (correção pendente de citação).*
