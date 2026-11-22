cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  version "1.5.3,1795309417000"
  sha256 arm:          "ad2e96e2bb9c34da026c4307fb5429e31fc9ea1fb1098605b617ddcbcb3ae3ef",
         intel:        "26ebeb97241f50f92c4d1b7c73d205c7ae15dcea46c8cdd3476f88badbde6352",
         arm64_linux:  "c66002069e163d2600dcd6b5dd3bddc39f5dfdcfd14aba0d9d73fdbe0b99786b",
         x86_64_linux: "ef7fa73e4a37d74db9a5c96aee7f8f662022c01b7bcc82428b0063e034ae9228"

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
