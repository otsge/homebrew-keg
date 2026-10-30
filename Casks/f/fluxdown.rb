cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.4"
  sha256 arm:   "2d85332feaa905dc46e07a8bc0dddc38194ad5f37af016a65cc63b976e44d2de",
         intel: "f935b6a9e289834cfeb59fbc08d667f1b5ba684551da6d68ce25633dddef904a"

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
