cask "fluxdown" do
  arch arm: "arm64", intel: "x64"

  version "0.6.9"
  sha256 arm:   "197d6d8238518bceeddbfc5f6ae264ee4c147976de3ea64166b5287303c8bb97",
         intel: "ab601685e4508dd920b895e4191691b69ff3625da916a328b19010f786f75910"

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
