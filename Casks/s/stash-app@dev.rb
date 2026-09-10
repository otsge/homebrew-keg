cask "stash-app@dev" do
  version "0.31.1-166-gd094202a"
  sha256 :no_check

  url "https://github.com/stashapp/stash/releases/download/latest_develop/Stash.app.zip"
  name "Stash"
  desc "Organizer for your porn, written in Go"
  homepage "https://stashapp.cc/"

  livecheck do
    url :url
    regex(/^v?(\d+[.\d]+[_-]\d+[_-][\d\D]+):\sLatest\sdevelopment\sbuild$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        match = release["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  conflicts_with cask: "stash-app"
  depends_on macos: :monterey

  app "Stash.app"

  # zap trash: [
  # ]
end
