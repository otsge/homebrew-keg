cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "2dc4b41b0f775c14115c002f60976931ae022866d387ef959eb48767068cd7a8",
         intel: "f2d8595b21254a02e23ac2e6b5b8e2fa9fe9f3b976adc95a0c76b6c1c2f322a0"

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
