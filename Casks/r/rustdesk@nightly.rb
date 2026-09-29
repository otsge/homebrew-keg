cask "rustdesk@nightly" do
  arch arm: "aarch64", intel: "x86_64"
  url_end = on_system_conditional macos: ".dmg", linux: ".AppImage"

  on_arm do
    version "1.5.0,1790643713000"
  end
  on_intel do
    version "1.5.0,1790645121000"
  end
  on_macos do
    sha256 arm:   "3c574aeddd345db4b87671b12a8f2207840fd7afadc9807c734001dc9f6a2bc1",
           intel: "8b510f2fceb21c17877d62be1449bf9586e57406bde101540d759422f9549a6e"

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
    sha256 arm64_linux:  "d00231e2b84bb5835de9e9f50185b8af5ab1c42e84b7313a478bfc2754b80239",
           x86_64_linux: "c16dc87215856022b1c5e731b91d4404b961cd78bc1269ef8c7fa3698c369253"

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
