cask "unigetui" do
  arch arm: "arm64", intel: "x64"

  version "2026.2.1"
  sha256 arm:   "e787cdd1e9a565ec386ad39128ee4663e0d19f4489954975867fa33000000325",
         intel: "7fb4e3cf6ff633fd2adcb49d4ed2245888dc44f6985f4ba919ae5a05d6f700f9"

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
