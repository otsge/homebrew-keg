cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.5"
  sha256 arm:   "a62176c0851390e641bfaf47d2eacad9211c066067fe5d51f1324bb972d34e09",
         intel: "13c0908fb04ec698017c2ad2fbc9389291eeaec91154110b31f468746bb33db2"

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
