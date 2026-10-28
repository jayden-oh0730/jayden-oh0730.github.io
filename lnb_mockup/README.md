# 모먼트관리자센터 LNB 개선 목업

소재 만들기 화면 기준 LNB 시안 목업입니다. 화면 하단 스위치(또는 키보드 ←/→)로 시안을 넘겨 볼 수 있습니다.

시안: A-1(기준) · A-2 · B-1 · B-2 · C-1 · C-2 · D-1 · D-2 · D-3
특정 시안 링크는 주소 끝에 `#C-2`처럼 붙이면 됩니다.

## GitHub Pages로 공유하기

Mac 터미널에서 실행합니다.

```sh
sh ~/Desktop/"LNB 개선"/lnb_mockup/publish.sh 내깃허브아이디
```

`아이디.github.io` 저장소의 `lnb_mockup/` 폴더에 올라가고, `https://아이디.github.io/lnb_mockup/` 링크가 출력·복사됩니다.
처음이라면 GitHub에서 `아이디.github.io` 이름의 Public 저장소를 먼저 만들어 주세요(gh CLI가 있으면 자동 생성).

## 파일

- `index.html`: 목업 본문(아이콘·스타일·스크립트 포함 단일 파일)
- `publish.sh`: GitHub Pages 업로드 스크립트
- `lnb_mockup.zip`: 메일·메신저로 파일째 보낼 때 쓰는 압축본

## 공개 범위

GitHub Pages(무료 플랜)는 링크를 아는 누구나 열 수 있습니다. 검색엔진 색인 차단(noindex)은 넣어 두었지만, 사내 서비스 화면 목업이므로 사내 공개 기준을 확인한 뒤 올려 주세요.
