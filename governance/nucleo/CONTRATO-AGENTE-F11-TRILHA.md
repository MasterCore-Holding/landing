# CONTRATO DE AGENTE — TRILHA F1.1 (RETRO-FIT SOB A EMENDA Nº 2 AO NÚCLEO v1.2)

**Nome Canônico do Artefato:** CONTRATO-AGENTE-F11-TRILHA
**Emissor:** Córtex (Control Plane) · **Autoridade Aprovatória Exclusiva:** LÚCIO — CEO MasterCore
**Data-base:** 23/10/2026 · **EMITIDO (D5):** 27/10/2026 · **Registro:** DOC-2610-08 · **Ledger Vivo:** DIR-2710-01 (linha 55)
**Estado declarado (Regra-Mãe K):** Núcleo v1.2 HOMOLOGADO DEFINITIVO desde 14/10 (a5f0944, ledger 1.2.0) · EMENDA Nº 2 HOMOLOGADA via DIR-2710-01 (27/10, Ledger Vivo linha 55; espelho governance/nucleo/EMENDA-N2-NUCLEO-v1.2.md, bump 1.2.4) · Gate F1.1 FECHADO 17/10 (GATE-F11-FECHAMENTO-2026-10-17.md) · Reconciliado contra runtime em 27/10/2026 antes da emissão.

**Agente:** Córtex (Control Plane) · **Função:** trilha de validação dos 6 motores de IA — Eixo 2, F1.1 sob norma (o piloto que estreia a EMENDA Nº 2).

---

## OS 9 CAMPOS

**1. Objetivo mensurável.** Registrar trilha completa (entrada, saída, custo, timestamp) de cada execução dos 6 motores em rodadas de validação. Unidade: 1 linha de log por execução. Meta: 100% das execuções da rodada com trilha íntegra.

**2. Critério de aceite (mecânico).** Arquivo JSONL no repo (`governance/f11-logs/F11-TRILHA-<data>.jsonl`) onde 100% das linhas da rodada contêm os 4 campos obrigatórios + hash de entrada/saída; validação por script de schema + readback GitHub. Aceite = script verde + readback MATCH.

**3. Ferramentas autorizadas (Least Agency).** Execução dos motores via API Base44 (funções dos 6 motores); escrita no repo via Git Data API (token holding). Vedado: tocar produção de usuário real, UI, qualquer outro conector, e escrever em arquivo vivo existente (append-only — lição _PROCESSADOS).

**4. Faixa de risco e gates.** Ambiente: Base44 não tem HML — execuções em produção SOMENTE com payloads sintéticos e motores gated (401 semântico, padrão da bateria 17/10). Não toca dado real de saúde. Nenhum dos 4 Gates Humanos por execução; a RODADA inteira reporta ao CEO no fechamento (gate de desembolso se custo estimado > teto).

**5. Teto de custo por tarefa.** Por rodada: **US$ 0,50** (cinquenta centavos de dólar). Composição do bound: a bateria 17/10 não registrou custo por execução (lacuna que a trilha nova fecha); bound conservador = 6 motores × 1 execução × custo unitário do menor modelo suficiente (Claude Haiku 5.5: US$ 0,10/MTok input, US$ 0,50/MTok output — fonte: platform.claude.com/docs/en/about-claude/pricing, verificado 23/10/2026, dupla confirmação c/ anúncio Anthropic 07/10/2026), assumindo ≤ 50k tokens por execução → ~US$ 0,025/execução → **US$ 0,15/rodada**; teto = 3× o bound ≈ US$ 0,50. **Fronteira do preço de referência:** válido para prompts ≤ 100k tokens; execução acima disso muda a base 5× (US$ 0,50/2,50) e dispara revisão do teto antes de prosseguir. **Regra da unidade de custo (comparabilidade mecânica com o teto):** se a Base44 expõe custo USD por execução → usa direto; se expõe créditos → declara o fator de conversão na linha; se expõe só tokens → computa pelo preço de referência acima. Fallback P8: superfície sem custo por execução → linha registra "sem dados auditáveis" e a verificação de teto ativa quando a telemetria existir — declarado, não implícito. Escolha do modelo ANTES de executar; estouro de teto = parada imediata + escalação ao CEO com o número real (custo acumulado vs teto, na linha).

**6. Critério de promoção.** **Unidade de promoção = RODADA** (o F1.1 é função batch de validação — não há tráfego de usuário a dividir; a escada 1% → 5% → 20% → 100% fica RESERVADA para funções user-facing, não se aplica aqui). Shadow mode: 1ª rodada com trilha completa, resultados comparados ao baseline da bateria T2 ao vivo de 26/10 (runtime 6/6: calcularPepScore 200, gerarInsightCheckIn 200, respostaBeta 200 idempotente, copilotBuscarProtocolo 400, lerExameOnboarding360 400, analisar360 403 gate limpo). Concordância ≥ 95% + custo ≤ teto + zero incidentes → rodada declarada **padrão** e trilha vira rotina contínua (cron). Divergência ou incidente → rollback da rodada (campo 7) + re-run após causa-raiz registrada.

**7. Rollback automatizado.** Trilha append-only (arquivo novo por rodada, nunca sobrescrito); rollback de rodada = re-run; corrupção de commit = revert via Git Data API. Testado antes da 1ª execução (dry-run de 1 linha em arquivo de teste dedicado — nunca em log vivo).

**8. Telemetria.** Cada linha JSONL: `timestamp_utc · motor · payload_hash · output_hash · custo_estimado · resultado · versao_nucleo (v1.2+EMENDA-2)`. Sem evidência → linha registra "sem dados auditáveis" — vedado zero artificial (P8). Trilha navegável: linha → commit → runtime.

**9. Transbordo.** Motor fora do playbook (erro não mapeado, output inesperado, payload rejeitado de forma nova) → escalação humana ao CEO com evidência anexa. Vedado improvisar correção fora do contrato (lição Klarna).

---
*Minuta Córtex 23/10/2026 (D2-D3) · EMITIDO no D5 em 27/10/2026 sob DIR-2710-01 (D4 desacoplado da rodada 1) · Base: despacho arquivado 0c836f5 · fechamento F1.1 17/10 · EMENDA-N2-NUCLEO-UNIVERSAL-v1.2 homologada.*