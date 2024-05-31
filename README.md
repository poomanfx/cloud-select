# Activate Clouds profiles

Bash alias for quick select and switch cloud profiles.

## Prerequisites

- [fzf](https://github.com/junegunn/fzf)
- [aws-cli-v2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [google-cloud-cli](https://cloud.google.com/sdk/docs/install)

---
## Setup

Add to `~/.bashrc`

```sh
source cloud-select.sh
alias cs="cloud_select"
```

---
## Usage

```sh
cs
```
---