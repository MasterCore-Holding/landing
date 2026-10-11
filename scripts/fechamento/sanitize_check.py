#!/usr/bin/env python3
"""sanitize_check.py — varredura de conteúdo sensível no _RETORNO (Art. 11 LGPD + segredos).
Exit 0 = limpo. Exit 1 + motivo = bloqueio. Heurísticas conservadoras (falso-positivo bloqueia — seguro)."""
import re
import sys

PATTERNS = [
    (r"ghp_[A-Za-z0-9]{20,}|gho_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}", "token GitHub"),
    (r"sk-[A-Za-z0-9]{20,}", "chave API (sk-)"),
    (r"AKIA[0-9A-Z]{16}", "chave AWS"),
    (r"whsec_[A-Za-z0-9_\-]{10,}", "segredo de webhook"),
    (r"Bearer\s+[A-Za-z0-9\-._~+/]{20,}", "cabeçalho Bearer"),
    (r"(?i)(api[_-]?key|token|senha|password|secret)\s*[=:]\s*[\"']?[A-Za-z0-9\-._~+/]{12,}", "atribuição de credencial"),
    (r"\b\d{3}\.\d{3}\.\d{3}-\d{2}\b", "CPF (possível PII)"),
    (r"\b\d{5}\.\d{4}\b", "CPF (possível PII)"),
]

def main():
    if len(sys.argv) != 2:
        print("uso: sanitize_check.py <arquivo>", file=sys.stderr)
        return 2
    with open(sys.argv[1], encoding="utf-8") as f:
        text = f.read()
    hits = []
    for pat, label in PATTERNS:
        for m in re.finditer(pat, text):
            frag = m.group(0)[:24]
            hits.append(f"{label}: …{frag}…")
    if hits:
        print("CONTEÚDO SENSÍVEL DETECTADO (sanitizar antes de gravar — Art. 11 LGPD):")
        for h in hits:
            print(f"  - {h}")
        return 1
    print("Sanitização OK — nenhum padrão sensível encontrado.")
    return 0

if __name__ == "__main__":
    sys.exit(main())
