cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.7"
  sha256 arm:   "387fc8082853d68987bdbdce591a7e6755ad0ad6e6480822d0c4f4145a045361",
         intel: "071de32fbcc3485dd99fafd95848286469a1b8fae7b722a521d8e87d1b724fd0"

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
