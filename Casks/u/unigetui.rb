cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.3.3"
  sha256 arm:   "bb5cf941a7de8d899194362754ee638fd8473a23afaf892928259306274f5b8f",
         intel: "f9287501fc1ffb5533d5bfcada773b42f3126f6a9c9f831a463f97dee1fc0b49"

  url "https://github.com/Devolutions/UniGetUI/releases/download/v#{version}/UniGetUI.macos-#{arch}.dmg"
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

  postflight_steps do
    run "xattr",
        args: ["-cr", "{{appdir}}/UniGetUI.app"]
  end

  zap trash: [
    "~/Library/Application Support/UniGetUI",
    "~/Library/Preferences/io.github.marticliment.unigetui.plist",
  ]
end
