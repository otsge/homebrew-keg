cask "stash-app" do
  version "0.32.0"
  sha256 "15dcd4d7af4c36f49da39732371e2af4d8fa00602e85ab259c4540da5cdf55b2"

  url "https://github.com/stashapp/stash/releases/download/v#{version}/Stash.app.zip"
  name "Stash"
  desc "Organizer for your porn, written in Go"
  homepage "https://stashapp.cc/"

  conflicts_with cask: "stash-app@dev"
  depends_on macos: :monterey

  app "Stash.app"

  # zap trash: [
  # ]
end
