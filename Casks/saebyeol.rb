cask "saebyeol" do
  version "0.1.0"

  # 첫 릴리스 직후에는 release CI 가 GitHub Release 에 dmg 를 올린 뒤
  # 같은 워크플로에서 SHA 를 계산해 이 파일을 PR 로 갱신한다. 임시로
  # `:no_check` 를 두는 사이엔 다운받은 바이너리 무결성 검사가 비활성화
  # 되므로 가능한 한 빨리 실제 SHA 로 교체할 것.
  sha256 :no_check

  arch arm: "aarch64", intel: "x64"

  url "https://github.com/leaf-kit/saebyeol.md/releases/download/v#{version}/Saebyeol_#{version}_#{arch}.dmg"
  name "Saebyeol"
  name "새별"
  desc "Markdown editor with built-in Hangul IME (모아치기 · 세벌식 · 두벌식)"
  homepage "https://leaf-kit.github.io/saebyeol/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Saebyeol.app"

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
