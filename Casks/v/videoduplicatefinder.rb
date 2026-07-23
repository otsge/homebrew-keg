cask "videoduplicatefinder" do
  arch arm: "arm64", intel: "x64"

  version "4.0-443-8fc5128"
  sha256 :no_check

  url "https://github.com/0x90d/videoduplicatefinder/releases/download/4.0.x/GUI-osx-#{arch}.tar.gz"
  name "Video Duplicate Finder"
  desc "Finds duplicated video (and image) files"
  homepage "https://github.com/0x90d/videoduplicatefinder"

  livecheck do
    url "https://api.github.com/repositories/164539637/actions/workflows/releases.yml/runs?branch=master&event=push&page=1&per_page=1&status=success"
    regex(/([0-9a-f]{7})/i)
    strategy :json do |json, regex|
      json["workflow_runs"]&.map do |runs|
        build = runs["run_number"]
        version = runs["head_sha"]&.match(regex)
        next if build.blank? || version.blank?

        "4.0-#{build}-#{version}"
      end
    end
  end

  conflicts_with cask: "videoduplicatefinder@3"
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
