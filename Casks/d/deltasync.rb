cask "deltasync" do
  version "0.1"
  sha256 :no_check

  url "https://scaleninja.com/download/DeltaSync.dmg"
  name "DeltaSync"
  desc "Simple file and folder syncing tool using rsync"
  homepage "https://scaleninja.com/deltasnap/#deltasync"

  livecheck do
    url :url
    strategy :extract_plist
  end

  depends_on macos: :sonoma

  app "DeltaSync.app"

  # zap trash: [
  # ]
end
