cask "mediadownloader" do
  version "5.6.2"
  sha256 "ee6b05f360614879340697635f55a3000ae211dccc13042d65d06c1a07a96aad"

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
