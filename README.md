# twaldin/tap

Homebrew tap for [easl](https://easl.sh), the board your agents build on: a native mac app for coding agents (macOS 14 or later, Apple silicon).

```sh
brew install --cask twaldin/tap/easl
brew install neurosnap/tap/zmx oven-sh/bun/bun   # terminal tiles and the easl CLI
```

Installing by the full name trusts only this cask, so no `brew trust` step is needed. Update with `brew upgrade --cask easl`.

`Casks/easl.rb` is written by easl's release workflow ([twaldin/easl](https://github.com/twaldin/easl), `scripts/homebrew-cask.sh`) each time a signed, notarized release is published. Don't edit it by hand: the next release overwrites it.
