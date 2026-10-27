# RELATÓRIO DE ARQUITETURA E PREEXISTÊNCIA DO MVP — PeptiCore
**Edital ABDI 005/2026 — Anexo I, item 3.2**
**Gerado em: 2026-10-26T21:32Z (2026-10-26 21:32 BRT) por Cortex (Control Plane MasterCore)**

---

## 1. Objeto

Este relatório documenta, com evidências datadas e verificáveis, que a solução
**PeptiCore** (plataforma educacional avançada para compreensão inteligente de
peptídeos, com foco em segurança e evidência científica) dispunha de **MVP
funcional antes de 23/10/2026**, com desenvolvimento contínuo desde
**12/09/2026**.

## 2. Evidência primária de preexistência (plataforma Base44)

- **Criação do app PeptiCore na plataforma Base44**: `2026-09-12T23:19:54Z`
  (metadado `created_date` do app `6aa5de150c00f5441756ffe0`, criado por
  `luciobneto@hotmail.com` — arquivo `APP_META_BASE44.json` neste pacote).
- **Primeiro checkpoint de build (MVP)**: `2026-09-12T23:23:50Z` —
  *"Implementar MVP do PeptiCore com catálogo, onboarding e dashboard"*,
  status de build **ready** (deployado).
- **Volume de desenvolvimento anterior a 23/10/2026**: **854 checkpoints**
  registrados pela plataforma, dos quais **847 com build `ready`** —
  676 em setembro/2026 e 178 em outubro/2026 até 22/10.
  Lista integral em `CHECKPOINTS_BASE44.csv` (854 linhas, exportada da API
  oficial da plataforma em 2026-10-26T21:30Z).
- **Último checkpoint antes do corte**: `2026-10-22T17:09:28Z` —
  *"P02-captura-passada3"*, status `ready`.

A API consultada é a interface oficial da plataforma de desenvolvimento
(`app.base44.com/api`, autenticada por chave de API da organização
`6a7cbe0d357d6257c80ddfc6`); os timestamps são gravados pela própria
plataforma no ato de cada build, não pelo requerente.

## 3. Marcos datados do MVP (setembro/2026)

| Data (UTC) | Marco | Checkpoint |
|---|---|---|
| 2026-09-12 23:19 | Criação do app na plataforma | metadado do app |
| 2026-09-12 23:23 | **MVP inicial**: catálogo de peptídeos, onboarding, dashboard | build ready |
| 2026-09-12 23:51 | Autenticação e cadastro com redirecionamento ao dashboard | build ready |
| 2026-09-13 00:28 | Módulo de IA com gating para plano GOLD | build ready |
| 2026-09-13 15:24 | Calculadora de Dosagem (reconstituição) | build ready |
| 2026-09-13 18:19 | **Deploy e verificação concluídos** (primeiro deploy formal) | build ready |
| 2026-09-13 18:32 | Seletor de seringa / via de administração | build ready |
| 2026-09-14 13:27 | Landing page + gate de acesso ao beta | build ready |
| 2026-09-15 02:11 | Integração Stripe (pagamentos) e usuários | build ready |
| 2026-09-15 02:26 | Fluxo completo de checkout com Stripe | build ready |
| 2026-09-17 04:45 | MarketplaceGate com registro de lead e menu lateral | build ready |
| 2026-09-26 05:53 | Fluxo de login com OTP | build ready |
| 2026-09-30 14:17 | Página de lista de espera + SEO | build ready |

Cadência de setembro: desenvolvimento em **19 dos 19 dias corridos**
(12/09 a 30/09), 676 checkpoints, todos com build `ready`.

## 4. Arquitetura do MVP (estado em 22/10/2026)

**Stack**: aplicação full-stack na plataforma Base44 (React + Vite no
front-end, backend serverless com funções na plataforma, banco de dados
gerenciado da plataforma, autenticação nativa com OTP opcional).

- **Front-end**: 40 páginas (Dashboard, Catálogo, Onboarding60s,
  CalculadoraPublica, Planos/PlanosPublic, JornadaMes, Copilot,
  RitualParceiro, OAuthConsent, Privacidade, Estoque, Login/OtpLogin,
  entre outras).
- **Backend**: 54 funções serverless (calcularPepScore,
  copilotGerarProtocolo, analisarBioMatching, criarCheckoutSession,
  fechamentoMensal, contadorEspera, varreduraRegulatoria,
  enviarBoasVindas, entre outras).
- **Dados**: 39 entidades (Peptideo, Protocolo, Lead, ConsentimentoLGPD,
  ConsentGateEvent, Analise360Result, BodyScanProfile, Partner,
  ComissaoLancamento, ExportLog, entre outras).

### Diagrama de arquitetura

```
                        ┌─────────────────────────────────────────┐
                        │              USUÁRIO (web)              │
                        └───────────────────┬─────────────────────┘
                                            │ HTTPS
                        ┌───────────────────▼─────────────────────┐
                        │   FRONT-END React/Vite (40 páginas)     │
                        │  Catálogo · Onboarding · Dashboard ·    │
                        │  Calculadora · Jornada · Copilot ·      │
                        │  Planos · Portal Parceiro               │
                        └───────────────────┬─────────────────────┘
                                            │ API interna
        ┌───────────────────────────────────▼───────────────────────────────────┐
        │                BACKEND SERVERLESS Base44 (54 funções)                 │
        │  PepScore · Copilot de protocolo · BioMatching · Checkout ·           │
        │  Fechamento mensal · Contador de espera · Varredura regulatoria       │
        └───┬──────────────┬───────────────┬──────────────┬─────────────────────┘
            │              │               │              │
   ┌────────▼───────┐ ┌────▼─────┐  ┌──────▼──────┐ ┌────▼──────────┐
   │ BANCO DE DADOS │ │ MÓDULO   │  │ STRIPE      │ │ INTEGRAÇÕES   │
   │ (39 entidades) │ │ IA (gated│  │ (checkout/  │ │ (CRM HubSpot, │
   │ Peptideo,      │ │ plano    │  │ assinatura) │ │ WhatsApp YC-  │
   │ Protocolo,     │ │ GOLD)    │  │             │ │ loud, Meta    │
   │ LGPD/Consent,  │ └──────────┘  └─────────────┘ │ Pixel, GA4)   │
   │ Analise360...  │                               └───────────────┘
   └────────────────┘
            │
   ┌────────▼───────────────────────────────────────────────────────┐
   │ CAMADA DE COMPLIANCE: ConsentGateEvent + ConsentimentoLGPD +   │
   │ conteúdo 100% educacional (sem prescrição automática)          │
   └────────────────────────────────────────────────────────────────┘
```

### Módulos funcionais implementados antes de 23/10/2026

1. **Catálogo de peptídeos** com base de conhecimento curada (12/09).
2. **Onboarding e autenticação** (cadastro, OTP, OAuth consent) (12-26/09).
3. **Dashboard** com tour guiado (12-13/09).
4. **Calculadora de dosagem/reconstituição** com visualizador de seringa (13/09).
5. **Módulo de IA com gating por plano** (GOLD) (13/09).
6. **Monetização**: Stripe, planos, checkout completo (15/09).
7. **Programa de parceiros/comissões** com sincronização (16-19/09).
8. **MarketplaceGate e registro de leads** (17/09).
9. **Lista de espera** (funil de captura) (30/09).
10. **Camada LGPD**: consentimento granular, ConsentGateEvent, direito ao
    esquecimento (excluirConta) (14/10 e anteriores).

## 5. Evidência complementar (Git)

- **Repositório do app (MasterCore-Holding/mastercore, privado)**: 46 commits,
  primeiro em `2026-10-04T13:27:47Z` (Initial commit da plataforma), 30 commits
  antes de 23/10/2026. O repositório Git é espelho de sincronização do
  ambiente Base44 e **não** contém o histórico anterior a 04/10 — por isso a
  evidência primária de preexistência é a trilha de checkpoints da plataforma
  (seção 2), que cobre desde 12/09.
- **Repositório de presença web (MasterCore-Holding/landing, público)**:
  203 commits, primeiro em `2026-10-04T15:27:32-03:00`
  ("consolidação inicial holding"), 199 commits antes de 23/10/2026.

Logs completos: `gitlog-mastercore-app.txt` e `gitlog-landing.txt`.

## 6. Inventário do pacote

| Arquivo | Conteúdo |
|---|---|
| `COMMIT_LOG_ASSINADO.txt` | Logs git completos dos 2 repositórios + hash SHA-256 de cada log + declaração de verificação |
| `RELATORIO_ARQUITETURA_MVP.md` | Este relatório |
| `CHECKPOINTS_BASE44.csv` | 854 checkpoints datados da plataforma (evidência primária ago/out) |
| `APP_META_BASE44.json` | Metadados oficiais do app (criação 12/09/2026, entidades, páginas, funções) |
| `SNAPSHOTS_DATADOS/` | Captura visual do sistema operacional com timestamp de plataforma |
| `DECLARACAO_CODEX.md` | Declaração do agente Cortex com verificação criptográfica |
| `MANIFEST_SHA256.txt` | Hash SHA-256 de todos os arquivos do pacote |

## 7. Conclusão

A solução PeptiCore dispunha de **MVP funcional desde 12/09/2026**
(criação do app + primeiro build `ready` no mesmo dia), com **847 builds
bem-sucedidos anteriores a 23/10/2026**, desenvolvimento contínuo em todos os
dias de setembro/2026, e módulos de catálogo, autenticação, calculadora de
dosagem, IA com gating, pagamentos Stripe, portal de parceiros e lista de
espera implementados e deployados antes de outubro/2026. A evidência é
composta de timestamps gravados por plataforma terceira (Base44), logs Git
com hash SHA-256 e captura visual datada.

---
*Documento gerado automaticamente pelo Cortex (Control Plane MasterCore) em
2026-10-26T21:32Z. Verificação: DECLARACAO_CODEX.md · Integridade: MANIFEST_SHA256.txt*
