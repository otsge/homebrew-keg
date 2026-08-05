cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "e0dc91655b1507de5aeb57f46fedafa133f86d1854707c0a9b323d181d9cdad9",
         intel: "0421d474da3a145205d02e4d0740e84de5c3594fce2903ddc33e7a73b7fd0172"

  url "https://github.com/zerx-lab/FluxDown/releases/download/v#{version}/FluxDown-#{version}-macos-#{arch}.dmg",
      verified: "github.com/zerx-lab/FluxDown/"
  name "FluxDown"
  desc "Download manager with HTTP, FTP, BitTorrent and HLS/DASH streaming support"
  homepage "https://fluxdown.zerx.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :catalina

  app "FluxDown.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/FluxDown.app"]
  end

  # zap trash: [
  # ]
end
