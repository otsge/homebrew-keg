cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.1.59"
  sha256 arm:   "f0e3a03c8adcdf69a282a4bc676def2ae0a553a23c9f3d62d323cdb7ddc32952",
         intel: "2425fc8c43918d8e61696e66fb641505555194ee08313baf80da7f2676473889"

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
