"""Zitatprüfung der Quellenblöcke: python ../../vorlage/zitate.py kapitel/04-arbeiten-mit-vms.tex

Lädt jede zitierte Seite, sucht jedes \\enquote des Eintrags im Rohtext und nennt
die Überschrift, unter der es steht. Meldet Kandidaten, die Entscheidung bleibt
beim Lesenden.
"""
import hashlib, html, os, re, sys, tempfile, urllib.request

BS = chr(92)
CACHE = os.path.join(tempfile.gettempdir(), 'bsh-zitate')


def laden(url):
    os.makedirs(CACHE, exist_ok=True)
    pfad = os.path.join(CACHE, hashlib.sha1(url.encode()).hexdigest())
    if not os.path.exists(pfad):
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=60) as r, open(pfad, 'wb') as f:
            f.write(r.read())
    with open(pfad, 'rb') as f:
        return f.read()


def flach(s):
    # Tags trennen Satzzeichen ab, Leerraum zählt deshalb nicht
    s = html.unescape(s)
    s = s.translate(str.maketrans({'’': "'", '‘': "'", '“': '"', '”': '"', ' ': ' '}))
    return re.sub(r'\s+', '', s)


def seite(raw):
    """Text ohne Tags, dazu je Zeichen die Überschriftenkette."""
    text, kette, stand, titel_alle = [], [], {}, set()
    for m in re.finditer(r'<h([1-6])[^>]*>(.*?)</h\1>|<[^>]+>|[^<]+', raw, re.S):
        if m.group(1):
            titel = re.sub(r'\s+', ' ', html.unescape(re.sub(r'<[^>]+>', '', m.group(2)))).strip()
            lvl = int(m.group(1))
            stand = {k: v for k, v in stand.items() if k < lvl}
            stand[lvl] = titel
            titel_alle.add(flach(re.sub(r'^[\d.]+\s', '', titel)))
            stueck = titel
        elif m.group(0).startswith('<'):
            continue
        else:
            stueck = m.group(0)
        f = flach(stueck)
        text.append(f)
        kette.extend([' > '.join(stand[k] for k in sorted(stand))] * len(f))
    return ''.join(text), kette, titel_alle


def latex(s):
    for a, b in [(BS + 'textbackslash', BS), (BS + '_', '_'), (BS + '&', '&'), (BS + '%', '%'),
                 (BS + '$', '$'), (BS + '#', '#'), (BS + ',', ' '), ('~', ' ')]:
        s = s.replace(a, b)
    return re.sub(re.escape(BS) + r'(?:cmd|texttt|emph)\{([^{}]*)\}', r'\1', s)


def zitate(zeile):
    out, i = [], 0
    marke = BS + 'enquote{'
    while (i := zeile.find(marke, i)) >= 0:
        j, tiefe = i + len(marke), 1
        while tiefe:
            tiefe += {'{': 1, '}': -1}.get(zeile[j], 0)
            j += 1
        out.append(latex(zeile[i + len(marke):j - 1]))
        i = j
    return out


sys.stdout.reconfigure(encoding='utf-8')
fehler = 0
for datei in sys.argv[1:]:
    block = False
    for nr, zeile in enumerate(open(datei, encoding='utf-8'), 1):
        if BS + 'paragraph{Quellen}' in zeile:
            block = True
        if BS + 'kiquelle' in zeile:
            block = False
        url = re.search(re.escape(BS) + r'url\{([^}]*)\}', zeile)
        if not block or not url:
            continue
        url = url.group(1)
        print(f'{datei}:{nr}: {url}')
        if url.lower().endswith('.pdf'):
            print('  PDF, von Hand prüfen')
            continue
        try:
            raw = laden(url)
        except Exception as e:
            # manche Server sperren Skripte, nicht den Browser
            print(f'  NICHT GELADEN ({e}), von Hand prüfen')
            continue
        if raw[:4] == b'%PDF':
            print('  PDF, von Hand prüfen')
            continue
        text, kette, titel_alle = seite(raw.decode('utf-8', errors='replace'))
        for z in zitate(zeile):
            k = text.find(flach(z))
            if k < 0:
                print(f'  FEHLT  {z}')
                fehler += 1
            elif flach(z) in titel_alle:
                print(f'  titel  {z[:70]}')
            else:
                print(f'  ok     {z[:70]}  [{kette[k] if k < len(kette) else ""}]')
sys.exit(1 if fehler else 0)
