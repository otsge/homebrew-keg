cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  version "1.5.1,1792458241000"
  sha256 arm:          "a2af40f05b60f746ced8e4d85df5693d433e1037e91d9bd5c792bab41138565a",
         intel:        "655b0adcba158c0e968f8009623acea607fdd1fd70f06c670e2c8f9d9fa29ca5",
         arm64_linux:  "c01147952cc8265b30ab406950d509fbdd20ba84bd2e9eaee8d204c8483d096a",
         x86_64_linux: "e79aef67e778ba3a62846322a82e965f530f0e63067ca9f81781f0b8f73d75ee"

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
