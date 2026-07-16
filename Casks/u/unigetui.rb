cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.5"
  sha256 arm:   "b3092fcc67cfb85824be5319bef9d363fe6ab27bd02c59a52854cafe15d0a32e",
         intel: "3da2f4ec900fe23dcd2e0d5a7625aae801bc06c0c92b90438808ada8ba37dcc4"

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
