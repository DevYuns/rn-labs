# React Native System Labs – Roadmap

React Native 전문가에서 iOS/Android 시스템 기술리드로 성장하기 위한 학습 로드맵

## 🎯 Learning Path Overview

```
Core/내부 동작 → 성능 최적화 → 플랫폼 통합 → 아키텍처 & 리드 역량
```

- **Core/내부 동작**: JSI, TurboModules, Fabric Renderer, Hermes 엔진
- **성능 최적화**: Thread 모델, 메모리 관리, 리스트/애니메이션, 빌드 최적화
- **플랫폼 통합**: 네이티브 모듈, Background Job, Push, Widgets, 주요 라이브러리
- **아키텍처 & 리드 역량**: Monorepo, Design System, DDD, 테스트, CI/CD, 품질 관리

---

## 📅 Milestones & Tasks

### Milestone 1: C++ & RN Core 내부 구조
**Goal:** C++ & RN New Architecture 코드 레벨 이해
**Status:** 11 open issues

#### Core Tasks
- [ ] #27 C++ 멀티스레딩 & atomic 실습
  - 포인터, 참조, RAII, 스마트 포인터 (unique_ptr, shared_ptr)
  - 메모리 모델, 멀티스레딩, 락/atomic
- [ ] #28 TurboModules Codegen & C++ 바인딩
  - JSI(JavaScript Interface) 이해
  - 간단한 C++ 함수를 RN JSI 모듈로 구현
- [ ] #38 Fabric Renderer & Shadow Tree 분석
  - Shadow Tree commit cycle
  - Yoga 레이아웃 엔진
- [ ] #39 Old vs New Architecture Bridge 비교
- [ ] #40 RN 메모리 프로파일링
  - Hermes 메모리 관리, GC, bytecode

#### 실습 과제
1. C++에서 `unique_ptr`/`shared_ptr`로 객체 메모리 관리 코드 작성
2. 간단한 C++ 함수(`add(int,int)`)를 RN JSI 모듈로 만들어 JS에서 호출하기
3. Hermes JS 엔진 빌드 옵션 활성화 후 성능 차이 측정

#### 추천 리소스
- [C++ Primer (책)](https://www.amazon.com/Primer-5th-Stanley-B-Lippman/dp/0321714113)
- [CppCon YouTube](https://www.youtube.com/user/CppCon)
- [React Native New Architecture Docs](https://reactnative.dev/docs/the-new-architecture/landing-page)

📂 **Output:**
- `/labs/cpp`, `/labs/jsi`
- 블로그: *"C++ 메모리 관리와 RN JSI 관계"*

---

### Milestone 2: Platform System Architecture
**Goal:** iOS/Android 내부 동작 원리 습득
**Status:** 10 open issues

#### iOS Tasks
- [ ] #18 iOS RunLoop와 RN Event Loop 비교
  - RunLoop, ARC, Autorelease Pool
- [ ] #29 iOS Core Animation 파이프라인 실습
- [ ] #30 iOS BGTaskScheduler 실습
  - GCD, OperationQueue
  - BackgroundTask, BGTaskScheduler, PushKit
- [ ] #41 iOS App State & PushKit

#### Android Tasks
- [ ] #19 Android Looper/Handler와 RN Thread 모델
  - AMS, 프로세스 우선순위
- [ ] #31 Android AMS, ART GC, SurfaceFlinger
  - ART GC
  - SurfaceFlinger 렌더링 파이프라인
  - Doze 모드

#### 실습 과제
**iOS:**
1. RunLoop를 활용해 Timer 기반 앱 만들기
2. OperationQueue로 3개의 이미지 다운로드 병렬 처리
3. 앱을 Background 상태로 전환 후 BGTaskScheduler를 활용해 fetch 실행

**Android:**
1. Handler/Looper로 1초마다 로그 출력하는 예제 작성
2. Activity Lifecycle 로그 → 백그라운드에서 kill 시점 관찰
3. Doze 모드에서 AlarmManager vs WorkManager 차이 테스트

#### 추천 리소스
- [Apple Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/)
- [Android Processes and Threads](https://developer.android.com/guide/components/processes-and-threads)
- [Android Performance Patterns](https://www.youtube.com/playlist?list=PLOU2XLYxmsILKwwASNS0xgfcmakbK_8JZ)

📂 **Output:**
- `/labs/ios`, `/labs/android`
- 블로그: *"GCD vs RN JS Thread 모델"*, *"Doze 모드와 RN Background Job"*

---

### Milestone 3: RN 네이티브 확장 & 동시성 기초
**Goal:** RN 모듈 ↔ Swift/Kotlin Concurrency 연동
**Status:** 13 open issues

#### Core Tasks
- [ ] #20 Swift async/await와 RN 모듈 통합
- [ ] #21 Kotlin Coroutines와 RN 모듈 통합
- [ ] #22 RN 이미지 렌더링 최적화 가이드
- [ ] #32 Swift TaskGroup & Cancellation
- [ ] #33 Kotlin Flow + Retrofit 스트리밍
- [ ] #34 Android Bitmap Pool & 메모리 최적화
- [ ] #42 RN Thread 모델 프로파일링
- [ ] #43 FlatList 최적화 & Reanimated
- [ ] #44 iOS/Android Push & Widget
- [ ] #45 이미지 라이브러리 비교 (SDWebImage/Glide/Coil)

#### Swift Concurrency (기초)
- async/await으로 네트워크 호출
- TaskGroup으로 이미지 병렬 다운로드
- Cancellation API 적용

#### Kotlin Coroutines (기초~심화)
- suspend 함수로 API 호출 후 UI 업데이트
- CoroutineWorker 구현해 주기적 작업 실행
- Retrofit + Coroutines + Flow 조합

#### 이미지 렌더링 & 최적화
**iOS:** UIImage + ImageIO, HEIC, WebP, SDWebImage, Nuke
**Android:** BitmapFactory + Skia, Glide, Fresco, Coil, inSampleSize, bitmap pool

#### 실습 과제
1. RN `<Image />`로 PNG/JPEG/WebP/HEIC 로딩 → 메모리 사용량 비교
2. Android Glide에서 thumbnail API 사용해 썸네일 먼저 보여주기
3. iOS SDWebImage로 progressive JPEG 로딩 구현
4. Bitmap pool 사용 전후 메모리 차이 실험

#### 추천 리소스
- [Apple Swift Concurrency 문서](https://developer.apple.com/documentation/swift/concurrency)
- [Kotlin Coroutines Docs](https://kotlinlang.org/docs/coroutines-overview.html)
- [SDWebImage Docs](https://github.com/SDWebImage/SDWebImage)
- [Glide Docs](https://bumptech.github.io/glide/)

📂 **Output:**
- `/labs/concurrency`, `/labs/rendering`
- 블로그: *"RN 이미지 렌더링 최적화 가이드"*

---

### Milestone 4: Deep Dive (심화 & 리드 역량)
**Goal:** Actor/Coroutine 심화 + 아키텍처 리드
**Status:** 13 open issues

#### Concurrency 심화
- [ ] #23 Swift Actor vs RN JSI Thread Model
- [ ] #24 Kotlin Flow/Channel과 RN 상태 관리
- [ ] #35 Swift AsyncSequence & Custom Executor
- [ ] #36 Kotlin Channel & Cancellation 전파

#### Architecture & DevOps
- [ ] #25 RN Monorepo와 CI/CD 전략
- [ ] #26 Crashlytics & Perfetto 기반 성능 분석
- [ ] #46 RN 빌드 최적화 & OTA
- [ ] #47 DDD 기반 RN 아키텍처 설계
- [ ] #48 Detox E2E 테스트 구축

#### Swift Concurrency (심화 & CS 기반)
1. Actor를 활용해 thread-safe 데이터 스토어 구현
2. AsyncSequence로 무한 데이터 스트림 구현 후 cancel
3. Custom Executor 만들어 특정 QoS에 따라 실행

#### Kotlin Coroutines (심화 & CS 기반)
1. Flow/StateFlow로 UI 상태 관리 구현
2. Channel을 이용한 Producer-Consumer 패턴 구현
3. Cancellation 전파 실험 (부모/자식 coroutine)
4. Dispatchers.IO vs Default 성능 비교

#### 추천 리소스
- [Swift.org Concurrency Manifesto](https://github.com/apple/swift-evolution/blob/main/proposals/0304-structured-concurrency.md)
- [Kotlin Flow Docs](https://kotlinlang.org/docs/flow.html)

📂 **Output:**
- `/labs/architecture`, `/labs/ci-cd`
- 블로그: *"RN 시스템 구루 로드맵 회고"*
- 팀 가이드북 (Markdown/PDF)

---

## 📊 관리 규칙

### GitHub 구조
- **Milestone**: 4개의 큰 학습 단계 (C++ & RN Core → Platform → Native 확장 → Deep Dive)
- **Issue**: 세부 학습 과제 (각 이슈는 관련 마일스톤에 할당)
- **Label**:
  - 플랫폼: `ios`, `android`, `cpp`
  - 도메인: `rn-core`, `optimization`, `architecture`, `concurrency`
  - 타입: `experiment`, `note`, `reading`
- **Project Board**: 진행 현황 시각화 (Todo → In Progress → Done)

### Issue 작성 규칙
- `[Experiment]`: 실습/실험 과제
- `[Note]`: 이론 학습 및 정리
- `[Reading]`: 문서/소스코드 분석
- 이슈 제목에 핵심 키워드 포함
- 관련 리소스 링크 첨부

---

## 각 영역

### RN
- New Architecture 내부 동작을 코드 레벨로 이해
- JSI, TurboModules, Fabric Renderer, Hermes 엔진 심층 이해
- RN 성능 최적화 및 메모리 관리 전문성

### 플랫폼
**iOS:**
- RunLoop, ARC, GCD/OperationQueue
- Swift Concurrency (async/await, Actor, AsyncSequence)
- 이미지 렌더링 파이프라인 (UIImage, SDWebImage)
- Background Job, Push, Widget 구현

**Android:**
- Looper/Handler, AMS, ART GC
- Kotlin Coroutines (Flow, Channel, Dispatchers)
- 이미지 렌더링 파이프라인 (BitmapFactory, Glide)
- Background Job, Push, Widget 구현

### 아키텍처
- 성능·메모리·빌드 파이프라인 최적화 리드
- 네이티브 확장 전략 설계 및 구현
- Monorepo, Design System, DDD 아키텍처 구축
- CI/CD, 테스트 전략, 품질 관리 시스템 구축
- 팀 단위 기술 리더십 및 코드 리뷰 프로세스 확립

### 실전 적용
- Background job, Notification, Widget, Lock Screen 통합
- 이미지 렌더링/메모리 관리 최적화
- 동시성 프로그래밍을 활용한 안정적인 RN 앱 구축
- 네이티브 모듈 설계 및 구현
- 성능 모니터링 및 문제 해결

---

## 📖 참고 자료

### 공식 문서
- [React Native Docs](https://reactnative.dev/)
- [React Native New Architecture](https://reactnative.dev/docs/the-new-architecture/landing-page)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [Android Developers](https://developer.android.com/)

*Last Updated: 2025-10-01*
