cask "hicapture" do
  version "1.1.7"
  sha256 "563bb37474350b6e9e930a43d09fcde02f449e07129b5d9e963352296c52d8f1"

  url "https://hi-capture.com/assets/releases/hicapture-#{version}-macos.zip"
  name "HiCapture"
  desc "Screenshot tool with region capture, annotation editor and color picker"
  homepage "https://hi-capture.com/"

  livecheck do
    url "https://hi-capture.com/en"
    regex(/href=.*?hicapture[._-]v?(\d+(?:\.\d+)+)[._-]macos\.dmg/i)
  end

  depends_on macos: :sonoma

  app "HiCapture.app"

  uninstall quit: "com.flate.hicapture"

  zap trash: [
    "~/Library/Application Support/com.flate.hicapture",
    "~/Library/Caches/com.flate.hicapture",
    "~/Library/Saved Application State/com.flate.hicapture.savedState",
    "~/Library/WebKit/com.flate.hicapture",
  ]

  caveats <<~EOS
    On first launch, allow Screen Recording when asked, then press "Restart".
  EOS
end
