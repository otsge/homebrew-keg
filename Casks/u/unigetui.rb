cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.6"
  sha256 arm:   "b6881d03154d8aff613a083dcae8ee741787f6d4649978c0856a9dcd3e075d70",
         intel: "ed5e5edc6e562e118db3f75dc1fc00f8289fa6a5bfd5e1f6f0f7b26e3a3602bf"

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
