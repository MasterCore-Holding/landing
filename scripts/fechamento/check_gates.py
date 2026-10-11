#!/usr/bin/env python3
"""check_gates.py — bloqueio mecânico dos 4 Gates de Controle.
Uso: check_gates.py <ciclo.json> [--blocos]
Saída padrão: 'nenhum' ou lista separada por vírgula dos gates acionados (exit 0 sempre — decisão é do chamador).
--blocos: lista 'B1:saude,B3:financeiro'."""
import json
import sys

def main():
    if len(sys.argv) < 2:
        print("uso: check_gates.py <ciclo.json> [--blocos]", file=sys.stderr)
        return 2
    with open(sys.argv[1], encoding="utf-8") as f:
        d = json.load(f)
    gates = []
    pares = []
    for b in d.get("blocos", []):
        g = b.get("gate_controle", "nenhum")
        if g not in (None, "nenhum"):
            if g not in gates:
                gates.append(g)
            pares.append(f"{b.get('id')}:{g}")
    if "--blocos" in sys.argv:
        print(",".join(pares))
    else:
        print(",".join(gates) if gates else "nenhum")
    return 0

if __name__ == "__main__":
    sys.exit(main())
