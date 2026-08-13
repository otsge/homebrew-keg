cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "2228014ce039f1f58752760ac8917a27b6c9980c97b21ee5b06f0c8a9d7b40bf",
         intel: "a7f61d3ed1a58e5a9224b7b374efb839cf876ea003ad8cd628dba34db37d5ce7"

  url "https://github.com/zerx-lab/FluxDown/releases/download/v#{version}/FluxDown-#{version}-macos-#{arch}.dmg",
      verified: "github.com/zerx-lab/FluxDown/"
  name "FluxDown"
  desc "Download manager with HTTP, FTP, BitTorrent and HLS/DASH streaming support"
  homepage "https://fluxdown.zerx.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :catalina

  app "FluxDown.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/FluxDown.app"]
  end

  # zap trash: [
  # ]
end
