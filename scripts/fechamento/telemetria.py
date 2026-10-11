#!/usr/bin/env python3
"""telemetria.py — registra os 4 contrapesos por fechamento (Padrão Opção A §6, Índice de Autonomia ≥ 90%).
Emite UMA linha JSONL (o chamador faz append em governance/telemetria/contrapesos.jsonl).
Regra P8: sem evidência auditável → 'sem dados auditáveis' (nunca zero artificial)."""
import datetime
import json
import sys

def main():
    if len(sys.argv) != 2:
        print("uso: telemetria.py <ciclo.json>", file=sys.stderr)
        return 2
    with open(sys.argv[1], encoding="utf-8") as f:
        d = json.load(f)
    blocos = d.get("blocos", [])
    total = len(blocos)
    res = d.get("resumo", {})
    falhas = res.get("falhas", 0)
    pendentes = res.get("pendentes", 0)
    custo = res.get("custo_brl")
    retrabalho = round(falhas * 100.0 / total, 1) if total else None
    registro = {
        "ts": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "runbook_versao": d.get("versao_runbook"),
        "executor": d.get("executor"),
        "execucao": {
            "total_blocos": total,
            "concluidos": res.get("concluidos", 0),
            "falhas": falhas,
            "pendentes": pendentes,
        },
        "contrapesos": {
            "1_qualidade_primeira_execucao": bool(total and falhas == 0 and pendentes == 0),
            "2_retrabalho_percentual": retrabalho if retrabalho is not None else "sem dados auditáveis",
            "3_incidentes": 0,
            "4_custo_brl": custo if custo is not None else "sem dados auditáveis",
        },
        "indice_autonomia": "sem dados auditáveis (agregação por período — passo 5 do plano de implementação)",
    }
    print(json.dumps(registro, ensure_ascii=False))
    return 0

if __name__ == "__main__":
    sys.exit(main())
