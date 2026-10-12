cask "hicapture" do
  version "1.0.11"
  sha256 "0430e8ecf2a38ee4f8947d622f85bc9dc4cb9f23986e8218b2b6bfbdd9b31e65"

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
