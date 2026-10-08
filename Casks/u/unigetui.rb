cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.3.1"
  sha256 arm:   "62018676368fc887bd93e6358ec5a2c788a1d8bc03b5e75617c7aa6cc1f99557",
         intel: "46c98b028a76004254295da610abb7b0033c5acf70233864ecba233babadb75f"

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
