name: "📖 Reading Task"
description: "문서, 책, 강의 등 학습한 내용을 정리하는 Issue 템플릿"
title: "[Reading] "
labels: ["reading", "learning"]
body:
  - type: input
    id: resource
    attributes:
      label: 📚 Resource
      description: 학습 자료 (링크 or 책 이름)
      placeholder: React Native New Architecture Docs
    validations:
      required: true

  - type: textarea
    id: summary
    attributes:
      label: 📝 Summary
      description: 학습한 내용 요약
      placeholder: 주요 개념, 중요한 코드 구조
    validations:
      required: true

  - type: textarea
    id: insights
    attributes:
      label: 💡 Insights
      description: 내 프로젝트 / RN 구조에 어떻게 적용할 수 있는지?
      placeholder: 예: Fabric Commit Cycle → UI 업데이트 최적화 전략
    validations:
      required: false
