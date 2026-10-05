cask "hicapture" do
  version "1.0.1"
  sha256 "8d2fd90f8efdb64cba8014f2f06b4cdc5e027ebb213876688a7cd31ea607052a"

  url "https://hi-capture.com/assets/releases/hicapture-#{version}-macos.zip"
  name "HiCapture"
  desc "Screenshot tool with region capture, annotation editor and color picker"
  homepage "https://hi-capture.com/"

  livecheck do
    url "https://hi-capture.com/en"
    regex(/href=.*?hicapture[._-]v?(\d+(?:\.\d+)+)[._-]macos\.zip/i)
  end

  depends_on macos: :sonoma

  app "HiCapture.app"

  uninstall quit: "com.flate.hicapture"

  zap trash: [
    "~/Library/Application Support/com.flate.hicapture",
    "~/Library/Application Support/com.flate.pixnip",
    "~/Library/Application Support/kr.doweb.pixnip",
    "~/Library/Caches/com.flate.hicapture",
    "~/Library/Caches/com.flate.pixnip",
    "~/Library/Saved Application State/com.flate.hicapture.savedState",
    "~/Library/Saved Application State/com.flate.pixnip.savedState",
    "~/Library/Saved Application State/kr.doweb.pixnip.savedState",
    "~/Library/WebKit/com.flate.hicapture",
    "~/Library/WebKit/com.flate.pixnip",
    "~/Library/WebKit/kr.doweb.pixnip",
  ]

  caveats <<~EOS
    On first launch, allow Screen Recording when asked, then press "Restart".
  EOS
end
