# KILL-SWITCH — SUSPENSÃO TOTAL DE PUBLICAÇÃO EM REDES SOCIAIS

**ID**: MC-KILLSWITCH-PUB-001 · **Data**: 11/10/2026 · **Origem**: DESPACHO CEO (Incidente de Compliance — Proteção do Perfil Pessoal) · **Executor**: Córtex
**Status**: ATIVO · **Reversão**: SOMENTE por despacho expresso do CEO Lucio (silêncio = permanece).

## Efeito imediato
- SUSPENSA toda publicação em: LinkedIn (pessoal e página), Instagram, Facebook, X, TikTok, YouTube — por qualquer executor (Córtex, Maestro, Base44, Adapta).
- Nada sai sem chancela humana explícita do CEO por item.
- Monitores passivos (leitura, métricas, radar de leads, sync CRM) NÃO são afetados.

## Gatilho
Post de marca PeptiCore vazou no LinkedIn profissional do CEO (2 dias no ar, colegas curtiram e entraram no beta; apagado manualmente pelo próprio). Reincidência registrada no perfil pessoal em 10/10 (2 posts, deletados via API 204/204). Incidente reforça a regra permanente de 11/10.

## Regra nova (obrigatória, não reverter) — incorporada à Política de Publicação v1.0
1. PROIBIDO publicar em qualquer perfil pessoal/profissional do CEO Lucio.
2. Publicação de marca → EXCLUSIVAMENTe no perfil corporativo da empresa (LinkedIn PeptiCore = página de empresa; IG = @pepticore.app).
3. Gate de chancela: antes de publicar, CEO aprova conteúdo EXATO + URL EXATA do perfil-alvo corporativo. Silêncio = NÃO executar.
4. Todo pacote de publicação carrega o campo obrigatório "PERFIL-ALVO (URL)". Sem ele, NÃO publica.
5. Verificar a conta-alvo ANTES de disparar (URL corporativa, nunca pessoal).

## Evidências de execução (11/10)
- Perfil pessoal LinkedIn (linkedin.com/in/luciobicalho): 3 URNs conhecidos submetidos a DELETE idempotente = 204/204/204 (posts de 10/10 já removidos + post de teste de 07/10). Perfil LIMPO.
- Token pessoal (w_member_social, scripts/linkedin-token.env) em QUARENTENA: renomeado para linkedin-token.env.QUARANTINE-PERFIL-PESSOAL — inutilizável por qualquer runbook (caminho canônico não resolve mais).
- Instagram conector = @pepticore.app (corporativa) — nenhuma ação necessária.
- Facebook: sem conta conectada neste contexto (nada publicável daqui).
- Página PeptiCore LinkedIn (ID 146621460): API de página 403 (app sem r_organization_social) — publicação de página segue MANUAL pelo Lucio até novo app OAuth.

## Próximo despacho de publicação = só com
(1) kill-switch revogado pelo CEO + (2) pack com PERFIL-ALVO (URL) preenchido + (3) chancela do conteúdo exato.
