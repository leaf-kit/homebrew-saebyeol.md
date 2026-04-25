# homebrew-saebyeol.md

[새별 (Saebyeol)](https://github.com/leaf-kit/saebyeol.md) 의 공식 [Homebrew Cask](https://docs.brew.sh/Cask-Cookbook) tap.

## 설치

```bash
brew tap leaf-kit/saebyeol.md
brew install --cask saebyeol
```

## 업데이트

```bash
brew update
brew upgrade --cask saebyeol
```

본인 동의 시 앱 실행 중에도 자동 업데이트 안내가 뜬다. 자세한 내용은 본 프로젝트 [README](https://github.com/leaf-kit/saebyeol.md#자동-업데이트-in-app) 참조.

## 제거

```bash
brew uninstall --cask saebyeol
brew untap leaf-kit/saebyeol.md
```

`brew uninstall --cask saebyeol` 은 cask 정의의 `zap` 절에 따라 다음 사용자 데이터까지 함께 정리한다 (필요 시):

- `~/Library/Application Support/dev.leaf.sbmd`
- `~/Library/Caches/dev.leaf.sbmd`
- `~/Library/Preferences/dev.leaf.sbmd.plist`
- `~/Library/Saved Application State/dev.leaf.sbmd.savedState`
- `~/Library/WebKit/dev.leaf.sbmd`

## 운영 정책

- Cask 의 `version` · `sha256` 은 본 프로젝트 release 워크플로 (`.github/workflows/release.yml`) 가 새 태그가 push 될 때마다 자동으로 갱신해 본 저장소에 커밋한다.
- 수동으로 cask 를 손볼 필요는 거의 없으며, 변경이 필요하면 본 저장소에 PR 을 열거나 본 프로젝트의 워크플로를 손본다.

## 라이선스

본 tap 저장소 자체는 [MIT](LICENSE) 또는 Apache-2.0 듀얼 라이선스로 배포되며, 새별 본체와 동일한 정책을 따른다.
