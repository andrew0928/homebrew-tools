# Andrew’s tools

Personal command-line tools and demos for Apple Silicon Macs.

## FIT Fusion

Install the current stable release and check the available commands.

```sh
brew install andrew0928/tools/fit-fusion
fit-inspector --help
```

| Command | Purpose |
| --- | --- |
| `fit-merge` | Merge selected streams from a second FIT into a primary FIT. |
| `fit-inspector` | Inspect FIT fields and measure sample coverage. |
| `fit-query-files` | List, read and export activities from local FIT files. |
| `fit-query-apple` | Query a local Apple Health export ZIP and convert cycling workouts to FIT. |
| `fit-query-garmin` | Query Garmin Connect and export original FIT files. |

To upgrade an existing installation, run

```sh
brew update
brew upgrade andrew0928/tools/fit-fusion
```

### Install a specific version

Each stable release has a versioned formula in the [formula directory](Formula). Versioned installations are keg-only. Invoke their commands by path to use a particular version alongside the current one.

```sh
brew install andrew0928/tools/fit-fusion@0.2.1
"$(brew --prefix andrew0928/tools/fit-fusion@0.2.1)/bin/fit-query-garmin" --help
```

Earlier releases install the tools available at the time. Version 0.1.0 provides the inspector, 0.2.0 adds merge and file queries, 0.2.1 adds Garmin queries, and 0.2.2 adds Apple Health queries.

### Where releases come from

FIT Fusion publishes its Apple Silicon archives and SHA-256 checksums on its [GitHub Releases page](https://github.com/andrew0928/fit-fusion/releases). Publishing a stable `vMAJOR.MINOR.PATCH` release with its assets triggers a workflow in that repository. It verifies the archives and updates this tap’s versioned formulas and current stable formula. Homebrew reads those formulas during `brew update` and verifies the selected download during installation.
