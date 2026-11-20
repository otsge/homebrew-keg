cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  version "1.5.3,1795135716000"
  sha256 arm:          "8186fbf5c769a57a30f328ab4bcd7de60180f1610375a2a3fef1a9c066536bc0",
         intel:        "a3be163e6a8c69a416ef579b519944fa424c48d435948c70aab9ad4e73c47dd4",
         arm64_linux:  "869c060ae457c3d75a68ce0af47355d312e8256fb0aaae5d18f194c1f5fa8f86",
         x86_64_linux: "c91a4453461d4a5ee54b94964749fa5f0bc8f30ae9dcab7e90cf3992ea45b518"

  on_macos do
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
    app_image "rustdesk-#{version.csv.first}-#{arch}.AppImage",
              target: "RustDeskNightly.AppImage"
  end

  url "https://github.com/rustdesk/rustdesk/releases/download/nightly/rustdesk-#{version.csv.first}-#{arch}#{url_end}"
  name "RustDesk"
  desc "Open source virtual/remote desktop application"
  homepage "https://rustdesk.com/"

  livecheck do
    url "https://github.com/rustdesk/rustdesk/releases"
    regex(/^rustdesk[._-]v?(\d+(?:\.\d+)+)[._-]aarch64.dmg$/i)
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
