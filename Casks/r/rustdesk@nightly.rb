cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  version "1.5.3,1794791111000"
  sha256 arm:          "1395037c1b272fa4d7f64ac6472355b58fdcd92cffa9e10489318aaa1960d3d0",
         intel:        "aebf9f78cc62e08531cc98eb6169b96b663b8c2f3016f0610159f1f7540d9f84",
         arm64_linux:  "97ae6275ed620624b542cf36733917e30b1815297c6b511fba2eca38aa6c647a",
         x86_64_linux: "47b918367654a2b88cfdeabdc78b2c0fb55ef7cf3ebdeb2dc124103483b72bd2"

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
