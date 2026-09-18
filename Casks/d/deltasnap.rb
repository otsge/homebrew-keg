cask "deltasnap" do
  version "1.0.1"
  sha256 "495214738d63800d8b0d788efdcfb7d9e848e8110cc515e5fb5df80984f08824"

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
