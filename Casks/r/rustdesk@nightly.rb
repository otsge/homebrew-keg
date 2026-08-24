cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  on_arm do
    version "1.4.9,1787566536000"
  end
  on_intel do
    version "1.4.9,1787567243000"
  end
  on_macos do
    sha256 arm:   "848eabd5fd53e35228ec5387a3c2d9d28e76878541de57ef291a368621e7acdc",
           intel: "14c06ed8cf2b49660b5472b868915f8a11d11bd858ffba446bb16885e555e0e7"

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
    sha256 arm64_linux:  "f3cde91ec3e62e7872bf8fdc71ada58a585b31c3d39a39a11bcfaa00de94e91d",
           x86_64_linux: "b8ffd99ac111deefb26ebbe4f5de8c28258a3ed6223d67fd0b499f807a09b018"

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
