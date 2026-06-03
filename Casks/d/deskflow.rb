cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.0"
  sha256 arm:   "bae6befc2c3119de3d751c1200aab30af3efa5496e91d5ca1029cc388eea69c5",
         intel: "b60bd78e829b9937c5812e6fc208b72a9235c3a5ba836601d50e1a5be9ac4af2"

  on_arm do
    depends_on macos: :sonoma
  end
  on_intel do
    depends_on macos: :monterey
  end

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "deskflow@dev"
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
