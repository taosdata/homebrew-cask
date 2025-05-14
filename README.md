# homebrew-cask
Homebrew Cask for installing TDengine on macOS.

## Supported Platforms
- Intel (x86_64)
- Apple Silicon (arm64)

## Installation
The tap can be added to Homebrew using the following command:
```bash
brew tap taosdata/cask
brew install --cask taosdata/cask/tdengine
```

## Maintenance Guide
Modify version and sha256 in Casks/tdengine.rb:

```ruby
version "3.3.6.3"
sha256 intel: "58a52b25cb5436c330f0f26509b155109cc77b3a77c511ce45ca5b8e381474cf",  # Intel
         arm:   "8f8496708cc24aa680a12b188162fea7a11e992c3d13a698f0bb0f6fd1673812"  # ARM
```

Get the SHA256 checksum of the new release:

```bash
shasum -a 256 /path/to/TDengine-server-*.pkg
```

## Local Testing
```bash
# Test installation
brew install --cask ./Casks/tdengine.rb

# Test uninstallation
brew uninstall --cask ./Casks/tdengine.rb
```