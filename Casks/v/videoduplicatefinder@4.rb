cask "videoduplicatefinder@4" do
  arch arm: "arm64", intel: "x64"

  version "4.0-8d24b3d"
  sha256 :no_check

  url "https://github.com/0x90d/videoduplicatefinder/releases/download/4.0.x/GUI-osx-#{arch}.tar.gz"
  name "Video Duplicate Finder"
  desc "Finds duplicated video (and image) files"
  homepage "https://github.com/0x90d/videoduplicatefinder"

  livecheck do
    url :url
    regex(/Last\sbuild\sbased\son\s([0-9a-f]{7})/i)
    strategy :github_latest do |json, regex|
      match = json["body"]&.match(regex)
      next if match.blank?

      "4.0-#{match[1]}"
    end
  end

  depends_on macos: :big_sur
  depends_on formula: "ffmpeg@8"

  app "Video Duplicate Finder.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Video Duplicate Finder.app"]
  end

  # zap trash: [
  # ]
end
