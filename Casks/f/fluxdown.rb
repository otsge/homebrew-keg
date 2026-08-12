cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "72edb4b40c047e088c3f5cf46e3df5b8808d82bb1dab4e2c0849f8ed94d3f6a6",
         intel: "9971339ba97be6e08ffc795bbb9849e5c50726618bb1171f248cc87544c8661c"

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
