# CHANGELOG — MasterCore-Holding

Fonte Única de Verdade da holding. Toda decisão operacional e homologação estrutural constará aqui antes de sua ativação efetiva.

## [1.0.11] - 2026-10-10

### Executado (runbook "Deploy e Alinhamento — 3 Sites", chancela PO 10/10)
- **Identidade de marca aplicada nos 3 domínios** (itens 1.2/1.3/3.1): favicon dupla-hélice (MasterCore) + favicon orbe de redes (EngineCore) em produção; avatar circular do logo 3D registrado como variação oficial do Brand Kit (`assets/brand/logo-mastercore-avatar-512.png`).
- **Peça institucional da família** (item 1.4): 3 logos lado a lado (MasterCore + PeptiCore + EngineCore) sobre tokens platina #E5E5EA / preto #0D0D0F — artefato em artifacts Córtex, registro no Brand Kit pendente de espelho.
- **Estado de produção verificado e registrado** (regra proposto ≠ aplicado): PeptiCore v1.43.0 (ledger GitHub, commit d88f5175) SUPERSEDa v1.40.3 do runbook — tag gtag AW-18493068118 + label + pixel + tagline "cálculo de dosagem" = ZERO ocorrências no bundle; paleta canônica Opção A aplicada via tokens CSS (index.css/landing.css); EngineCore 200 standalone com acento #00E5A0/#1B5FFF e 5 seções; mastercore.app 200 com CTAs /qualificacao UTM + instrumentos normativos.
- Commits: 67c2d03 (favicons MC+EC paths), b8d22ae (avatar), 1c39289 (favicon repo enginecore).

*Emissor: Lúcio (CEO, chancela 10/10) · Executor: Córtex (Control Plane) — 10/10/2026.*

## [1.0.10] - 2026-10-09

### Aprovado (definitivo)
- **APROVAÇÃO DEFINITIVA da trinca normativa + DNA pelo CEO** (AUT-MC-20261009-DEFINITIVA, ~23:45 BRT, comando explícito no canal web do Córtex):
  - Núcleo Universal MasterCore **v1.2** — sai de aceite provisório (vigência 20/10) → **VIGENTE definitivo**.
  - Normas Corporativas **v1.0.2** — sai de aceite provisório (vigência 20/10) → **VIGENTE definitivo**.
  - MASTER_PLAN **v2.2** — vigente, base normativa agora definitiva.
  - Manifesto Fundacional DNA do Grupo **v1.0** (P-DNA 1-8) — sai de aceite provisório (condição resolutiva 22/10) → **VIGENTE definitivo**.
- Prazos de 20/10 e 22/10/2026 deixam de produzir efeitos — condição resolutiva cumprida com antecedência. Nenhum instrumento retorna a minuta.
- Derivados por referência (R-Mãe A) herdam o estado definitivo: Pack B2B §0, Córtex v2.0 (skill), Dream Teams/Core OS/Documentos Mestres, playbooks das empresas.
- Registro integral com hashes: `governance/audits/CHANCELA-DEFINITIVA-TRINCA-DNA-2026-10-09.md` (commit 7d148999).

*Emissor: Lúcio (CEO) · Executor: Córtex (Control Plane) — 09/10/2026.*

## [1.0.6] - 2026-10-07

### Adicionado
- Manifesto Fundacional — DNA do Grupo MasterCore v1.0 (P-DNA 1-8) gravado em `governance/audits/MasterCore-DNA-Manifesto-Fundacional-v1.0.md` como pré-requisito de TODA interação do grupo (skills, personas, runbooks, produto, UX, comunicação interna e externa).
- Estado VIGENTE com aceite provisório do CEO (07/10/2026); condição resolutiva: aprovação definitiva em até 15 dias (22/10/2026).
- Herança por referência ao Núcleo Universal v1.2 (R-Mãe A); em conflito, vence o Núcleo (P2).
- Distribuição normativa iniciada: Pack B2B EngineCore §0 (repo) + Córtex v2.0 (skill) atualizados por referência; Dream Teams/Core OS/Documentos Mestres (camada Adapta) via DIRECTIVE MC-DNA-001 no barramento Drive.

*Emissor: Lúcio (CEO) · Executor: Córtex (Control Plane) — runbook "Gravação Permanente do DNA" 07/10/2026.*

## [1.0.0] - 2026-10-05

### Adicionado
- Repositório canônico da holding estabelecido como Single Source of Truth (ledger, normativos, espelhos e histórico).
- Portal institucional consolidado em `public/index.html` (fonte: upload do CEO no repo da org, integridade SHA-256 verificada).
- Logo canônico institucional alocado em `assets/brand/mastercore-logo-canonical.png` com integridade criptográfica verificada (SHA-256 registrado no ledger).
- Ledger estruturado instituído em `ledger/system-ledger.json` com entrada baseline v1.0.0 (authorization_id AUT-MC-20261005-01).

### Pendente (não consolidado nesta versão — atomicidade preservada)
- `governance/normativos/MasterCore-Normas-Corporativas-v1.pdf` — documento físico inexistente; criação de normas societárias é gate humano (chancela CEO).
- `governance/manuals/MC-PUB-001.md` — rascunho v0.9 redigido pelo Córtex, aguarda chancela do CEO para consolidação como v1.0.
- `governance/manuals/MC-QUAL-001.md` — rascunho v0.9 redigido pelo Córtex, aguarda chancela do CEO para consolidação como v1.0.

### Nota de execução
- Runbook "Pacote Autocontido de Consolidação" (05/10/2026) executado de forma parcial e honesta: apenas artefatos reais e íntegros foram consolidados. O bump Minor v1.0.0 → v1.1.0 previsto no runbook fica SUSPENSO até a consolidação dos 5 artefatos canônicos completos, preservando a atomicidade exigida pela Seção 5 do runbook.
