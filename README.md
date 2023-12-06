[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)
# TuistTemplate

Tuist Template 플러그인으로 제공

## 사용법

Tuist -> Manifests -> Config 파일에서 플러그인 설정에 Git 저장소 추가
```Swift
// Config.swift

let config = Config(
  ...
  plugins: [
    ...
    // 커밋 SHA로 Git 설정
    .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", sha: "커밋 SHA") 
    // or
    // 태그로 Git 설정
    .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", tag: "태그명")
  ],
  ...
)
```
