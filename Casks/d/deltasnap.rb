cask "deltasnap" do
  version "0.7.5"
  sha256 "873f5b560f1dca4f263f20dbe05e6511c2297c7496df1db5b0f2d6d99cbae7b7"

  url "https://scaleninja.com/download/deltasnap/releases/DeltaSnap-#{version}.zip"
  name "DeltaSnap"
  desc "Manage APFS snapshots"
  homepage "https://scaleninja.com/deltasnap/"

  livecheck do
    url :homepage
    regex(%r{href=.*?/DeltaSnap-(\d+(?:\.\d+)*)\.zip}i)
    strategy :page_match
  end

  depends_on macos: :sequoia

  app "DeltaSnap.app"

  # zap trash: [
  # ]
end
