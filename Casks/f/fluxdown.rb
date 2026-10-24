cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.3"
  sha256 arm:   "5421fa66e28d3e022500bc9a23cdad7eefab401e6e7db10cd0ff2c465ae97319",
         intel: "a1b1acc2c0a2d6caa3675a74998270daacf4c9b5ede9d1590fd3a569b5dc9dd2"

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
