cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  on_arm do
    version "1.4.9,1787622593000"
  end
  on_intel do
    version "1.4.9,1787620518000"
  end
  on_macos do
    sha256 arm:   "688abc0d6f89113309a931f4324e267e5118144facff0891c4505469fd792676",
           intel: "d7c387d170dd4d48dd0479a37626e3bcaee6877a71be42f135f81571f80795b7"

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
           x86_64_linux: "6497d47a5e405dffbc12b76ef379381bf664a8f49241103718d96f4ec7928077"

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
