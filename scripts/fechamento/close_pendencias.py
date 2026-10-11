#!/usr/bin/env python3
"""close_pendencias.py — fecha pendências (artifacts_pending) do ledger confirmadas como concluídas.
Uso: close_pendencias.py <ciclo.json> <ledger.json> <new_version> <now_iso>
Remove do TOPO do ledger os itens cujo path casa com fecha_pendencia de blocos concluídos
(histórico preservado em ledger.pendencias_fechadas[] — nunca apagar histórico). Imprime 'path1,path2'."""
import json
import sys

def norm(p):
    return p.strip().rstrip("/")

def main():
    if len(sys.argv) != 5:
        print("uso: close_pendencias.py <ciclo.json> <ledger.json> <new_version> <now_iso>", file=sys.stderr)
        return 2
    ciclo_path, ledger_path, new_version, now_iso = sys.argv[1:5]
    with open(ciclo_path, encoding="utf-8") as f:
        ciclo = json.load(f)
    with open(ledger_path, encoding="utf-8") as f:
        ledger = json.load(f)
    alvos = [(b["fecha_pendencia"].strip(), b.get("id", "?")) for b in ciclo.get("blocos", [])
             if b.get("status") == "concluido" and b.get("fecha_pendencia", "").strip()]
    if not alvos:
        print("")
        return 0
    top = ledger["entries"][0]
    restantes = []
    fechadas = []
    for item in top.get("artifacts_pending", []):
        path = item.get("path", "")
        hit = next(((a, bid) for a, bid in alvos if norm(a) in path or path.startswith(norm(a))), None)
        if hit:
            fechadas.append({**item, "fechada_em": now_iso, "versao_fechamento": new_version, "bloco": hit[1]})
        else:
            restantes.append(item)
    if not fechadas:
        print("")
        return 0
    top["artifacts_pending"] = restantes
    ledger.setdefault("pendencias_fechadas", []).extend(fechadas)
    with open(ledger_path, "w", encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)
        f.write("\n")
    print(",".join(i["path"] for i in fechadas))
    return 0

if __name__ == "__main__":
    sys.exit(main())
