cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.4.5"
  sha256 arm:   "cfaa66668ea18a374777ebb9d7d9a41126e5094752708ca813eadec3637e5c30",
         intel: "b305b0de8e780a27cc7fc3a1134c3436a62782fbd48f69a60b293aac4cf68224"

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
