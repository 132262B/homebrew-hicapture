cask "hicapture" do
  version "1.1.0"
  sha256 "456706ae3c0e8430c0325dc743d629969e2d630c8566ef10bddba00d0d35d0c2"

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
