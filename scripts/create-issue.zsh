#!/usr/bin/env zsh

# GitHub Issue 생성 스크립트
# 사용법: ./create-issue.zsh

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 헬퍼 함수
print_success() {
    echo "${GREEN}✓${NC} $1"
}

print_error() {
    echo "${RED}✗${NC} $1"
}

print_info() {
    echo "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo "${YELLOW}⚠${NC} $1"
}

# GitHub 인증 확인
check_gh_auth() {
    if ! gh auth status &>/dev/null; then
        print_error "GitHub CLI 인증이 필요합니다."
        echo "다음 명령어를 실행하세요: ${YELLOW}gh auth login${NC}"
        exit 1
    fi
}

# 저장소 확인
check_repo() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_error "Git 저장소가 아닙니다."
        exit 1
    fi
}

# 이슈 목록 정의
define_issues() {
    # 형식: "type|title|milestone|labels|body"
    # 각 이슈는 한 줄로 정의, body 내 개행은 \n으로 표현
    cat <<'EOF'
    [Experiment]|Detox E2E 테스트 구축|4. deep dive|experiment|## 🎯 Goal\nDetox를 활용한 E2E 테스트 환경 구축\n\n---\n\n## 🔨 Steps\n1. Detox 설정 및 구성\n2. 주요 시나리오 테스트 작성\n3. CI/CD 파이프라인 통합\n4. 테스트 자동화 및 리포팅\n\n---\n\n## 📊 Result\n- 안정적인 E2E 테스트 자동화 시스템\n- CI/CD 통합 완료\n- 코드 예제: `/labs/e2e/`\n\n---\n\n## 📚 Learning\n- Detox의 강력한 테스트 기능\n- E2E 테스트 베스트 프랙티스
EOF
}

# 이슈 일괄 생성
create_all_issues() {
    print_info "정의된 이슈들을 생성합니다...\n"

    local issue_count=0
    local success_count=0

    while IFS='|' read -r type title milestone labels body; do
        # 빈 줄 건너뛰기
        if [[ -z $type ]]; then
            continue
        fi

        ((issue_count++))

        local full_title="$type $title"
        local gh_args=(issue create --title "$full_title")

        # 본문 추가 (이스케이프된 \n을 실제 개행으로 변환)
        if [[ -n $body ]]; then
            local formatted_body="${body//\\n/$'\n'}"
            gh_args+=(--body "$formatted_body")
        fi

        # 마일스톤 추가
        if [[ -n $milestone && $milestone != "null" ]]; then
            gh_args+=(--milestone "$milestone")
        fi

        # 라벨 추가
        if [[ -n $labels && $labels != "null" ]]; then
            gh_args+=(--label "$labels")
        fi

        print_info "생성 중: $full_title"

        local gh_output
        if gh_output=$(gh "${gh_args[@]}" 2>&1); then
            print_success "✓ $full_title"
            ((success_count++))
        else
            print_error "✗ $full_title"
            echo "  ${RED}에러:${NC} $gh_output"
        fi

        # Rate limit 방지
        sleep 1
    done <<< "$(define_issues)"

    echo ""
    print_success "완료: $success_count/$issue_count 개의 이슈가 생성되었습니다."
}

# 메인 함수
main() {
    check_gh_auth
    check_repo

    if [[ $# -eq 0 ]]; then
        # 기본 동작: 정의된 이슈들을 모두 생성
        create_all_issues
    else
        case $1 in
            --help|-h)
                echo "사용법:"
                echo "  $0           # 정의된 모든 이슈 생성"
                echo "  $0 --help    # 도움말"
                exit 0
                ;;
            *)
                print_error "알 수 없는 옵션: $1"
                echo "사용법: $0 [--help]"
                exit 1
                ;;
        esac
    fi
}

main "$@"
