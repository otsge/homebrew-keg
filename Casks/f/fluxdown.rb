cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "3db449f9e99c32adf7311431d78fb1b63f81ed9f48134110f52368cfdfe2d9d2",
         intel: "b018774882aa7843f58226860e03576656d7a6f15824a3690ee30e93cf1cb13c"

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
