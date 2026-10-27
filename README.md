# lukefaccin/homebrew-tap

```bash
brew tap lukefaccin/tap
brew trust --tap lukefaccin/tap
```

Homebrew 7.0.11 and later ignore formulae from taps you haven't trusted, and `brew install` reports "No available formula or cask". Trust is stored in `~/.homebrew/trust.json`, so it's needed once per Mac.

| Formula | What it is |
| --- | --- |
| `blink-reminder` | Menu bar app that reminds you to look 20 meters away |

## blink-reminder

```bash
brew install lukefaccin/tap/blink-reminder
brew services start blink-reminder   # run now and at every login
```

It builds from source with `swiftc`, so the Xcode Command Line Tools must be installed.

## Releasing a new version

1. Tag the app repo: `git tag vX.Y.Z && git push --tags`
2. In `Formula/blink-reminder.rb`, update `tag:` and set `revision:` to the output of `git rev-parse vX.Y.Z`
3. Commit and push this tap, then run `brew upgrade blink-reminder`

## License

[Apache License 2.0](LICENSE)
