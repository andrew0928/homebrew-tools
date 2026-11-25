# Andrew's Homebrew tap

## FIT Fusion for Apple Silicon Macs

Install the cycling activity tools with Homebrew.

```sh
brew install andrew0928/tap/fit-fusion
```

| Command | Purpose |
| --- | --- |
| `fit-merge` | Merge selected streams from a second FIT into a primary FIT. |
| `fit-inspector` | Inspect FIT fields and measure sample coverage. |
| `fit-query-files` | List, read and export activities from local FIT files. |
| `fit-query-apple` | Query a local Apple Health export ZIP and convert cycling workouts to FIT. |
| `fit-query-garmin` | Query Garmin Connect and export original FIT files. |

Each command offers `--help`, `--version` and `--skill index`. To update the package:

```sh
brew update && brew upgrade fit-fusion
```

Tagged binary archives and SHA-256 checksums are available in [Releases](https://github.com/andrew0928/homebrew-tap/releases).
