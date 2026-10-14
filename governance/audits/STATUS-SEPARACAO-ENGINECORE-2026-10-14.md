# STATUS — RUNBOOK PUR v1.0: Separação de Ambientes EngineCore (14/10/2026)

**Emissor:** Lúcio (CEO) — runbook autocontido PUR v1.0 (chancela 14/10, chat web Córtex)
**Executor:** Córtex (Control Plane) · Modo Assistido · Sem gate humano (baixo risco, reversível)
**Fonte:** Master Plan v2.2 §4 + Governança EngineCore

## 1. Divergência de topologia — runbook vs realidade (recon ao vivo ~02:45-03:05 BRT)

| Passo do runbook | Pressuposto | Realidade verificada ao vivo |
|---|---|---|
| 1. Criar repo `enginecoreapp/enginecore` | org enginecoreapp existe | **org 404**; PAT ativo = `pepticoreapp`, sem permissão de criar org nova |
| 2. Mover site do Pages da holding | repo `mastercore-holding/mastercore-holding.github.io` | **repo 404**; holding real = `MasterCore-Holding/landing` (CNAME mastercore.app) |
| 3. Ativar Pages no repo novo | Pages inexistente | **JÁ ATIVO** em `MasterCore-Holding/enginecore` (cname enginecore.app, cert aprovado até 2027-01-04, build legacy main /) |
| 4. DNS Cloudflare www→holding | www aponta p/ holding | www.enginecore.app CNAME → `mastercore-holding.github.io` (host da holding) — **funciona** (301 → site próprio); troca p/ `enginecoreapp.github.io` impossível (org não existe); troca p/ host próprio = `MasterCore-Holding/enginecore.github.io` não é URL de Pages válida — **ver Nota DNS** |
| 5. Remover vínculo com holding | pasta legada + host-matcher + go/ link | **EXECUTADO nesta rodada** (ver §2) |
| 6. Evidência + ledger | — | **EXECUTADO** (§3) |

**Conclusão do recon:** passos 1-3 já haviam sido executados por outra esteira (repo próprio criado ≤11/10, último push 00:46 14/10 — fix passo 10 da Discovery). O runbook descrevia o estado antigo. Execução real = passos 5-6.

## 2. Executado nesta rodada (14/10, commit único na `main` da holding)

1. `index.html` (portal): link "Conhecer venture" → `https://enginecore.app/?utm_source=mastercore&utm_medium=landing&utm_campaign=conhecer_venture` (antes: cópia legada).
2. `index.html` (host-matcher `head`): visitas com hostname EngineCore caídas na holding → `https://enginecore.app/` + query preservada (antes: `/enginecore/`).
3. `go/enginecore/index.html`: redirect → `https://enginecore.app/qualificacao/` com passa-through de UTMs (antes: legado).
4. Pasta legada `enginecore/` → 3 stubs de redirect 1:1 (index, lander, qualificacao) preservando query string; 5 assets binários legados removidos. Links de posts antigos (mastercore.app/enginecore/...) continuam funcionando.
5. `CHANGELOG.md`: registro 2026-10-14 sem bump (bump só na consolidação EOD — regra §5.2).
6. `ledger/system-ledger.json`: entrada RUNBOOK no topo (entries 11→12), currentVersion inalterado (reparo de sync não bumpa).

## 3. Evidência de runtime (Proposto ≠ Aplicado) — preenchida pós-deploy

- [ ] `https://enginecore.app` → HTTP 200, hash live = hash repo (base de comparação: sha256 index.html repo próprio `924de2f4...` pré-deploy)
- [ ] `https://www.enginecore.app` → HTTP 200/301 → site próprio
- [ ] `https://mastercore.app/enginecore/` → stub redirect → enginecore.app
- [ ] `https://mastercore.app/go/enginecore/` → redirect → enginecore.app/qualificacao/
- [ ] Portal mastercore.app: link Conhecer venture → enginecore.app

## 4. Pendências fora do escopo do Córtex (ação do CEO)

- **PQ-013** — `enginecore.com.br` DNS + www (GoDaddy): registro/zone apontando para o Pages próprio. Permanece ABERTA na P-QUEUE.
- **Nota DNS (opcional, passo 4 do runbook):** para desacoplar o www do host da holding, criar repo `MasterCore-Holding/enginecore.github.io` (Pages de org/user serve por esse nome) ou manter CNAME → `mastercore-holding.github.io` (funciona hoje; o certificado cobre enginecore.app pelo Pages do repo próprio). Decisão de infra é do CEO; camada de conteúdo já está separada.

## 5. Reversibilidade

- Reverter = 1 commit revert na main da holding (stubs/links voltam ao estado caf7558). Site próprio nunca foi tocado (0 writes no repo enginecore nesta rodada).
