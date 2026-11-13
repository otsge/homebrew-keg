cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.3.4"
  sha256 arm:   "0b4873efbf9e2b302638a0eeaddaf3f8f827285a9b6760cc6ec4178bab923fdb",
         intel: "a4e277c8d8ec5debf064043b5716e5048f2c1b9c904a25cde120ccb566d82f75"

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
