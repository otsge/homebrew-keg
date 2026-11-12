cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.7"
  sha256 arm:   "ead25d0526916e02b55670a06e118d64f1dad3c396d773e8082619c67870c65e",
         intel: "59ad272f2e8a3c28367c67f52193f29320a3c47c7a98943fde49b2f2d0d732d8"

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
