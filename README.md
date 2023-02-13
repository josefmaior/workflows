# Workflows

Here you can find programs/scripts and documentation of automated business processes (workflows/pipelines), important for the running of the department. Each workflow can belong to one or more business processes, see our (knowledge base)(https://github.com/czech-radio/organization/tree/main/docs/Software/Processes).


## Jobs status
### irozhlas-analyze
 ![irozhlas-scrape](https://cronitor.io/badges/tSiCVL/production/YGMJtPmnbrKvE7W0lgJmuhrwyoo.svg)
 ![irozhlas-analyze](https://cronitor.io/badges/OnC0Lc/production/8lS79WXuX67rBDGv3WTftFphZ-I.svg)

### process-openmedia-data
 ![process-openmedia-data](https://cronitor.io/badges/7KMpaS/production/HyCIJSHMSn8aRcjiUx-LWAhf2wI.svg)

### backup-respondent-db
 ![backup-respondent-db](https://cronitor.io/badges/oy5pxz/production/2ttm3rb3jG4mdDRyr5W40F5irLM.svg)


## Logs

For output of workflows see [logs](https://github.com/czech-radio/logs) repository.

## Creating workflow
 
- Each workflow is placed in an appropriately named directory (Use the imperative e.g. `do-this`).
- Each workflow is well documented in source and `README.md`.
- Each workflow contains an input script named `run` (Bash, Python, etc.).

<img src="./screen.png"/>

## Testing workflow

FIXME: The workflow testing strategy MUST be defined! 

## How do we run them on the server?

### Episodic (manual) execution

```bash
sh workflows/backup-respondent-db/run
```

### Periodic (automated) execution

We use [cron](https://crontab.guru/)! 

## How do we update the workflow on the server?

```bash
cd workflows && git pull && cd ..
```


