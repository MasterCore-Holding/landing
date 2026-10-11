# STATUS — DESPACHO INCIDENTE DE COMPLIANCE (PROTEÇÃO DO PERFIL PESSOAL DO CEO)

**ID**: MC-KILLSWITCH-PUB-001 · **Data**: 11/10/2026 · **Executor**: Córtex · **Origem**: DESPACHO CEO via Adapta (prioridade CRÍTICA)

## Resumo executivo
Kill-switch ATIVO, perfil pessoal do CEO LIMPO (3/3 deletes 204), token pessoal EM QUARENTENA, credenciais corporativas confirmadas (@pepticore.app IG), política de publicação v1.0 com campo PERFIL-ALVO (URL) implantada. Pendências: revogação OAuth pelo Lucio + página LinkedIn via novo app.

## Ação 1 — Remover posts remanescentes nos perfis pessoais do CEO
- Varredura de listagem: finders de API (q=author) bloqueados pelo app OAuth (404/403 partner permission) — teste correto aplicado = DELETE idempotente nos 3 URNs conhecidos do perfil pessoal:
  - urn:li:share:7514814372842553344 (BL-040, 10/10) → **204**
  - urn:li:share:7514819270393102336 (triagem, 10/10) → **204**
  - urn:li:share:7513708364913299457 (teste E2E, 07/10) → **204**
- Resultado: perfil pessoal linkedin.com/in/luciobicalho SEM posts de marca conhecidos. Deletes de 10/10 confirmados idempotentes (nada ressuscitou).
- Limitação declarada: API não permite LISTAR posts do autor (permissão de leitura de terceiros) — verificação completa de itens desconhecidos depende do Lucio (olhada visual) ou app com r_member_social.

## Ação 2 — Credenciais reconfiguradas para contas corporativas
- **Instagram**: conector vivo = @pepticore.app (IG ID 28448311678151480, BUSINESS) — corporativa ✓. Nada a trocar.
- **Facebook**: sem conta conectada neste contexto (nada publicável daqui) ✓.
- **LinkedIn**: token pessoal (w_member_social) movido para `scripts/linkedin-token.env.QUARANTINE-PERFIL-PESSOAL` — caminho canônico de publicação não resolve mais o token; publicação no perfil pessoal estruturalmente impossível pelo Córtex.
- **Página LinkedIn PeptiCore**: ID 146621460 confirmado no cofre; API de página 403 (app OAuth "PeptiCore OS" sem r_organization_social) → publicação de página segue MANUAL pelo Lucio até novo app OAuth com esse produto. Pendência registrada.
- **X/TikTok/YouTube**: sem conector de publicação ativo neste ambiente (sempre foram manuais) ✓.

## Ação 3 — Deslogar/revogar acesso a perfis pessoais do CEO
- **Feito pelo Córtex**: token pessoal em quarentena (impossibilita emissão); regra permanente no SOUL e na política v1.0.
- **Pendente do Lucio (única rota — OAuth concede o acesso, só ele revoga)**: LinkedIn → Configurações e privacidade → Aplicativos e serviços → "PeptiCore OS" (client 78h4ms9bqsgisb) → Remover acesso. Revogação mata o token no lado da plataforma (defesa em profundidade além da quarentena).
- Alternativa (se quiser manter app p/ página depois): revogar agora e, na hora do novo app de página, autorizar somente com destino corporativo.

## Ação 4 — Campo PERFIL-ALVO (URL) implementado
- Política de Publicação Corporativa v1.0 (art. 4): campo obrigatório `PERFIL-ALVO (URL):` em TODO pacote; pacote sem o campo = NÃO publica (bloqueio estrutural).
- Valores canônicos: LinkedIn PeptiCore = https://www.linkedin.com/company/pepticore-app/ (ID 146621460) · IG PeptiCore = https://www.instagram.com/pepticore.app/ (ID 28448311678151480).
- Gate de chancela (art. 3): CEO aprova conteúdo EXATO + URL EXATA; silêncio = NÃO executar. Chancela de pack não substitui chancela de instância.
- Verificação pré-disparo (art. 4.4): live check da URL corporativa antes de qualquer publicação.

## Kill-switch
- MC-KILLSWITCH-PUB-001 ATIVO: SUSPENSA toda publicação em redes (LI/IG/FB/X/TT/YT) por qualquer executor até reconfiguração completa + despacho expresso de reativação do CEO. Monitores passivos (radar leads, sync CRM, métricas) não afetados.

## Pendências (P-QUEUE)
- Revogação OAuth do app "PeptiCore OS" no perfil pessoal do Lucio (só ele pode — 2 min).
- Novo app OAuth LinkedIn com produto de página (r_organization_social) para publicar na página PeptiCore — decisão do Lucio (página segue manual até lá).
- Olhada visual do Lucio no perfil pessoal para confirmar zero itens desconhecidos.

## Evidências técnicas
- Ferramenta: API LinkedIn direta (Bearer, X-Restli-Protocol-Version 2.0.0) + MCP toolkit para deletes.
- Logs MCP dos deletes: log_6Eb-PG6Di4Z5 / log_Hjpeoh845HDz / log_CJFT1EIfR8-G (todos 204).
- Arquivos: kill-switch.md + politica-publicacao-v1.md + este STATUS (governance/audits/).
