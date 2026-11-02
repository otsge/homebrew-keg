cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.6"
  sha256 arm:   "a631f4a9a93133a15e183a5131dbb6a40401287f6bd33b431492a35b94b13e57",
         intel: "2b6b188cd27e6e6965ab51eb970d1f5ab06f308b43c177a1c6bfa03c52c8ee40"

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
