# Unreasonable Magic Homebrew tap

Install [Whinge](https://whinge.computer), a Mac app for recording spoken feedback and annotating the screen:

```sh
brew install --cask unreasonable-magic/tap/whinge
```

Requires Apple Silicon and macOS 26 (Tahoe) or later. Installs `Whinge.app` and the
`whinge` command-line tool. Xcode is not required.

Launch Whinge from Applications or run `whinge` in a project. macOS asks for Screen
Recording and Microphone permission when needed. Install the optional Claude Code
`/whinge` command through Whinge's Settings.

## Updates and removal

```sh
brew update
brew upgrade --cask whinge
brew uninstall --cask whinge
```

Uninstall removes the app and Homebrew's CLI link. Recordings, settings, and any
separately installed Claude Code command are retained.

If you already installed Whinge manually, quit it and move the existing
`/Applications/Whinge.app` aside before installing with Homebrew. Your recordings
and settings are stored separately. A previously installed `~/.local/bin/whinge`
link is not managed by Homebrew; check `which -a whinge` if an old link takes precedence.

## Maintaining the cask

The Whinge source repository's `bin/deploy-release` updates this tap after each
successful app release. `bin/update-homebrew` retries the update without rebuilding;
`bin/update-homebrew --dry-run` verifies the public release and prints the proposed
cask without publishing it. These commands require Node.js 22+ and `gh`
authenticated to GitHub with write access to this repository.

The cask pins an immutable DMG URL and SHA-256 and includes the release's architecture
restriction. Updates go to `main`; unchanged releases do not create extra commits.
The source repository tests the generator and publisher. Before changing the cask
manually, run `brew style unreasonable-magic/tap/whinge` and
`brew audit --cask --online unreasonable-magic/tap/whinge`.
