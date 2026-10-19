cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.9"
  sha256 arm:   "458da33e9f3824f15c6015024a144e64b22eee583dff523081b85e4f97b4771e",
         intel: "fb403e2d628802670630e0a5a05274a8139e65c3b7720050f097e14ac748c3a5"

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
