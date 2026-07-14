cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.3"
  sha256 arm:   "588692cbe7e809e34060eccecdc2d4be03e32e59ee32d0595b9e9e525438e696",
         intel: "20c3533360a61a9a269472019afd55166cbfe6be6b794d8935a6507bad0d7c64"

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
