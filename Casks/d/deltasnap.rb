cask "deltasnap" do
  version "1.0.2"
  sha256 :no_check

  url "https://scaleninja.com/download/deltasnap/DeltaSnap.dmg"
  name "DeltaSnap"
  desc "Manage APFS snapshots"
  homepage "https://scaleninja.com/deltasnap/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  depends_on macos: :sequoia

  app "DeltaSnap.app"

  # zap trash: [
  # ]
end
