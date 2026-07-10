cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.1.58"
  sha256 arm:   "72bffc6d587a916aa9213eefacbb766748f814789cee9e13e15bff73655bea8e",
         intel: "8a5e2a7fc80bde6b33277e1264f5599b5dcce8ec55e4cf9543d17cc6ec2c6829"

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
