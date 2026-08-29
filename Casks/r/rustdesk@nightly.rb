cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  on_arm do
    version "1.4.9,1787964472000"
  end
  on_intel do
    version "1.4.9,1787965549000"
  end
  on_macos do
    sha256 arm:   "d29903a28e1644410b5fb9d955c38ec42e4e6fe9a5fb76595438922ca0107a44",
           intel: "1059c4c4622b79209b07770723829f003ac1c59141e9c76cf0b08de3f37bca68"

    depends_on macos: :monterey

    app "RustDesk.app"

    uninstall quit: "com.carriez.rustdesk"

    zap trash: [
      "/Library/LaunchAgents/com.carriez.RustDesk_server.plist",
      "/Library/LaunchDaemons/com.carriez.RustDesk_service.plist",
      "~/Library/Logs/RustDesk",
      "~/Library/Preferences/com.carriez.RustDesk",
      "~/Library/Saved Application State/com.carriez.rustdesk.savedState",
    ]
  end
  on_linux do
    sha256 arm64_linux:  "5819b75508a875467d42ea38149594f504d2b97ab36ef86d2fa0c9d4669caeae",
           x86_64_linux: "1483a8bdadd103637f3bfc1790217a7cb56494cac39590315c81e0905db2d8ae"

    app_image "rustdesk-#{version.csv.first}-#{arch}.AppImage",
              target: "RustDeskNightly.AppImage"
  end

  url "https://github.com/rustdesk/rustdesk/releases/download/nightly/rustdesk-#{version.csv.first}-#{arch}#{url_end}"
  name "RustDesk"
  desc "Open source virtual/remote desktop application"
  homepage "https://rustdesk.com/"

  livecheck do
    url :url
    regex(/^rustdesk[._-]v?(\d+(?:\.\d+)+)[._-]#{arch}#{url_end}$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["tag_name"] != "nightly"
        next if release["draft"]

        release["assets"]&.map do |asset|
          match = asset["name"]&.match(regex)
          next if match.blank?

          updated = asset["updated_at"]

          "#{match[1]},#{DateTime.parse(updated).strftime("%Q")}"
        end
      end.flatten
    end
  end

  conflicts_with cask: "rustdesk"
end
