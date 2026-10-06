cask "fuse-t" do
  version "1.2.9"
  sha256 "a1b893740ded8ea034f1acc522ded1144f4a567a1f416daef8c1441cf2662f7f"

  url "https://github.com/macos-fuse-t/fuse-t/releases/download/#{version}/fuse-t-macos-installer-#{version}.pkg"
  name "FUSE-T"
  desc "Kext-less implementation of FUSE"
  homepage "https://www.fuse-t.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  pkg "fuse-t-macos-installer-#{version}.pkg"

  postflight_steps do
    set_ownership ["/usr/local/include", "/usr/local/lib"], recursive: true
    run "bin/brew", args: ["fuse-t-links-add"], base: :homebrew_prefix
  end

  uninstall script:  {
              executable: "#{HOMEBREW_PREFIX}/bin/brew",
              args:       ["fuse-t-links-del"],
              input:      ["Y"],
            },
            pkgutil: [
              "org.fuse-t.core.#{version}",
              "org.fuse-t.fskit.#{version}",
            ]

  zap delete: "/Library/Frameworks/fuse_t.framework"

  caveats do
    license "https://github.com/macos-fuse-t/fuse-t/blob/main/License.txt"
  end
end
