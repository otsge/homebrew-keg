cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "db493c5c0f5550f6406d8bdd90e28aa99b0d23c9af8105fc99070955f4587752",
         intel: "35594093269f524ffead0a19a297569712ff305d2370fa55314714e2077bb7dd"

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
