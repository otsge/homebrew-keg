cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "69c2be0af231f9ab4574432ee555ba93b0e8d8eaae784e0597e4e431eaccfcc4",
         intel: "35eae808bb75110a976b1153f7d54a16783a22adfa3ce28f8654abf5ef757e5b"

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
