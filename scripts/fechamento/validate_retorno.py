#!/usr/bin/env python3
"""validate_retorno.py — validação do _RETORNO/ciclo.json contra o schema canônico (Etapa 1 do runbook).
Espelha _RETORNO/schema.json em validação stdlib (sem dependência de jsonschema no runner).
Exit 0 = válido. Exit 1 = inválido (motivo listado)."""
import json
import sys
from datetime import datetime

STATUS = {"concluido", "falhou", "pendente"}
GATES = {"nenhum", "saude", "juridico", "financeiro", "societario"}
TIPOS = {"feature", "fix", "sync"}
TOP_REQ = ["versao_runbook", "data_execucao", "executor", "blocos", "resumo"]
BLOCO_REQ = ["id", "nome", "status", "evidencia", "gate_controle"]

def main():
    if len(sys.argv) != 2:
        print("uso: validate_retorno.py <ciclo.json>", file=sys.stderr)
        return 2
    errors = []
    try:
        with open(sys.argv[1], encoding="utf-8") as f:
            d = json.load(f)
    except Exception as e:
        print(f"JSON inválido: {e}")
        return 1
    for k in TOP_REQ:
        if k not in d:
            errors.append(f"campo obrigatório ausente: {k}")
    extra = set(d) - set(TOP_REQ)
    if extra:
        errors.append(f"campos não permitidos no topo: {sorted(extra)}")
    if "versao_runbook" in d and not (isinstance(d["versao_runbook"], str) and d["versao_runbook"]):
        errors.append("versao_runbook deve ser string não vazia")
    if "data_execucao" in d and isinstance(d["data_execucao"], str):
        try:
            datetime.fromisoformat(d["data_execucao"])
        except ValueError:
            errors.append("data_execucao fora do ISO-8601")
    if "executor" in d and not (isinstance(d["executor"], str) and d["executor"].strip()):
        errors.append("executor deve ser string não vazia")
    blocos = d.get("blocos")
    if isinstance(blocos, list) and blocos:
        for i, b in enumerate(blocos):
            if not isinstance(b, dict):
                errors.append(f"blocos[{i}] não é objeto")
                continue
            for k in BLOCO_REQ:
                if k not in b:
                    errors.append(f"blocos[{i}].{k} obrigatório ausente")
            for k in set(b) - set(BLOCO_REQ) - {"tipo", "fecha_pendencia"}:
                errors.append(f"blocos[{i}].{k} não permitido")
            if b.get("status") not in STATUS:
                errors.append(f"blocos[{i}].status inválido: {b.get('status')!r}")
            if b.get("gate_controle") not in GATES:
                errors.append(f"blocos[{i}].gate_controle inválido: {b.get('gate_controle')!r}")
            if b.get("tipo") is not None and b.get("tipo") not in TIPOS:
                errors.append(f"blocos[{i}].tipo inválido: {b.get('tipo')!r}")
            for k in ("nome", "evidencia"):
                if k in b and not (isinstance(b[k], str) and b[k].strip()):
                    errors.append(f"blocos[{i}].{k} deve ser string não vazia")
    elif blocos is not None:
        errors.append("blocos deve ser array com >= 1 item")
    res = d.get("resumo")
    if isinstance(res, dict):
        for k in ("concluidos", "falhas", "pendentes"):
            v = res.get(k)
            if not (isinstance(v, int) and not isinstance(v, bool) and v >= 0):
                errors.append(f"resumo.{k} deve ser inteiro >= 0")
        if not isinstance(res.get("gates_acionados"), list):
            errors.append("resumo.gates_acionados deve ser array")
        for k in set(res) - {"concluidos", "falhas", "pendentes", "gates_acionados", "custo_brl"}:
            errors.append(f"resumo.{k} não permitido")
        if isinstance(blocos, list) and blocos:
            calc = {
                "concluidos": sum(1 for b in blocos if b.get("status") == "concluido"),
                "falhas": sum(1 for b in blocos if b.get("status") == "falhou"),
                "pendentes": sum(1 for b in blocos if b.get("status") == "pendente"),
            }
            for k, v in calc.items():
                if res.get(k) != v:
                    errors.append(f"resumo.{k}={res.get(k)} diverge dos blocos ({v})")
            gates_calc = sorted({b["gate_controle"] for b in blocos if b.get("gate_controle") not in (None, "nenhum")})
            if sorted(res.get("gates_acionados", [])) != gates_calc:
                errors.append(f"resumo.gates_acionados={res.get('gates_acionados')} diverge dos blocos ({gates_calc})")
    elif res is not None:
        errors.append("resumo deve ser objeto")
    if errors:
        print("SCHEMA INVÁLIDO:")
        for e in errors:
            print(f"  - {e}")
        return 1
    print("Schema OK — _RETORNO válido.")
    return 0

if __name__ == "__main__":
    sys.exit(main())
