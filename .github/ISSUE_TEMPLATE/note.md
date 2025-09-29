name: "📝 Note Draft"
description: "노트 작성을 위한 초안 템플릿"
title: "[Note] "
labels: ["note", "blog"]
body:
  - type: input
    id: topic
    attributes:
      label: 📝 Topic
      description: 글 주제
      placeholder: 예: C++ 메모리 관리와 RN JSI 관계
    validations:
      required: true

  - type: textarea
    id: outline
    attributes:
      label: 📑 Outline
      description: 글 목차 / 구조
      placeholder: |
        1. 배경
        2. 실험 과정
        3. 결과
        4. 배운 점
    validations:
      required: true

  - type: textarea
    id: draft
    attributes:
      label: ✍️ Draft
      description: 초안 본문
      placeholder: 여기에 초안을 작성하세요.
    validations:
      required: false
