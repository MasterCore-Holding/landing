# DIRECTIVE MC-QUALIF-REV-001 — Revisão de Qualificação Master + Engine
**Emissor:** Córtex (Control Plane) · **Data:** 07/10/2026, 10:05 BRT · **Destino:** Adapta (implementação) · **Transporte:** barramento repo (leitura PULL) · **Prioridade:** ALTA
**Status:** aguardando chancela CEO nos previews → implementação

---

## 1. Contexto (uma frase)
Auditoria comparativa das perguntas de qualificação dos dois mini sites (10 passos Master vs 5 passos Engine) identificou 6 perguntas duplas/triplas no Master, 1 ambiguidade real (P8 falta/existe), o maior atrito no P5 (textão livre) e, no Engine, ausência de segmento e métrica de sucesso — revisões propostas e aprovadas em princípio pelo CEO (chat Córtex, 07/10 ~02:40).

## 2. Previews de homologação (navegáveis, offline, banner "NÃO PUBLICADO")
- `preview-master-revisado.html` — 10 → 7 passos (fusões P1+P2 e P9+P10; P5 estruturada em 3 escolhas; P8 desambiguada).
- `preview-engine-revisado.html` — 5 → 6 passos (+segmento no passo 1; +métrica de sucesso no passo 6; opções reescritas em resultado; jargão CAC/fee removido dos títulos).
- **Onde pegar:** ZIP autocontido `handover-revisao-qualificacao-0710.zip` (sha256 `58e7daf78626937996ae3f81480275cb7cab75508393e562560a8fe384130301`, 7 membros: 2 previews + handover .md + 4 fontes atuais para diff). Anexado ao chat do CEO (Córtex, 09:35). Os previews funcionam com duplo clique, sem internet.
- **Gate:** CEO homologa os previews (ou ajusta) ANTES de qualquer commit. Nada publicado sem chancela (Adendo 2).

## 3. Spec canônica de implementação (14 mudanças)

### Master — "Diagnóstico de Prontidão" (10 → 7 passos)
Aplicar nos 3 arquivos: `lander/index.html`, `qualificacao/index.html`, `discovery.html` (repo `MasterCore-Holding/landing`, branch main). As 3 superfícies devem ficar idênticas.

| Nova etapa | Conteúdo | Substitui |
|---|---|---|
| 1 | Formato (4 opções) + Problema (textarea) + Para quem (textarea) + custo mensal (opcional) | P1+P2 fundidas |
| 2 | Perfil da pessoa típica (textarea) + estágio de validação (4 opções) | P3 separada |
| 3 | Maior benefício (1 de 5) + recursos da 1ª versão (6 checkboxes) | P4 |
| 4 | "Quem pede?" (3 opções) + "Quem atende?" (3 opções) + "O que acontece depois?" (3 opções) + detalhe opcional | P5 (textão livre eliminado) |
| 5 | Modelo de receita (1 de 6) + outro (opcional) | P6 |
| 6 | "O que ainda FALTA?" (6 checkboxes) + "O que JÁ EXISTE e pode ser aproveitado?" (opcional) | P8 (ambiguidade eliminada) |
| 7 | Prazo (4 faixas; data crítica opcional) + métrica de sucesso (5 opções) + nome/e-mail/WhatsApp + LGPD | P9+P10 fundidos; "porquê" vira opcional |

**Removido:** P7 ("Quem mais já faz isso?") como pergunta aberta — o diferencial já é capturado na nova etapa 3; opcionalmente vira 1 frase opcional.

### Engine — "Diagnóstico de Crescimento" (5 → 6 passos)
Aplicar em `qualificacao/index.html` (repo `MasterCore-Holding/enginecore`, branch main).

| Mudança | Detalhe |
|---|---|
| Passo 1 | + escolha de SEGMENTO (Serviços / E-commerce / Infoproduto / SaaS / Outro) |
| Passo 2 | opções reescritas em RESULTADO: "Mais clientes", "Mais retenção", "Automação do funil", "Presença de marca", "Não sei — quero um diagnóstico" |
| Passo 3 | de-jargonizar: "Estou saturando / CAC subindo" → "Resultado caindo / saturando" (jargão só na descrição) |
| Passo 4 | de-jargonizar: "fee mínimo operacional" → "Fee mínimo + % sobre a receita comprovadamente gerada" (título "Pagar por resultado") |
| Passo 5 | inalterado (urgência + faixas R$) |
| Passo 6 | NOVO: "Como você mede se deu certo?" (Faturamento / Leads / Tempo livre / Marca / Outro) |

## 4. Impacto no backend (mapear ANTES de escrever)
- **Master:** submit vai ao `registrarLeadAppsScript` (Base44, app PeptiCore). Mapear campos fundidos/renomeados da jornada para colunas da planilha canônica ou campo `observacao` (persiste até 4000 chars — verificado em produção 06/10).
- **Engine:** mesmo motor; mapear os 2 campos novos (segmento, métrica de sucesso) no payload.
- **Read-before-write** obrigatório; UTM capture / refCapture / validarRefCode / LGPD checkbox do Master = INTOCÁVEIS.

## 5. Checklist de execução (Adapta)
1. [ ] Aguardar chancela do CEO nos previews (ou ajustes dele).
2. [ ] Ler backend `registrarLeadAppsScript` + entidade Lead + planilha canônica (`1eCiw9u1sHx9bkDxmFPH8m4n4SjlY-W3ofCDlRptQqws`) e mapear campos.
3. [ ] Implementar Master nos 3 arquivos (mesma spec, 3 cópias idênticas).
4. [ ] Implementar Engine (6 passos).
5. [ ] Teste local: jornada completa dos 2 forms + conferência do payload no backend.
6. [ ] Commit + bump minor (landing → v1.43.0; enginecore → v1.1.0) com CHANGELOG.
7. [ ] Deploy produção + teste E2E humano (1 lead de teste em cada, depois deletar).
8. [ ] Registrar AUDIT_REPORT em `governance/audits/` ao iniciar e ao concluir.

## 6. O que NÃO fazer
- Não publicar sem chancela do CEO (Adendo 2).
- Não mexer em UTM/ref_code/anti-fraude/LGPD.
- Não tocar no form HubSpot (superfície separada, fora desta revisão).
- Não replicar spec por chat anexo — ESTA directive é a fonte; dúvida = barramento repo.

---
*Fim. Dúvidas: barramento repo, nunca via CEO.*
