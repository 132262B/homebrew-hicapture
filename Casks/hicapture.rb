cask "hicapture" do
  version "1.0.0"
  sha256 "600963b556d8c17d0669692e9dfc2aec220bc919040e305485c361e253543e2f"

  url "https://github.com/132262B/homebrew-hicapture/releases/download/v#{version}/hicapture-#{version}-macos.zip"
  name "HiCapture"
  desc "Screenshot tool with region capture, annotation editor and color picker"
  homepage "https://hi-capture.com"

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
    처음 실행하면 화면 기록 권한을 요청합니다. 허용한 뒤 창의 '다시 시작' 을
    누르면 적용됩니다. macOS 는 앱이 새로 실행될 때 이 권한을 반영합니다.

    업데이트는 이렇게 합니다.

      brew update && brew upgrade --cask hicapture

    지금 돌고 있는 버전은 설정 창 왼쪽 아래에 적혀 있습니다. 업그레이드했는데
    그 숫자가 그대로면 예전 프로세스가 아직 떠 있는 것이니, HiCapture 를 완전히
    끄고 다시 실행해 주세요.
  EOS
end
