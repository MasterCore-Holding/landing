# POLÍTICA DE PUBLICAÇÃO CORPORATIVA v1.0 — GRUPO MASTERCORE

**Data**: 11/10/2026 · **Origem**: DESPACHO CEO (Incidente de Compliance) · **Aplicação**: todas as empresas do grupo (PeptiCore, EngineCore, MasterCore, futuras) · **Executor**: Córtex
**Vigência**: permanente (regra obrigatória, não reverter). Em conflito com pack de copy anterior, VENCE esta política.

## Art. 1 — Perfis pessoais do CEO (intocáveis)
1.1. É PROIBIDO publicar qualquer conteúdo de empresa (PeptiCore, EngineCore, MasterCore, futuras) em qualquer perfil pessoal/profissional do CEO Lucio — LinkedIn, IG, FB, X, TT, YT ou qualquer rede futura.
1.2. Perfis pessoais do CEO = território dele, intransferível. Nenhuma automação, runbook, roteiro ou executor tem autorização — nem "porque a página não está pronta", nem por conveniência de alcance.
1.3. Post no perfil pessoal do CEO só com pedido EXPLÍCITO dele, no turno, post a post. Pedido de turno anterior não vale.

## Art. 2 — Publicação de marca = só perfil corporativo
2.1. Toda publicação de marca acontece EXCLUSIVAMENTe no perfil corporativo da empresa: LinkedIn PeptiCore = PÁGINA DE EMPRESA (nunca perfil pessoal); Instagram = @pepticore.app; demais redes = contas corporativas dedicadas.
2.2. Conta corporativa ainda inexistente (ex.: IG EngineCore, página LinkedIn EngineCore) = rede fica fora da automação até o ativo ser criado. Nada compensa com perfil pessoal.

## Art. 3 — Gate de chancela (silêncio = NÃO executar)
3.1. Antes de publicar, o CEO aprova: (a) conteúdo EXATO (texto final, mídia final) e (b) URL EXATA do perfil-alvo corporativo.
3.2. Chancela por item. Aprovação de pack/template não substitui chancela da instância publicada.
3.3. Sem resposta = NÃO publicar. Nunca interpretar silêncio como GO.

## Art. 4 — Campo obrigatório PERFIL-ALVO (URL)
4.1. Todo pacote de publicação DEVE carregar, em destaque, o campo `PERFIL-ALVO (URL):` com a URL corporativa exata do destino.
4.2. Pacote sem o campo = NÃO publica (bloqueio estrutural, não subjetivo).
4.3. Valores canônicos atuais: LinkedIn PeptiCore = https://www.linkedin.com/company/pepticore-app/ (ID 146621460) · Instagram PeptiCore = https://www.instagram.com/pepticore.app/ (IG ID 28448311678151480).
4.4. O executor verifica a conta-alvo ANTES de disparar (live check da URL corporativa; se a URL não resolver para a conta corporativa, BLOQUEIA e escala).

## Art. 5 — Credenciais e executor
5.1. Credenciais de publicação apontam SÓ a contas corporativas. Token de perfil pessoal em quarentena (linkedin-token.env.QUARANTINE-PERFIL-PESSOAL) — inutilizável por runbook.
5.2. Executor com acesso a perfil pessoal do CEO = revogar/impedir. Acesso de app OAuth concedido a perfil pessoal segue pendência de revogação pelo Lucio (Configurações e privacidade → Aplicativos e serviços → "PeptiCore OS" → Remover acesso).
5.3. LinkedIn: publicação via API segue removida da automação (ordem do Lucio); página de empresa = manual pelo Lucio até novo app OAuth com r_organization_social.

## Art. 6 — Auditoria
6.1. Live check de auditoria de peças no ar = item permanente do ciclo de verificação (peça publicada em rede que viole política = alerta imediato ao CEO + remoção).
6.2. Violação = incidente de compliance grave; vira restrição técnica (não recorrência).
