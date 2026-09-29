# Unreasonable Magic Homebrew tap

Install [Whinge](https://whinge.computer), a Mac app for recording spoken feedback and annotating the screen:

```sh
brew install --cask unreasonable-magic/tap/whinge
```

And [Offsider](https://offsider.website), small HTML apps beside your work:

```sh
brew install --cask unreasonable-magic/tap/offsider
```

If you installed Offsider with its install script, quit it and remove `~/Applications/Offsider.app`
and the `~/.local/bin/offsider` link first, so there's only one copy.

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

## With mise

`api/cask/<token>.json` holds each cask's metadata in the format formulae.brew.sh publishes, so mise
can install them directly, without Homebrew:

```toml
[bootstrap.brew.taps]
"unreasonable-magic/tap" = "https://github.com/unreasonable-magic/homebrew-tap.git"

[bootstrap.packages]
"brew-cask:unreasonable-magic/tap/whinge" = "latest"
"brew-cask:unreasonable-magic/tap/offsider" = "latest"
```

The JSON is generated: `.github/workflows/api.yml` runs `bin/generate-api` on every push that changes
a cask and commits the result, so release scripts only need to update `Casks/*.rb`. To run it
yourself, `brew ruby bin/generate-api` from this directory regenerates it from the installed tap.

## Maintaining the casks

The Whinge source repository's `bin/deploy-release` updates `Casks/whinge.rb` after each
successful app release. `bin/update-homebrew` retries the update without rebuilding;
`bin/update-homebrew --dry-run` verifies the public release and prints the proposed
cask without publishing it. These commands require Node.js 22+ and `gh`
authenticated to GitHub with write access to this repository.

The cask pins an immutable DMG URL and SHA-256 and includes the release's architecture
restriction. Updates go to `main`; unchanged releases do not create extra commits.
The source repository tests the generator and publisher.

`Casks/offsider.rb` is updated by hand after each Offsider release: bump `version` and `sha256`
to the new archive. Before changing a cask manually, run `brew style unreasonable-magic/tap/<cask>`
and `brew audit --cask --online unreasonable-magic/tap/<cask>`.
