cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.8"
  sha256 arm:   "4983d7acf50b4bc18964a5b86f4a865597fdee532661d5b30a50c46468d39506",
         intel: "d049bd36a23f37ecd8e94ec3512c81fbb76202fda2134e4c20cc5f988617cb82"

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
