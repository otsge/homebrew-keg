cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.4"
  sha256 arm:   "e8e656f0a57017497ada5acc090a6037e43b9869f118719aef427c6230ce014d",
         intel: "27d6ac25e0cf10168d02fe10d8f928f9433128534748d759ad7d912927ad64ee"

  url "https://github.com/Devolutions/UniGetUI/releases/download/v#{version}/UniGetUI.macos-#{arch}.dmg",
      verified: "github.com/Devolutions/UniGetUI/"
  name "UniGetUI"
  desc "GUI for the most common CLI package managers"
  homepage "https://devolutions.net/unigetui/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "UniGetUI.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/UniGetUI.app"]
  end

  zap trash: [
    "~/Library/Application Support/UniGetUI",
    "~/Library/Preferences/io.github.marticliment.unigetui.plist",
  ]
end
