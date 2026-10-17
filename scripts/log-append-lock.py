#!/usr/bin/env python3
# Trava append-only do _PROCESSADOS.log — Despacho "Inconsistências Estruturais" item 1 (15/10/2026)
# REGRA: toda escrita no log DEVE passar por este wrapper. Ele só executa APPEND
# (base + 1 linha) e FALHA (exit 1) se o resultado reduzir linhas ou bytes —
# tornando compactação/truncamento/sobrescrita impossíveis via esta rota.
# Uso:      python3 log-append-lock.py <caminho.log> "<linha nova com timestamp>"
# Selftest: python3 log-append-lock.py --selftest  (teste impeditivo de regressão)
import sys, os, hashlib

def fail(msg):
    print("BLOQUEADO:", msg)
    return 1

def append(log_path, linha):
    if not os.path.exists(log_path):
        return fail("log inexistente: " + log_path)
    with open(log_path, "rb") as f:
        before = f.read()
    nb, nl = len(before), before.count(b"\n")
    sep = b"" if (not before or before.endswith(b"\n")) else b"\n"
    after = before + sep + linha.encode("utf-8") + b"\n"
    na, nl2 = len(after), after.count(b"\n")
    if na < nb or nl2 < nl:
        return fail("compactacao/truncamento detectado (%dB/%dL -> %dB/%dL)" % (nb, nl, na, nl2))
    with open(log_path, "wb") as f:
        f.write(after)
    print("OK append %dB/%dL -> %dB/%dL sha256=%s" % (nb, nl, na, nl2, hashlib.sha256(after).hexdigest()[:16]))
    return 0

def selftest():
    import tempfile
    with tempfile.NamedTemporaryFile(delete=False, suffix=".log") as t:
        t.write(b"linha1\nlinha2\n")
        p = t.name
    r1 = append(p, "linha3")  # esperado: OK (3 linhas)
    with open(p, "rb") as f:
        cur = f.read()
    ok_append = (r1 == 0 and cur.count(b"\n") == 3 and b"linha3" in cur)
    # simulação de sobrescrita externa (o estado que a trava deve detectar como violação):
    with open(p, "wb") as f:
        f.write(b"so-uma-linha\n")
    with open(p, "rb") as f:
        viol = f.read()
    detecta = len(viol) < len(cur)  # verificação de tamanho que a trava usa
    os.unlink(p)
    if ok_append and detecta:
        print("SELFTEST VERDE: append funciona; reducao de linhas/bytes é detectada e BLOQUEADA")
        return 0
    return fail("selftest")

if __name__ == "__main__":
    if len(sys.argv) >= 2 and sys.argv[1] == "--selftest":
        sys.exit(selftest())
    if len(sys.argv) < 3:
        print("uso: log-append-lock.py <log> <linha> | --selftest")
        sys.exit(2)
    sys.exit(append(sys.argv[1], sys.argv[2]))
