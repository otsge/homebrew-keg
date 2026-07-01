cask "videoduplicatefinder@3" do
  arch arm: "arm64", intel: "x64"

  version "3.0-0090c1e"
  sha256 :no_check

  url "https://github.com/0x90d/videoduplicatefinder/releases/download/3.0.x/GUI-osx-#{arch}.tar.gz"
  name "Video Duplicate Finder"
  desc "Finds duplicated video (and image) files"
  homepage "https://github.com/0x90d/videoduplicatefinder"

  livecheck do
    url "https://api.github.com/repos/0x90d/videoduplicatefinder/releases/tags/3.0.x"
    regex(/Last\sbuild\sbased\son\s([0-9a-f]{7})/i)
    strategy :json do |json, regex|
      match = json["body"]&.match(regex)
      next if match.blank?

      "3.0-#{match[1]}"
    end
  end

  depends_on macos: :big_sur
  depends_on formula: "ffmpeg"

  app "Video Duplicate Finder.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Video Duplicate Finder.app"]
  end

  # zap trash: [
  # ]
end
