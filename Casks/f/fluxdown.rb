cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "1ad0ec18583be3a195f804b366ac69672d9f654239f88e8fcd1d247743fe553a",
         intel: "941377715fccc46a51a2e651017cf3e7894c17288bc3db811c627cc3235d00e9"

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
