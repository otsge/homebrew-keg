cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.8"
  sha256 arm:   "b5dbcba13f3328217402cba41d9f9a8091194aa31b0bc2cdc9bda1c902958590",
         intel: "5a5f19486f45db2559429dea13afae8d9f29c2577b9d10c4d80383c17fc8a333"

  url "https://github.com/zerx-lab/FluxDown/releases/download/v#{version}/FluxDown-#{version}-macos-#{arch}.dmg"
  name "FluxDown"
  desc "Download manager with HTTP, FTP, BitTorrent and HLS/DASH streaming support"
  homepage "https://fluxdown.zerx.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "FluxDown.app"

  postflight_steps do
    run "xattr",
        args: ["-cr", "{{appdir}}/FluxDown.app"]
  end

  # zap trash: [
  # ]
end
