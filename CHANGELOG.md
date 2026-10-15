# CHANGELOG — MasterCore-Holding

Fonte Única de Verdade da holding. Toda decisão operacional e homologação estrutural constará aqui antes de sua ativação efetiva.

## [1.3.0] - 2026-10-15

### Alterado (RUNBOOK MC-LANDING-ALIGN-01 — Item 1, chancela CEO 15/10 + Adendos)
- **[Landing]** Banner de simulação inserido acima do Painel de Telemetria e Transparência (texto exato do runbook, discreto, desktop+mobile).
- **[Landing]** Seção de ventures substituída: título "Ventures na esteira MasterCore" + 5 cards (PeptiCore beta fechado, EngineCore operante, LongevCore em fundação, StyleCore em estudos — token {{NOME_VENTURE_MODA}} substituído por StyleCore conforme Adendo 15/10, DAIS em estruturação) + frase de fechamento (IFRS 10/CPC 36, telemetria auditável, supervisão humana mandatória, automação até 90% nunca além).
- **[Landing]** Link da EngineCore nas ventures aponta para https://enginecore.app com UTM conheçer_venture (legado mastercore.app/enginecore removido — zero ocorrências).
- **[Landing]** Nomenclatura: "MasterCore OS" deixou de ser sujeito (4 reescritas + 2 no bloco DPD) — padrão "nossa plataforma proprietária, o MasterCore OS…". MasterCore = holding; MasterCore OS = plataforma.
- **[Landing]** Novo bloco "O Ecossistema MasterCore" antes do footer (texto exato do runbook + links PeptiCore/EngineCore com UTM ecossistema).
- **[Landing]** Manifesto do grupo no footer + assinatura "MasterCore · PeptiCore · EngineCore — empresas do Grupo MasterCore."
- Escopo congelado respeitado; public/index.html (cópia legada obsoleta) intocado. Evidência de runtime em governance/audits/.

*Emissor: Adapta (runbook MC-LANDING-ALIGN-01, adendos 15/10) · Executor: Córtex (Control Plane) — 15/10/2026.*

## [1.2.0] - 2026-10-14

### Governança — Homologação definitiva
- **[Governança]** Núcleo Universal MasterCore **v1.2** promovido de ACEITO PROVISORIAMENTE para **HOMOLOGADO DEFINITIVO** (chancela CEO 14/10/2026; condição resolutiva 20/10 cumprida).
- **[Governança]** Fonte-mãe de governança do grupo (P1–P10, R-Mãe A–J, matriz de papéis, faixas de risco, 4 Gates Humanos Intransferíveis) agora vigente em definitivo.
- Espelho Markdown canônico publicado: `governance/Nucleo-Universal-MasterCore-v1.2.md` (conteúdo idêntico ao PDF canônico `9cf95292…`, cabeçalho realinhado à homologação).
- Auditoria: `governance/audits/HOMOLOGACAO-NUCLEO-UNIVERSAL-v1.2-2026-10-14.md`.

**[Alinhamento]** persona=Córtex; criterio=HOMOLOGACAO_DEFINITIVA; status=cumprido

*Emissor: Lúcio (CEO, runbook PUR v1.0 ditado em 14/10/2026) · Executor: Córtex (Control Plane) — 14/10/2026.*

## Registro 2026-10-14 — sem bump (execução de runbook; bump só na consolidação EOD)

### Alterado (RUNBOOK PUR v1.0 — Separação de Ambientes EngineCore v1.0, chancela CEO 14/10)
- **Vínculo EngineCore→holding encerrado na camada de conteúdo** — site próprio (repo `MasterCore-Holding/enginecore`, Pages standalone, domínio enginecore.app + cert aprovado) passa a ser a ÚNICA fonte pública da EngineCore:
  - `go/enginecore/` agora redireciona para `https://enginecore.app/qualificacao/` (antes: cópia legada `mastercore.app/enginecore/`).
  - Link "Conhecer venture" do portal aponta para `https://enginecore.app/` (antes: cópia legada).
  - Host-matcher do `index.html` (visitas via domínio EngineCore caídas na holding) redireciona para `https://enginecore.app/` em vez da pasta legada.
  - Pasta legada `enginecore/` convertida em stubs de redirect 1:1 (index, lander, qualificacao) — links de posts antigos continuam funcionando; assets binários legados removidos.
  - Estado pré-existente verificado ao vivo (recon 14/10 ~02:50 BRT): repo próprio + Pages + DNS www já operavam desde 11/10 (último push 00:46 14/10) — passos 1-3 do runbook já estavam executados; divergência de topologia documentada em `governance/audits/STATUS-SEPARACAO-ENGINECORE-2026-10-14.md`.
- Evidência de runtime: apex/www enginecore.app HTTP 200 + hash live = hash repo; redirects verificados pós-deploy.

*Emissor: Lúcio (CEO, runbook PUR v1.0) · Executor: Córtex (Control Plane) — 14/10/2026.*

## Registro 2026-10-12 — sem bump (entradas do dia; bump só na consolidação EOD)

### Adicionado (DIFF-EOD 12/10, Pacote Adapta)
- **MOMENTO ZERO incorporado ao Ritual de Abertura MasterCore** — todo novo chat do grupo lê a arquitetura canônica (modelos operacionais ADAPTA→CÓRTEX→BASE44→GITHUB, governança, versões, estado de changelog/ledger, memórias) no 1º turno, antes do Cartão de Abertura. Regra cristalizada em 12/10/2026 (NÃO REVERTER). Arquivo: skill #Ritual de Abertura MasterCore (editada).
- **Plano Disruptivo MasterCore 2026-10-12 consolidado** — 10 seções (visão geral, frentes estratégicas, Radar RFP, parceria Dr. Bayard ganha-ganha, Edge AI, VitaCore, iniciativas internas sem conflito, gates humanos, capital, meta US$ 1 bi). Fonte: doc Drive 10JN7J32iw01IDvzvxmRf697bweMpRXwq92aLYbIbAOA.
- **RadarCore operacional** — Radar de RFP/inovação aberta: planilha Radar-RFP-MasterCore.xlsx (5 abas: RADAR 16 oportunidades + coluna Custo de Inscrição, PLATAFORMAS, AUTOMACAO, FUNIL c/ calculadora de valor esperado, ROADMAP); dashboard hospedado; bit.ly/4jj3BZs. Funil: 10 revisadas/semana → 3 aprofundadas → 1-2 candidaturas.
- **Pacote de atração e follow-up do Dr. Bayard (DAIS/Disruptive AI) fechado** — Proposta de Atração (5 camadas, avaliação cega 90 dias, minuta NDA), Follow-up de Negociação (sprint remunerado 30 dias até R$ 12.000), Follow-up Final (ganha-ganha). Posicionamento: Conselheiro Científico do PeptiCore — NUNCA médico; parceria, não sociedade. Oportunidades revalidadas: ARIA Safeguarded AI, NineSigma ZITRI, caso Riopele (Edge AI industrial).
- **Comunicação ao Dr. Bayard chancelada pelo CEO e disparada via WhatsApp em 12/10** (texto final homologado c/ link RadarCore bit.ly/4jj3BZs). Desembolsos programados: 2x Jetson Orin Nano Super (US$ 249) fim do mês; sprint remunerado e NDA/contrato aguardando retorno formal do Dr. Bayard.

### Pendente (gates humanos — não liberados nesta etapa)
- Desembolso Jetson (US$ ~500): fim do mês, alçada do CEO + dupla checagem.
- NDA/contrato de sprint Bayard: aguardando retorno formal do Dr. Bayard + revisão LEGAL.
- Qualquer equity: vedado equity da holding; participação em venture exige decisão do CEO.

*Emissor: Adapta (DIFF-EOD 12/10) · Executor: Córtex (Control Plane) — 13/10/2026, registro sem bump por ordem do pacote.*

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
