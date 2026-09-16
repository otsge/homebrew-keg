cask "deltasnap" do
  version "1.0.0"
  sha256 "632e6a0c36388bc7204758f30c0bafb783be61af7c8227f65c5f6cff760b2e7e"

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
