#!/bin/sh
# 사용법: sh publish.sh 내깃허브아이디
# 이 폴더의 LNB 목업을 내 GitHub Pages 저장소(아이디.github.io)의 lnb_mockup/ 폴더로 올리고 공유 링크를 출력합니다.
# 필요: git, GitHub 로그인(HTTPS 토큰 또는 SSH 키). gh CLI가 있으면 저장소가 없을 때 자동으로 만듭니다.
set -e
U="$1"
if [ -z "$U" ]; then echo "사용법: sh publish.sh 내깃허브아이디"; exit 1; fi
SRC="$(cd "$(dirname "$0")" && pwd)"
REPO="$U.github.io"
DIR="lnb_mockup"
WORK="${TMPDIR:-/tmp}/lnb_publish_$$"

mkdir -p "$WORK"
echo "▶ $REPO 저장소 받는 중..."
if git clone --depth 1 "https://github.com/$U/$REPO.git" "$WORK/repo" 2>/dev/null; then
  :
elif command -v gh >/dev/null 2>&1; then
  echo "▶ 저장소가 없어 새로 만듭니다 (gh)"
  gh repo create "$REPO" --public -y >/dev/null
  git clone "https://github.com/$U/$REPO.git" "$WORK/repo"
else
  echo "✗ https://github.com/$U/$REPO 저장소를 찾지 못했습니다."
  echo "  GitHub에서 '$REPO' 이름으로 Public 저장소를 먼저 만든 뒤 다시 실행해 주세요."
  exit 1
fi

cd "$WORK/repo"
rm -rf "$DIR" && mkdir "$DIR"
cp "$SRC/index.html" "$DIR/"
[ -f index.html ] || [ -f index.md ] || [ -f README.md ] || echo "# $U.github.io" > README.md
[ -f .nojekyll ] || touch .nojekyll

git add -A
if git diff --cached --quiet; then
  echo "▶ 바뀐 내용이 없습니다."
else
  git commit -q -m "Update LNB mockup (A-1 ~ D-3)"
  echo "▶ GitHub에 올리는 중..."
  git push -q origin HEAD
fi
cd / && rm -rf "$WORK"

URL="https://$U.github.io/$DIR/"
echo ""
echo "✓ 완료. 1~2분 뒤 열립니다."
echo "  공유 링크: $URL"
echo "  시안 바로가기 예: ${URL}#C-2"
command -v pbcopy >/dev/null 2>&1 && printf "%s" "$URL" | pbcopy && echo "  (클립보드에 복사했습니다)"
command -v open >/dev/null 2>&1 && (sleep 90; open "$URL") >/dev/null 2>&1 &
exit 0
