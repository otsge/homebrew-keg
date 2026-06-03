cask "mediadownloader" do
  version "5.6.1"
  sha256 "a1cde5d382ff56c598ca31b5e297e14869c02db382ce950597acb3304eac29b6"

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
