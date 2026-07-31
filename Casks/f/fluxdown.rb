cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "5b3d176915ad4017c17afaf2311238698e5d36c2ba5635ebcc0a7cd4736e3129",
         intel: "5d76e02458cdc0279ee33c69e51d859c51ba4b02864d1a97ef763a2ac509b04e"

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
