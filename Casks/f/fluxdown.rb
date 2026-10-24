cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "dea3f2c16af3b7fb16c5068fb2f129385a7d83c5cba1cdf7cf3845ecee1e15d0",
         intel: "34ffbaad02a0510c85d583f0dbcd4bdf23ff0a80046e0af0152d38efaafc93c7"

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
