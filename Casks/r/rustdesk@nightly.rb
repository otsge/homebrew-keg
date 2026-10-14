cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  version "1.5.1,1791939650000"
  sha256 arm:          "8dda7943d3a0be80c9979cf53560faa8a3df804df123d22b90713753a1a0e5ba",
         intel:        "d6756628295b1944d77b8ce7937a15ce5ac58f1953b4fa8d69176e6f682142cd",
         arm64_linux:  "ceed43182a40b1ca823090f819f3f00bd3a355b223f407d436e6f7a727bb7a7d",
         x86_64_linux: "767550e270ab1f3a648cfb88c4a8b1dadf17f800d0faa6cd3316f17602af8c7b"

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
