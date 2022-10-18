# workflows

Zde se nachází programy/skripty a dokumentace **automatizovaných** business procesů (*workflows*/*pipelines*), důležitých pro chod oddělení. Každé worflow může náležet k jednomu či více business procesům viz naše [znalostní báze](https://github.com/czech-radio/organization/tree/main/docs/Software/Processes).

## Přidání workflow

- Každé workflow je umístěno ve vhodně pojmenaném adresáři (Použij imperativ např. `do-this`).
- Každé workflow je dokumentováno v `README.md`.
- Každé workfow obsahuje vstupní skript pojmenovaný `run` (Bash, Python atd.).

Jak to vypadá struktura projektu (Visual Studio Code)?

![screen](screen.png)

Jak je spustíme na serveru?

```bash
source workflows/backup-respondent-db/run
```

Jak updatujeme workflow na serveru?

```bash
cd workflows && git pull && cd ..
```

## Přehled worflows

- [analyze-irozhlas](https://github.com/czech-radio/workflows/tree/main/analyze-irozhlas)
- [backup-respondent-db](https://github.com/czech-radio/workflows/tree/main/backup-respondent-db)
- [process-openmedia-data](https://github.com/czech-radio/workflows/tree/main/process-openmedia-data)
