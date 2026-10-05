# CHANGELOG — MasterCore-Holding

Fonte Única de Verdade da holding. Toda decisão operacional e homologação estrutural constará aqui antes de sua ativação efetiva.

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
