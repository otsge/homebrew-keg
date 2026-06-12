cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.0"
  sha256 arm:   "75f9df21513a3cbfdd7b7e0459c49cc090d18430546aa661582cbcd25ffdc4a8",
         intel: "ff19924150a88cbe9cb419aedaa5dbab265ca901255d56c785dbb4c7ceb4f7d8"

  url "https://github.com/Devolutions/UniGetUI/releases/download/v#{version}/UniGetUI.macos-#{arch}.dmg",
      verified: "github.com/Devolutions/UniGetUI/"
  name "UniGetUI"
  desc "GUI for the most common CLI package managers"
  homepage "https://devolutions.net/unigetui/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "UniGetUI.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/UniGetUI.app"]
  end

  # zap trash: [
  # ]
end
