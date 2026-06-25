cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.2"
  sha256 arm:   "472bf94d1ea7cfb03334d5245bd2afd005696d55df1b63a29ad9003ea805bfa9",
         intel: "f36b240792f5d38d5f9e3df5d55b46efaa44a3b3303d21bd25724472d5e45d92"

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
