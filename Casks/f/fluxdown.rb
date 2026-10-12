cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.6"
  sha256 arm:   "00602bc75af6449e7c5a1ba20da0e92cb0f57d5cecdf9a58603ac38e085198d2",
         intel: "b2c0c220d662f45e69ac279dcbef824e82e103dc45a3ee89e142d37cc062883c"

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
