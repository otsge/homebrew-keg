cask "deltasnap" do
  version "1.0.2"
  sha256 "1149e91d9fd14e8e23c7d5342976e6ea6b2be9f1f2fda5a9e1746fb9551fa8b8"

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
