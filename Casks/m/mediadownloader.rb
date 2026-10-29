cask "mediadownloader" do
  version "5.6.7"
  sha256 "02cc4f21a6f435d03b11397f5e38c2302d8c137178d3e3fde31b90692df5baa6"

  url "https://github.com/mhogomchungu/media-downloader/releases/download/#{version}/MediaDownloaderQt6-arm64-#{version}.dmg"
  name "Media Downloader"
  desc "Qt/C++ front end to yt-dlp, youtube-dl, gallery-dl, and more"
  homepage "https://github.com/mhogomchungu/media-downloader"

  conflicts_with cask: "mediadownloader@git"
  depends_on macos: :sonoma

  app "MediaDownloader.app"

  zap trash: [
    "~/Library/Application Support/media-downloader",
    "~/Library/Preferences/org.MediaDownloader.gui.plist",
  ]
end
