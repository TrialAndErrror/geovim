# Geovim

Geovim is an installer for NeoVim that can be used both locally and on GitPod servers. The goal is to
allow for a custom configuration for NeoVim that is portable and easily installable in a consistent manner.

Currently we are using NVim with AstroVim configs as a baseline and setting up features on top of this
base configuration.

## Install Steps

If you're on a Linux or Mac machine, you should be able to run bash linux.sh or bash mac.sh accordingly.

If those don't work, or you're on a server that doesn't handle AppImages well, you can use the following commands:
bash download.sh
bash install.sh

You might need python3.10-venv installed in your machine to make it work.

## TODO

- Setup Install Script
- Add Instant.nvim and configure
- Add local path completion
- Test autocomplete for:
  - Typescript
  - Rust
  - Python
- Setup final solution for LSP configuration
