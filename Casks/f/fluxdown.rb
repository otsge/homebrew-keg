cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.4"
  sha256 arm:   "6fa6018b422c953b5785328581dea781c227ecf5200458c164c132154bce98b4",
         intel: "d0bf6a885e984a3136529cf2d80d002d65762b02f28d8ced600aa0395fbf9449"

  url "https://github.com/zerx-lab/FluxDown/releases/download/v#{version}/FluxDown-#{version}-macos-#{arch}.dmg"
  name "FluxDown"
  desc "Download manager with HTTP, FTP, BitTorrent and HLS/DASH streaming support"
  homepage "https://fluxdown.zerx.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "FluxDown.app"

  postflight_steps do
    run "xattr",
        args: ["-cr", "{{appdir}}/FluxDown.app"]
  end

  # zap trash: [
  # ]
end
