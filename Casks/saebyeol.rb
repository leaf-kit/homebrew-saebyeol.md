cask "saebyeol" do
  version "0.1.0"

  arch arm: "aarch64", intel: "x64"

  # arch 별로 dmg 가 따로 빌드되므로 SHA256 도 둘로 분리한다. release CI 의
  # bump-cask-sha 잡이 새 태그마다 두 값을 모두 자동 갱신한다.
  sha256 arm:   "308532f8d46b64e5f2e0e69d4faad38d1352128be38f6cc53f935dc108647169",
         intel: "6cec859956c591fcf41eee30cda5c6cbfd30d07c5aeb14671ac7da33b603401e"

  url "https://github.com/leaf-kit/saebyeol.md/releases/download/v#{version}/saebyeol_#{version}_#{arch}.dmg"
  name "Saebyeol"
  name "새별"
  desc "Markdown editor with built-in Hangul IME (모아치기 · 세벌식 · 두벌식)"
  homepage "https://leaf-kit.github.io/saebyeol/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "saebyeol.app"

  # Apple Developer ID 코드사이닝/노터리제이션 전이라 첫 실행 시
  # macOS Gatekeeper 가 경고를 띄운다. 그러나 quarantine 속성을 일부러
  # 떼지 않고 그대로 두면, 사용자가 한 번 실행 시도 → 시스템 환경설정
  # → 개인정보 보호 및 보안 → "차단했지만 그래도 열기" 를 통해 1회 승인
  # 후 정상 실행할 수 있다. 빌드 측에서 ad-hoc 서명을 붙여 두었으므로
  # 이 흐름이 정상적으로 동작한다.

  # 앱을 제거할 때 함께 청소할 사용자 데이터 — 설정·자동완성 사용자
  # 사전·학습된 n-gram·캐시.
  zap trash: [
    "~/Library/Application Support/dev.leaf.sbmd",
    "~/Library/Caches/dev.leaf.sbmd",
    "~/Library/Preferences/dev.leaf.sbmd.plist",
    "~/Library/Saved Application State/dev.leaf.sbmd.savedState",
    "~/Library/WebKit/dev.leaf.sbmd",
  ]
end
