cask "deltasnap" do
  version "0.8.0"
  sha256 "27664de2a017c4cd5b7bd7c6acfe45085f765ec38ef53de2bac6866b0f17dfcd"

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
