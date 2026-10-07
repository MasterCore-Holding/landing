# HANDOVER — Revisão de Qualificação (Master + Engine)
**Emissor:** Córtex · **Data:** 07/10/2026 · **Para:** sessão Adapta (implementação) · **Status:** aguardando chancela CEO → implementação
**Fontes verificadas na íntegra pelo Córtex (07/10):** `mastercore.app/lander/` ≡ `/qualificacao/` ≡ `discovery.html` (10 perguntas idênticas) e `enginecore.app/qualificacao/` (5 passos). HTMLs arquivados em `work/qualif-audit/` do Córtex.

---

## 1. CONTEXTO (uma frase)
Auditoria comparativa das perguntas de qualificação dos dois mini sites identificou 6 perguntas duplas/triplas no Master, 1 ambiguidade real (P8), o maior atrito no P5 (textão livre), e no Engine ausência de segmento e métrica de sucesso — 10 revisões propostas e aprovadas em princípio pelo CEO no chat do Córtex (07/10, ~02:40).

## 2. O QUE MUDA (spec canônica — 14 mudanças)

### Master — "Diagnóstico de Prontidão" (10 → 7 passos)
Aplicar nos 3 arquivos: `lander/index.html`, `qualificacao/index.html`, `discovery.html` (repo `MasterCore-Holding/landing`, branch main). As 3 superfícies devem ficar idênticas.

| Nova etapa | Conteúdo | Substitui |
|---|---|---|
| 1 | Formato (4 opções) + Problema (textarea) + Para quem (textarea) + custo mensal (opcional) | P1+P2 fundidas |
| 2 | Perfil da pessoa típica (textarea) + estágio de validação (4 opções) | P3 separada |
| 3 | Maior benefício (1 de 5) + recursos da 1ª versão (6 checkboxes) | P4 |
| 4 | **P5 ESTRUTURADA**: "Quem pede?" (3 opções) + "Quem atende?" (3 opções) + "O que acontece depois?" (3 opções) + detalhe opcional | P5 (textão livre eliminado) |
| 5 | Modelo de receita (1 de 6) + outro (opcional) | P6 |
| 6 | **"O que ainda FALTA?"** (6 checkboxes) + "O que JÁ EXISTE e pode ser aproveitado?" (opcional) | P8 (ambiguidade falta/existe eliminada) |
| 7 | Prazo (4 faixas, data crítica opcional) + métrica de sucesso (5 opções) + nome/e-mail/WhatsApp + LGPD | P9+P10 fundidos, "porquê" vira opcional |

**Removido:** P7 como pergunta aberta ("Quem mais já faz isso?") — o diferencial já é capturado na nova etapa 3; se quiser manter, vira 1 frase opcional ("Quem mais faz algo parecido?").

### Engine — "Diagnóstico de Crescimento" (5 → 6 passos)
Aplicar em `qualificacao/index.html` (repo `MasterCore-Holding/enginecore`, branch main).

| Mudança | Detalhe |
|---|---|
| Passo 1 | + escolha de **SEGMENTO** (Serviços / E-commerce / Infoproduto / SaaS / Outro) |
| Passo 2 | opções reescritas em RESULTADO: "Mais clientes", "Mais retenção", "Automação do funil", "Presença de marca", "Não sei — quero um diagnóstico" |
| Passo 3 | de-jargonizar: "Estou saturando / CAC subindo" → **"Resultado caindo / saturando"** (jargão só na descrição) |
| Passo 4 | de-jargonizar: "fee mínimo operacional" → **"Fee mínimo + % sobre a receita comprovadamente gerada"** (título "Pagar por resultado") |
| Passo 5 | inalterado (urgência + faixas R$) |
| Passo 6 | **NOVO**: "Como você mede se deu certo?" (Faturamento / Leads / Tempo livre / Marca / Outro) |

## 3. PREVIEWS DE HOMOLOGAÇÃO (anexados ao chat do Córtex)
- `artifacts/preview-master-revisado.html` — navegável passo a passo, banner "PREVIEW — NÃO PUBLICADO".
- `artifacts/preview-engine-revisado.html` — idem.
- **Gate:** CEO homologa os previews (ou ajusta) ANTES de qualquer commit. Nada publicado sem chancela (Adendo 2).

## 4. IMPACTO NO BACKEND (mapear antes de escrever)
- **Master:** o submit vai ao `registrarLeadAppsScript` (Base44, app PeptiCore) via colunas da planilha. Mapear: campos novos/renomeados da jornada (fusões P1+P2, P9+P10) precisam de colunas correspondentes ou campo `observacao` (já persiste até 4000 chars — verificado em produção 06/10). **Não perder UTM/refCapture/validarRefCode** — intocáveis.
- **Engine:** o submit usa o mesmo motor `registrarLeadAppsScript` (jornada EngineCore já testada E2E 06/10, persistência OK). Mapear os 2 campos novos (segmento, métrica de sucesso) no payload.
- Regra: **read-before-write** — a Adapta lê o backend atual antes de alterar qualquer handler.

## 5. CHECKLIST DE EXECUÇÃO (Adapta)
1. [ ] CEO homologa os 2 previews (ou devolve ajustes).
2. [ ] Ler backend `registrarLeadAppsScript` + entidade Lead + planilha canônica (Leads canônica `1eCiw9u1sHx9bkDxmFPH8m4n4SjlY-W3ofCDlRptQqws`) e mapear campos.
3. [ ] Implementar Master nos 3 arquivos (landing) — mesma spec, 3 cópias.
4. [ ] Implementar Engine (enginecore) — 6 passos.
5. [ ] Teste local: jornada completa dos 2 forms + conferência de payload no backend.
6. [ ] Commit + CHECKLIST GOV (changelog + sync/version.json bump minor → v1.43.0 / v1.1.0).
7. [ ] Deploy produção + teste E2E humano (1 lead real de teste em cada).
8. [ ] Registrar no Ledger + avisar Córtex via barramento repo (`governance/audits/`).

## 6. O QUE NÃO FAZER
- Não publicar sem chancela do CEO (Adendo 2).
- Não mexer em UTM capture, ref_code/anti-fraude, LGPD checkbox do Master (permanece explícito).
- Não tocar no form HubSpot (superfície separada, sem relação com esta revisão).
- Não replicar spec por chat anexo — esta handover é a fonte; dúvida = perguntar ao Córtex via barramento.

## 7. ESTADO DOS ARTEFATOS
- Previews: `artifacts/preview-master-revisado.html`, `artifacts/preview-engine-revisado.html` (Córtex).
- Auditoria completa (perguntas lado a lado + análise): entregue no chat do Córtex 07/10 ~02:37; fontes em `work/qualif-audit/`.
- Nenhum commit feito nos dois repos por esta frente até agora.

---
**Contato:** Córtex (chat web do Lucio). Se a Adapta divergir de algo da spec, o Córtex arbitra.
