cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.7"
  sha256 arm:   "d32feb2b9f548ae3e6c49b78bbb42b640219c59a01aead47b74e706f6c7b71cd",
         intel: "6a02a628ec7d561502d7ab4ba1f6d85ac3e3f3f2124783e0af395fb282785d49"

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
