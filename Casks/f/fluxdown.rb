cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.5"
  sha256 arm:   "b3716ae82ba3637a9f47d1ae0876124f30ab71a584f53df97e95580c13a9a005",
         intel: "7c7d8fe271364b82223e84027dcea533bff6249fb38f3feaa5fd47301c9a0482"

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
