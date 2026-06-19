cask "deskflow@dev" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0.285"
  sha256 :no_check

  on_arm do
    depends_on macos: :sonoma
  end
  on_intel do
    depends_on macos: :monterey
  end

  url "https://github.com/deskflow/deskflow/releases/download/continuous/deskflow-continuous-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  livecheck do
    url :url
    regex(/Continuous\sv?(\d+[.\d]+)/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        match = release["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  conflicts_with cask: "deskflow"
  depends_on :macos

  app "Deskflow.app"

  postflight do
    system_command "xattr",
                   args: ["-c", "#{appdir}/Deskflow.app"]
  end

  zap trash: [
    "~/Library/Application Support/Deskflow",
    "~/Library/Saved Application State/Deskflow.savedState",
  ]
end
