cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.8"
  sha256 arm:   "c008589b76f77a16f3d95886675c2afcd3e3c9700fa700ce8b03c34d8ae01eb3",
         intel: "b90cf26a2406ab681f022d48742eaa70fe2a82d5223f881e85af203496dbf38e"

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
