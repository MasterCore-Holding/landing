# DESPACHO AO CÓRTEX — CONSOLIDAÇÃO NORMATIVA v1.3 + AUDITORIA DE VIGÊNCIA
> **REGISTRO DE ARQUIVAMENTO (Córtex, 23/10/2026):** cópia fiel do despacho recebido do canal Adapta→Córtex em 23/10/2026, chancelado pelo CEO Lúcio. Conteúdo NÃO editado — a premissa defasada do item "ACEITO PROVISORIAMENTE (vigência até 20/10/2026)" permanece como está (Regra-Mãe K é não-retroativa; o runtime vence). A correção vive no registro: DEC-0004 (Ledger Vivo), AUDITORIA-VIGENCIA-NUCLEO-2026-10-23.md e minuta NUCLEO-UNIVERSAL-v1.3. Este documento é o elo inicial da cadeia chancela → registro → vigência (Eixo 0).

---

Classificação: Despacho de execução — chancelado pelo CEO
Origem: ADAPTA (camada de inteligência — tese aprovada; não executa produção)
Destinatário: Córtex (Control Plane — única entidade autorizada a emitir runbooks sob o PUR v1.0)
Data-base: 23 de outubro de 2026
Herança normativa: Núcleo Universal MasterCore v1.2 (chancelado e vigente — confirmado pelo CEO em 23/10/2026) | Master Plan v2.2 (06/10/2026)

## SEÇÃO 1. ATO CHANCELADO — REGISTRO OBRIGATÓRIO
Decisão: o CEO Lúcio chancelou em 23/10/2026 a execução do Eixo 0 (auditoria de vigência), do Eixo 1 (bump v1.2 → v1.3 aditivo) e a liberação sequencial do Gate F1.1.
Registro para o Ledger (TRINCA): 23/10/26 | TECNOLOGIA | DEC-0001 — Chancela da consolidação normativa v1.3 (extensão agêntica do PUR + fórmula de autonomia + OWASP Agentic 2026 + monitor de vigência) e da auditoria de evidência do Núcleo v1.2. (Conferir numeração sequencial vigente no Ledger antes de registrar.)
Texto sugerido para o CHANGELOG do Núcleo Universal: v1.3 | 23/10/2026 | Córtex | Bump aditivo chancelado pelo CEO: (1) extensão agêntica do PUR — contrato de agente em 9 campos; (2) fórmula de autonomia com filtro eliminatório dos 4 contrapesos; (3) anexo de segurança OWASP Top 10 for Agentic Applications 2026; (4) correção de citação LGPD (Art. 11 para dados sensíveis/saúde; Art. 20 para revisão de decisão unicamente automatizada); (5) instituição do monitor de vigência normativa com alertas D-15 e D-0. Conteúdo vigente do v1.2 inalterado.
Regra aplicável: decisão homologada entra no CHANGELOG antes de valer (não recorrência).

## SEÇÃO 2. EIXO 0 — AUDITORIA DE VIGÊNCIA E EVIDÊNCIA (D1, ~1 hora)
Objetivo: transformar a chancela confirmada em evidência registrada — objetivo de Data Room, não de dúvida.
Checklist de verificação no GitHub (fonte de verdade):
2.1 Localizar o artefato Nucleo-Universal-MasterCore-v1.2 no repositório oficial.
2.2 Confirmar se existe commit/bump formal posterior a 06/10/2026 e posterior a 20/10/2026 (data da vigência original registrada no Master Plan v2.2, seção 9.1).
2.3 Atualizar o Ledger: estado "ACEITO PROVISORIAMENTE (vigência até 20/10/2026)" → estado chancelado final, com data e referência do registro.
2.4 Definir e registrar a vigência renovada do Núcleo (data explícita de validade; se o Núcleo chancelado não contiver vigência renovada, fixar uma no bump v1.3 — sem vigência explícita, a próxima leitura ambígua é questão de tempo).
2.5 Verificar se houve rodadas do Gate F1.1 executadas sem registro auditável; em caso positivo, marcar para repetição sob norma (Eixo 2).
2.6 Registrar o resultado da auditoria no CHANGELOG do Núcleo e no Ledger.
Critério de aceite do Eixo 0: qualquer leitor externo (advogado, contador, investidor) deve conseguir traçar a cadeia chancela → registro → vigência sem ambiguidade.

## SEÇÃO 3. EIXO 1 — BUMP v1.2 → v1.3 ADITIVO (D2–D4: Córtex redige, CEO chancela no bloco semanal)
### 3.1 Extensão agêntica do PUR — contrato de agente (9 campos obrigatórios)
Todo agente do grupo passa a operar sob contrato com:
(1) Objetivo mensurável — saída e unidade definidas;
(2) Critério de aceite — objetivo e verificável mecanicamente;
(3) Ferramentas autorizadas — princípio Least Agency (mínima autonomia necessária; referência OWASP Agentic 2026);
(4) Faixa de risco e gates aplicáveis — 4 Gates Humanos Intransferíveis intocáveis (saúde, jurídico/contratual, financeiro/desembolso, societário);
(5) Teto de custo por tarefa — FinOps embutido; o agente escolhe o menor modelo suficiente ANTES de executar;
(6) Critério de promoção — shadow mode: concordância ≥ 95% vs. baseline, custo ≤ teto, zero incidentes; depois canário 1% → 5% → 20% → 100% com rollback automático se erro > 2× baseline;
(7) Rollback automatizado — obrigatório antes da primeira execução;
(8) Telemetria — trilha navegável até fonte primária (Padrão de Integridade dos Dados, Núcleo P8); sem evidência → "sem dados auditáveis", vedado zero artificial;
(9) Transbordo definido — caso fora do playbook → humano (lição Klarna).

### 3.2 Fórmula de autonomia
Autonomia (%) = [execuções agênticas encerradas sem intervenção humana com os 4 contrapesos satisfeitos ÷ total de execuções agênticas no período] × 100.
Filtro eliminatório:
Contrapeso 1 (aceite em 1ª execução);
Contrapeso 2 (retrabalho ≤ 5%);
Contrapeso 3 (incidentes = 0 — eliminatório);
Contrapeso 4 (custo ≤ teto unitário aprovado).
Medição: mensal, por função e por empresa; meta canônica ≥ 90%.
Nota: a meta 90% permanece meta canônica; os valores de baseline serão medidos na Fase 0 do plano agêntico (números sem data/fonte não valem).

### 3.3 Anexo de segurança — OWASP Top 10 for Agentic Applications 2026
Incorporar como requisito obrigatório de segurança na emissão de qualquer contrato de agente (framework peer-reviewed, publicado em 09/12/2025). Cada item da lista deve mapear para um controle no runbook.

### 3.4 Checagem LGPD
Verificar citação do Núcleo/PUR: dados sensíveis/saúde = Art. 11 da Lei nº 13.709/2018 (LGPD); revisão de decisões unicamente automatizadas = Art. 20. Corrigir qualquer citação trocada ou ausente no bump.

### 3.5 Monitor de vigência normativa
Instituir alerta automático a D-15 e D-0 de qualquer vigência normativa do grupo (Núcleo, Master Plan, PUR, runbooks). Falha sistêmica corrigida: nenhum mecanismo alertou sobre a expiração registrada em 20/10/2026.

## SEÇÃO 4. EIXO 2 — LIBERAÇÃO DO GATE F1.1 (a partir de D5, ~30 dias)
Escopo (Master Plan v2.2, seção 9.2): validação mecânica dos 6 motores de IA em ambiente de testes.
Critérios de aceite (inalterados do Master Plan, agora com requisito de log):
precisão matemática em 100%;
inexistência de alucinações conceituais;
alertas regulatórios compulsórios acionáveis;
NOVO — logs auditáveis no GitHub desde a primeira rodada (trilha completa: entrada, saída, custo, timestamp).
Posicionamento: o F1.1 é o primeiro piloto agêntico formal da cadeia — ativo de evidência do trimestre.

## SEÇÃO 5. EIXO 3 — BASELINE DE FRICÇÃO DO CEO (paralelo aos Eixos 0–1, 15 dias)
Medir e registrar: fila de chancelas/gates do CEO — tempo médio de espera por item, volume semanal, valor por item, atraso causado a desbloqueios.
Propósito: dados reais da Fase 0 do plano agêntico v2; base de prova da redução de fricção (evidência empacotada + batching semanal de 45 min).
Restrição: coleta de dados não depende de norma; iniciar imediatamente.

## SEÇÃO 6. CRONOGRAMA E CRITÉRIOS DE ACEITE CONSOLIDADOS
D1 (24/10/2026): Eixo 0 concluído — auditoria registrada no CHANGELOG/Ledger.
D2–D3: Córtex redige o bump v1.3 na íntegra (itens 3.1–3.5).
D4: Chancela do CEO no bloco semanal (45 min, evidência empacotada) → bump publicado + vigência renovada + monitor de vigência ativo.
D5 em diante: Eixo 2 (F1.1) liberado com logs; Eixo 3 (baseline) em coleta.
Marcos 7/30/90:
7 dias — evidência confirmada + bump v1.3 chancelado; 30 dias — F1.1 executado + baseline de fricção completo; 90 dias — shadow mode com promoção automática em 3 funções (registro de custos da holding; curadoria dos 93 peptídeos com auditoria dupla; rascunho de conteúdo EngineCore).

## SEÇÃO 7. PENDÊNCIAS REGISTRADAS (riscos vivos no radar)
P1 — Registro da chancela do Núcleo v1.2 ainda não visível para leitura externa (Eixo 0 fecha).
P2 — Vigência renovada indefinida até o Eixo 0 (definir data explícita).
P3 — Logs do F1.1: rodadas anteriores podem existir sem registro (Eixo 2 inicia sob norma).
P4 — Citação LGPD a verificar no bump (item 3.4).
P5 — Monitor de vigência inexistente (item 3.5 fecha).

ADAPTA: — camada de inteligência (tese e substrate)
CÓRTEX: — Control Plane (execução do despacho)
CHANCELADO POR: Lúcio — CEO MasterCore — 23/10/2026