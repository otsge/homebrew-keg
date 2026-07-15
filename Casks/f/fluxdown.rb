cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "9f59e2d9eb2d325db0a3325c8f7911ec28d4ea77baf5627e7eaac8f55735095f",
         intel: "37d3b0ad092d0bd2ac16da7f3b879d9569bf98c0fe904671ce5a1071fdb9c166"

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
