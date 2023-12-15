[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)
# TuistTemplate

Tuist Template 플러그인으로 제공

## 설명

1. Tuist Generate 관련 템플릿 제공
    1. Target 생성 템플릿
2. ResourceSynthesizers 관련 제공
    1. StringSynthesizer 문자열

## 사용법

Tuist -> Manifests -> Config 파일에서 플러그인 설정에 Git 저장소 추가

### 1. Template

#### 1-1. Target

**Config.swift**
```Swift
// Config.swift

let config = Config(
  ...
  plugins: [
    ...
    // 커밋 SHA로 Git 설정
    .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", sha: "커밋 SHA, directory: "Templates"") 
    // or
    // 태그로 Git 설정
    .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", tag: "태그명, directory: "Templates"")
  ],
  ...
)
```

****

### 2. ResourceSynthesizers

#### 2-2. StringSynthesizers

**Config.swift**
```Swift
// Config.swift

let config = Config(
  ...
  plugins: [
    ...
    // 커밋 SHA로 Git 설정
    .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", sha: "커밋 SHA, directory: "StringSynthesizer"") 
    // or
    // 태그로 Git 설정
    .git(url: "git@github.com:Kiseok-Peter/TuistTemplate.git", tag: "태그명, directory: "StringSynthesizer"")
  ],
  ...
)
```
