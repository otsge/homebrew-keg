cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.7"
  sha256 arm:   "257bc3e872361fb55c0fa55c449b4189865c683ccf0a04b2e813b0bf5e4132a0",
         intel: "9510ab6a99c5e76f916f908e36b26823c8f8966af358624db2f6958dd648a495"

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
