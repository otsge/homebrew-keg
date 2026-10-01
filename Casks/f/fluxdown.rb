cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.2"
  sha256 arm:   "6d8f10c096ad266cb2c6d363698bc00a69cd935205d8e83283f44cb2feb61ad9",
         intel: "864803b80b63b8d7fa4919250a23a5d6f4ea3698ae5c989744da2261e64e452f"

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
