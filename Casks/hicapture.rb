cask "hicapture" do
  version "1.0.0"
  sha256 "600963b556d8c17d0669692e9dfc2aec220bc919040e305485c361e253543e2f"

  url "https://github.com/132262B/homebrew-hicapture/releases/download/v#{version}/hicapture-#{version}-macos.zip"
  name "HiCapture"
  desc "Screenshot tool with region capture, annotation editor and color picker"
  homepage "https://hi-capture.com/"

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
    On first launch HiCapture asks for the Screen Recording permission. Allow it,
    then press "Restart" in the window: macOS applies this permission the next
    time the app starts.

    To update:

      brew update && brew upgrade --cask hicapture

    The running version is shown in the bottom-left corner of the Settings window.
    If the number does not change after an upgrade, the old process is still
    running. Quit HiCapture completely and open it again.
  EOS
end
