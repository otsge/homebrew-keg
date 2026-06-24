cask "videoduplicatefinder@4" do
  arch arm: "arm64", intel: "x64"

  version :latest
  sha256 :no_check

  url "https://github.com/0x90d/videoduplicatefinder/releases/download/4.0.x/GUI-osx-#{arch}.tar.gz"
  name "Video Duplicate Finder"
  desc "Finds duplicated video (and image) files"
  homepage "https://github.com/0x90d/videoduplicatefinder"

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
