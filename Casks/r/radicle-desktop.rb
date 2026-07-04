cask "radicle-desktop" do
  version "0.12.0"
  sha256 :no_check

  url "https://files.radicle.dev/releases/radicle-desktop/latest/radicle-desktop-aarch64.dmg"
  name "Radicle Desktop"
  desc "Desktop client for Radicle repositories"
  homepage "https://desktop.radicle.dev/"

  livecheck do
    url "https://files.radicle.dev/releases/radicle-desktop/latest/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on :macos
  depends_on arch: :arm64

  app "Radicle.app"

  postflight do
    system_command "xattr",
                   args: ["-c", "#{appdir}/Radicle.app"]
  end

  uninstall quit: "dev.radicle.desktop"

  zap trash: [
    "~/.radicle",
    "~/Library/Application Support/xyz.radicle.desktop",
    "~/Library/Caches/xyz.radicle.desktop",
    "~/Library/WebKit/xyz.radicle.desktop",
  ]
end
