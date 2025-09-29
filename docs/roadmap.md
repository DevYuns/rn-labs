# React Native System Labs – Roadmap

## 📅 Milestones & Tasks

### Milestone 1: 0~3개월 – 기초 확립 (C++ & RN 내부)
**Goal:** C++ & RN New Architecture 코드 레벨 이해  
- [ ] C++ 스마트 포인터 실습 (`unique_ptr`, `shared_ptr`)  
- [ ] RN JSI 모듈 제작 (`add(int,int)` → JS 호출)  
- [ ] Hermes 빌드 & 성능 비교  
- [ ] Fabric Shadow Tree 분석  

📂 Output:  
- `/labs/cpp`, `/labs/jsi`  
- 블로그: *“C++ 메모리 관리와 RN JSI 관계”*  

---

### Milestone 2: 3~6개월 – 플랫폼 시스템 아키텍처
**Goal:** iOS/Android 내부 동작 원리 습득  
- [ ] iOS RunLoop & ARC 실습  
- [ ] GCD/OperationQueue 이미지 병렬 다운로드  
- [ ] Android Handler/Looper & Lifecycle 로그 실험  
- [ ] Doze 모드 실험 (AlarmManager vs WorkManager)  

📂 Output:  
- `/labs/ios`, `/labs/android`  
- 블로그: *“GCD vs RN JS Thread 모델”*, *“Doze 모드와 RN Background Job”*  

---

### Milestone 3: 6~9개월 – 네이티브 확장 & 동시성 기초
**Goal:** RN 모듈 ↔ Swift/Kotlin Concurrency 연동  
- [ ] Swift async/await → RN iOS 모듈 연동  
- [ ] Kotlin Coroutines → RN Android 모듈 연동  
- [ ] RN Image 렌더링 최적화 실험 (PNG/JPEG/WebP/HEIC 비교)  

📂 Output:  
- `/labs/concurrency`, `/labs/rendering`  
- 블로그: *“RN 이미지 렌더링 최적화 가이드”*  

---

### Milestone 4: 9~12개월 – 심화 & 리드 역량
**Goal:** Actor/Coroutine 심화 + 아키텍처 리드  
- [ ] Swift Actor 기반 thread-safe 데이터 스토어  
- [ ] Kotlin Flow/StateFlow & Channel 실험  
- [ ] RN Monorepo + CI/CD 세팅  
- [ ] Crashlytics & Perfetto 성능 모니터링 적용  

📂 Output:  
- `/labs/architecture`, `/labs/ci-cd`  

---

## 🏃 주간 학습 루프
1. **Input** (Mon–Tue) → 문서/책/강의  
2. **Experiment** (Wed–Thu) → 실습 과제 & 변형  
3. **Commit** (Fri) → 코드 & 기록을 Repo에 업로드  
4. **Output** (Weekend) → 블로그/노션에 아키텍처 노트 작성  
5. **Review** (매월 마지막 주) → Milestone 진행 상황 점검  

---

## 📊 관리 규칙
- Milestone = 분기별 큰 목표  
- Issue = 세부 학습 과제  
- Label = ios / android / cpp / rn-core / optimization / architecture  
- Project Board = 진행 현황 시각화 (Todo → In Progress → Done)  

---
