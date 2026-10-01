cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.5.1"
  sha256 arm:   "f0f9cb2efa2519e6d9b9b8385bcd91e3aa6790a3f47fed6e6a851fc1f4ed7271",
         intel: "e9d88c2e930a342fa3f091e44f8b63ad65fa4ffa25eda67d0c1f178da7b7795f"

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
