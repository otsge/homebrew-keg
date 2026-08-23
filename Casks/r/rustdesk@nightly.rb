cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  on_arm do
    version "1.4.9,1787445557000"
  end
  on_intel do
    version "1.4.9,1787446320000"
  end
  on_macos do
    sha256 arm:   "146ab4857dfba3944eaac88ac5d26873da755e144ca4f7d85d9ebc948d1e5af5",
           intel: "b3bfb030a087293e982f935c38d141c52bb0511ad2ad78d593c6ee718d66afa8"

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
    sha256 arm64_linux:  "b987eabb5a9f3991909e1a091fcaf60baaa373de772dc7a9932206301af09156",
           x86_64_linux: "6afee1e56a3a9562dcdb4ef3eb0c2ac249f7f993b2e28d3dfc5cd7faf9acb248"

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
