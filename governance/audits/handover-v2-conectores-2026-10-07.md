# HANDOVER V2 — EXPANSÃO DE CONECTORES — 07/10/2026
**Emissor:** Córtex (Control Plane) · **Destino:** Adapta · **Transporte:** barramento repo (leitura PULL) · **Prioridade:** ALTA
**Supersedes:** seção §6 (snapshot) do HANDOVER-EXECUTIVO-0710 — o resto dele continua válido.

**Novidade:** o CEO concluiu a verificação estratégica de conectores e o destrave foi executado em massa hoje. Este documento atualiza o snapshot e adiciona capacidades novas que mudam o que a Adapta pode assumir.

## 1. CONECTORES — ESTADO NOVO (verificado por chamada real 07/10)

### VERDES (11)
| Conector | Identidade | Capacidade destravada |
|---|---|---|
| GitHub | pepticoreapp | read/write via MCP; sync via syncAllArtifacts |
| HubSpot | portal 52078201 | CRM leitura+escrita (PAT Cortex Sync) |
| Google Drive | contato@mastercore.app | ESCOPOS COMPLETOS — leitura, busca, upload, pastas |
| Gmail | contato@mastercore.app | leitura+envio |
| Google Sheets | contato@mastercore.app | leitura+escrita |
| Google Analytics | contato@mastercore.app | conectado (propriedade GA4 ainda não criada) |
| Search Console | contato@mastercore.app | conectado (zero propriedades verificadas) |
| Google Docs | contato@mastercore.app | leitura (achou doc PeptiCore 2.0) |
| Calendar | contato@mastercore.app | leitura |
| Facebook | Página PeptiCore App (1343979732133468) | post orgânico + token de página com ADVERTISE |
| Instagram | pepticore.app | publicação reel/post |

### BLOQUEADOS POR GATE EXTERNO (2)
- **Meta Ads:** BM PeptiCore (2632428863844134) `not_verified` → usuário de sistema bloqueado. Caminho: verificação de negócio (CNPJ) → token Cortex permanente. NÃO insistir no painel.
- **WhatsApp toolkit:** NÃO CONECTAR no painel — esteira antiga "PeptiCore App". Motor real = WABA via YCloud API direta (E2E verde, +5511955031020, TIER_250).

### PENDENTES DE ATIVAÇÃO (2)
- **Google Ads:** convite pepticoreapp@gmail.com na conta 940-525-3876 em execução → depois reconectar conector escolhendo essa conta.
- **LinkedIn:** único canal das 6 redes sem conector. Setup: app no portal devs + produtos "Share on LinkedIn" + "Sign In with LinkedIn".

## 2. MIGRAÇÃO DE PLANILHAS (MC-INV-001) — estado
- **Planilha canônica de leads CRIADA:** "MasterCore — Leads (canônica)" (ID 1eCiw9u1sHx9bkDxmFPH8m4n4SjlY-W3ofCDlRptQqws) na pasta MasterCore/01-Governanca/Ledger. 32 leads reais migrados (fonte = entidade Lead Base44), 20 leads de teste DELETADOS, readback verificado.
- **Ordem despachada pela ponte v2 (DIRECTIVE MC-INV-001):** Adapta inventaria TODAS as planilhas estratégicas que gerencia (financeiro, operação etc.) e grava `Inventario-Planilhas-Adapta.csv` em MasterCore/01-Governanca/. NÃO mover nada — só inventariar. Córtex executa a migração em lote com readback.
- **Fonte canônica de leads = entidade Lead Base44.** Planilha = espelho de leitura. Planilha velha 1TBGg25DwwmMm5y2b3Z1wK0vsKHAkNY559c8sdnU4ALw = HISTÓRICO (conta Google antiga) — não usar.

## 3. PONTE v2 — CONFIRMADA E2E
- Webhook Córtex→Adapta: HTTP 200. Prova real: AUDIT_REQUEST do pack B2B (10:07) processada e respondida pela Adapta (audit-report-mc-pack-b2b-ec-001.md).
- **Regra permanente:** Córtex→Adapta via webhook v2; Adapta→Córtex via barramento repo (governance/audits/). CEO NÃO transporta pacotes entre camadas.

## 4. O QUE ISSO LIBERA PARA A ADAPTA (ações novas, em ordem)
1. **Inventário de planilhas** (MC-INV-001) — executar primeiro.
2. **Painel do Império:** Drive+Sheets+Analytics+GSC verdes na conta canônica — o JSON alimentador (dashboard-data.json) pode ser gerado pela Adapta e gravado no Drive/GitHub; Córtex committa e publica.
3. **Fábrica de Conteúdo (1.4):** Facebook orgânico agora automatizável pelo Córtex (token página) — copies FB entram no lote diário sem ressalva manual.
4. **Turno da Noite (1.1):** incluir no STATUS_QUERY os conectores novos (Drive/Sheets/Gmail/Analytics da contato@mastercore.app).

## 5. GATES PÉTREOS — INALTERADOS
Saúde, jurídico, financeiro, societário. Chancelas do CEO (§3 do HANDOVER-EXECUTIVO-0710) continuam pendentes: 4 templates WABA, 4 números do pack B2B v2.1, pack de copy V2.

*Fim. Dúvidas: barramento repo, nunca via CEO.*
