cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "df566f52d439e3d981c210e4a99713072e3b558990e36a2ed9d05758861a7712",
         intel: "301aef8b2c9d654ae7fb3be2f0c2717c259dd905074b125dfaeb4d5633e87886"

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
