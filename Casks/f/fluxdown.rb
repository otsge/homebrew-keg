cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.4"
  sha256 arm:   "127c0ebe31d95ad5cc009ca217c1a16dc309da741c559fbdcb8d8fc06f79daff",
         intel: "d1bb55b78410ecd135300d7b2bb30ff0444e59276f714ccec79916b8dc39c654"

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
