cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.3"
  sha256 arm:   "086079f4bccfb29ace48e7d1668d84c31743f88e7cc99f6058a6f60abe465caa",
         intel: "63df44955d979144368fb9d30557079cb2e4445b3bde467243101fec9310f547"

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
