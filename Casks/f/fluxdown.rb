cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "8d8be9b021d4ea505830159a474b93ffe9e9bc1ba4693c104509ba15de7ad33b",
         intel: "e25a433a7d762267705e46f2c67edc52b0bdb80d426f94c4566a24cfbbec6cca"

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
