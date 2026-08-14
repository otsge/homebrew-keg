cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.6"
  sha256 arm:   "a2d627a247547145d9f23ffcd58eab49922e663a0fd8dd737c479a95c22a10c1",
         intel: "f82c2aeff8e2531397fb7b07c3d71379e0af4f431b2050574f6fdc378d01d1d7"

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
