cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "581b837a5b9c890f9735c0f8ab8e94bc29dec974137258f125fd05cd2ca54189",
         intel: "054db3019196bdadbabff24685c55f0c571086901b7be4209a3c9dc0e95492a8"

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
