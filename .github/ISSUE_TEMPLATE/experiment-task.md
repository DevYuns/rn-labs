name: "🧪 Experiment Task"
description: "실습 과제를 기록하고 결과를 관리하는 Issue 템플릿"
title: "[Experiment] "
labels: ["experiment", "lab"]
body:
  - type: markdown
    attributes:
      value: |
        ## 🧪 실습 과제
        이슈를 통해 하나의 실험/과제를 관리합니다.
        아래 항목을 채워주세요.

  - type: input
    id: goal
    attributes:
      label: 🎯 Goal
      description: 무엇을 배우거나 검증하려는가?
      placeholder: 예: JSI 모듈 제작 (C++ → JS 바인딩)
    validations:
      required: true

  - type: textarea
    id: steps
    attributes:
      label: 🔨 Steps
      description: 실습 단계 / 시도할 방법
      placeholder: |
        1. 환경 세팅
        2. 코드 작성
        3. 실행 및 결과 확인
    validations:
      required: true

  - type: textarea
    id: result
    attributes:
      label: 📊 Result
      description: 결과 요약, 성능 수치, 스크린샷 링크
      placeholder: |
        - Hermes vs JSC 성능 차이 기록
        - Instruments 캡처 이미지 첨부
    validations:
      required: false

  - type: textarea
    id: learning
    attributes:
      label: 📚 Learning
      description: 얻은 인사이트, 배운 점
      placeholder: 예: "JSI는 Native ↔ JS간 zero-copy를 가능하게 함"
    validations:
      required: false
