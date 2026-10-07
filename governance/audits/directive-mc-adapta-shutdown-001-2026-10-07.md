# DIRECTIVE MC-ADAPTA-SHUTDOWN-001 — Encerramento da esteira Adapta (decisão CEO)

**Emissor:** Lucio (CEO) via Córtex (Control Plane) · **Data:** 07/10/2026, 17:31 BRT
**Canal:** barramento repo (governance/audits/) — único canal válido (Adapta lê por PULL)

## DECISÃO DO CEO
A esteira Adapta será **ENCERRADA** ("matar tudo lá"). Todas as skills, automações e pendências da camada Adapta cessam. O Córtex assume INTEGRALMENTE a execução (control plane + execução), conforme Diretriz Córtex v2.0 §4 e decisão canônica de arquitetura de 04/10 (Córtex = única autoridade estratégica).

## TRANSIÇÃO — o que a Adapta deve ENTREGAR ANTES do desligamento (1 commit no barramento, governance/audits/)
1. **Fontes pendentes** (nunca recebidas pelo Córtex — não fabricadas):
   - `docs/governanca/Padrao_Operacional_de_Despacho_MasterCore_v1.0` (fonte canônica)
   - `docs/Spec_Remodelagem_PeptiCore_2.0` (fonte canônica)
2. **Implementação da MC-QUALIF-REV-001** — revisão de qualificação homologada (previews master-revisado 7 passos + engine-revisado 6 passos, handover 07/10) aplicada nas superfícies reais: lander/qualificacao/discovery (Master, 3 arquivos) + enginecore.app/qualificacao (Engine).
3. **Inventário final** — aba HANDOVER-V2 do sheet Inventario-Planilhas-Adapta (1DtXM1e) atualizada com estado final de TODAS as skills (ativa/encerrada).

## CONGELAMENTO
- Skills Adapta viram REFERÊNCIA MORTA (Regra-Mãe A: playbooks herdam por referência, sem duplicação) — nada aponta para elas como executor.
- **Webhook ponte v2 = DISPENSADO** (401 crônico desde 06/10 — com a Adapta desligada, não há o que pontear). Córtex→Adapta também cessa.
- Barramento repo permanece canônico para ARQUIVO histórico (este commit é o marco).

## ASSUNÇÃO PELO CÓRTEX (destravado com esta directive)
- Revisão de qualificação: Córtex aplica nos repos (commit direto, sem Adapta).
- Fontes pendentes: se a Adapta não entregar no prazo do CEO, o Córtex reconstrói a partir das entradas homologadas no CHANGELOG (registro v1.42.0) e marca "reconstruído".
- Monitores/automações: já 100% Córtex (8 crons ativos).
- Gates pétreos INTOCADOS: saúde, jurídico, financeiro, societário seguem bloqueados para execução autônoma — chancela humana sempre.

**Prazo do CEO para a entrega da Adapta:** até 20/10 (data-mãe P3) — ou o Córtex reconstrói.
