# korean.pl
# UseModWiki language pack for Korean language
# by gypark < raymundo AT kebi.com >

# 한국어 언어팩입니다.
# 아래에 나열된 번역문 중 일부는  Luke 님의 한글 패치로부터,
# 일부는 danny 님의 패치로부터 가져오고 나머지는 직접 수정했습니다.

# 이 화일을 위키위키가 설치된 디렉토리에 두고, config.pl 화일 마지막에
#
#             do "./korean.pl";
#
# 과 같이 적어주시면 됩니다. (왼쪽의 #은 제거하세요)

%Translate = split('\n',<<END_OF_TRANSLATION);
Could not create %s
%s 를 생성할 수 없습니다
Showing revision %s
%s 번째 수정본
Revision %s not available
%s 번째 수정본을 찾을 수 없습니다.
showing current revision instead
최종본을 대신 보여드립니다
Updates since %s
%s 이후부터의 변경
Updates in the last %s day
지난 %s 일 전 이후부터의 변경
Updates in the last %s days
지난 %s 일 전 이후부터의 변경
Could not open %s log file
%s 의 로그 화일을 열 수 없습니다
Error was
다음 에러가 발생했습니다
Note: This error is normal if no changes have been made.
유의: 페이지 생성이나 수정이 전혀 이뤄지지 않은 상태라면 이 에러가 발생하는 것은 정상입니다.
Could not open old %s log file
%s 의 이전 로그 화일을 열 수 없습니다.
for %s only

%s day
%s 일전
%s days
%s 일전
List new changes starting from
이 날 이후의 변경 리스트 보기:
No updates since %s
%s 이후부터 변경 내용이 없습니다.
Page generated %s
페이지 생성일자: %s
(edit)
(수정)
(diff)
(변경사항)
(diff [d])
(변경사항 [d])
changes
번 변경됨
History of %s
"%s" 페이지의 변경 내역
Revision %s
%s 번째 수정본
View
보기
Edit
수정
Diff
변경사항
by
수정한 사람:
Preferences
환경설정
Random Page
오늘의 페이지
ID %s

from %s

[Home]
[첫화면으로]
redirected from %s
%s 페이지로부터 자동으로 이동
Edit revision %s of this page
%s 번째 수정본 편집
Edit text of this page
이 페이지를 수정
This page is read-only
이 페이지는 수정이 불가능합니다
View other revisions
다른 수정본 보기
View current revision
현재 수정본 보기
Last edited
마지막 편집일:
Edited
이 수정본 편집일:
Warning
경고
Database is stored in temporary directory %s
데이타베이스가 임시 디렉토리 %s 에 저장됩니다.
Search:
검색:
Your browser should go to the %s page.
%s 페이지로 이동해야 합니다.
If it does not, click %s to continue.
제대로 이동하지 않는다면, %s 를 클릭하세요.
Thanks for editing...

Thank you for editing %s.

Link to another page...
다른 페이지로 링크되어 있습니다...
Follow the %s link to continue.
계속하시려면 다음 링크를 클릭하세요: %s
alternate

search

major diff
일반적인 수정
minor diff
소소한 수정
author diff
다른 사용자에 의한 수정
major
일반적인
minor
소소한
author
다른 사용자에 의한
(The revisions are identical or unavailable.)
(두 수정본의 내용이 동일하거나, 수정본을 비교할 수 없음.)
no other diffs
다른 변경사항 없음
No diff available.
변경사항 없음.
Difference (from revision %s to current revision)
변경사항 (%s 번째 버전부터 현재 버전까지)
No diff available--this is the first %s revision.
변경사항 없음--이것이 첫번째 %s 버전임.
Difference (from prior %s revision)
변경사항 (가장 최근의 "%s 수정"부터)
Changed:
변경:
Removed:
삭제:
Added:
추가:
Describe the new page here.
페이지의 내용을 작성하세요.
Bad page version (or corrupt page).
페이지 버전이 잘못되었거나, 페이지가 손상되었음.
cant write %s
%s 를 기록할 수 없습니다.
Page name is too long: %s
페이지 이름이 너무 깁니다: %s
Page name may not contain space characters: %s
페이지 이름에 공백이 들어가 있습니다: %s
Too many / characters in page %s
페이지 이름에 슬래쉬가 너무 많습니다: %s
Invalid Page %s (subpage without main page)
잘못된 페이지: %s (메인 페이지 이름이 없음)
Invalid Page %s (missing subpage name)
잘못된 페이지: %s (하위 페이지 이름이 없음)
Invalid Page %s (/ not allowed)
잘못된 페이지: %s (슬래쉬(/)는 허용되지 않음)
Invalid Page %s
잘못된 페이지: %s
Invalid Page %s (must not end with .db)
잘못된 페이지: %s (.db 로 끝나면 안 됨)
Invalid Page %s (must not end with .lck)
잘못된 페이지: %s (.lck 로 끝나면 안 됨)
can not make %s
%s 를 만들 수 없습니다.
Can not open %s
%s 를 열 수 없습니다.
Invalid action parameter %s
잘못된 action 파라메터: %s
Invalid URL.
잘못된 URL입니다.
Editing Denied
수정 불가
Editing not allowed: user, ip, or network is blocked.
수정할 수 없습니다: 사용자, IP주소, 또는 네트웍이 차단되었습니다.
Contact the wiki administrator for more information.
자세한 사항은 위키 관리자에게 문의하세요.
Editing not allowed: %s is read-only.
수정할 수 없습니다: %s 는 읽기 전용 페이지입니다.
Editing %s
%s 페이지를 편집 중
Editing revision %s of
%s 번째 수정본을 편집 중 : 
Editing old revision %s.
%s 번째 수정본을 편집중입니다.
Saving this page will replace the latest revision with this text.
이 페이지를 저장하면 페이지 최종본을 덮어쓰게 됩니다.
Edit Conflict!
다른 사용자가 이미 페이지를 수정해버렸습니다!
(This is a new conflict)
(또다시 충돌이 발생했습니다)
Someone saved this page after you started editing.
귀하가 페이지 편집을 시작한 이후에 다른 사용자가 이 페이지의 내용을 수정하여 저장했습니다.
The top textbox contains the saved text.
아래 보이는 첫번째 편집창에 새로 저장된 내용이 있습니다.
Only the text in the top textbox will be saved.
저장 버튼을 누르면 첫번째 편집창에 있는 내용이 저장됩니다.
Scroll down to see your edited text.
창을 아래로 스크롤하면 귀하가 작성한 내용을 볼 수 있습니다.
Last save time:
마지막 저장 시각:
Current time is:
현재 시각:
Summary:
변경사항요약:
This change is a minor edit.
소소한 수정(minor edit)인 경우 체크.
Send email notification that %s has been changed.
%s 페이지가 변경되면 메일로 알림.
Save
저장
Your user name is
현재 사용자 이름 : 
Visit %s to set your user name.
사용자 이름을 등록하려면 %s 을 클릭하세요.
Preview
미리 보기
This is the text you submitted:
다음은 귀하가 작성한 내용입니다:
Preview:
미리 보기:
NOTE: This preview shows the revision of the other author.
주의: 이 미리보기에서 보이는 것은 다른 사용자가 수정한 내용입니다.
Preview only, not yet saved
위에 보이는 것은 미리보기입니다. 아직 저장되지 않았습니다.
Editing Preferences
환경설정
User Information:
사용자 정보:
Your User ID number: %s
사용자 ID 번호: %s
UserName:
사용자 이름:
(blank to remove, or valid page name)
(삭제하려면 공란으로 남겨두세요)
Set Password:
암호 설정:
(blank to remove password)
(암호를 제거하려면 공란으로 남겨두세요)
Passwords allow sharing preferences between multiple systems.
암호를 사용하면 시스템을 옮겨 다니면서 동일한 환경을 사용할 수 있습니다.
Passwords are completely optional.
암호는 선택사항입니다.
Administrator Password:
관리자 암호:
(Administrator passwords are used for special maintenance.)
(관리자 암호는 특별한 관리를 위해 사용됩니다.)
Include this address in the site email list.
아래의 주소를 사이트 이메일 리스트에 포함합니다.
(Uncheck the box to remove the address.)
(주소를 제거하려면 왼쪽의 체크를 없애세요.)
Email Address:
이메일 주소:
Default days to display:
최근 몇 일 동안의 변경내역을 출력할까요:
Most recent changes on top
가장 최근 변경을 제일 위에 출력
Show all changes (not just most recent)
각 페이지의 모든 변경 내역을 출력 (체크하지 않을 경우, 가장 최근 변경만 출력)
Hide minor edits
감춤
Show minor edits
보여줌
Show only minor edits
소소한 수정만 보여줌
Minor edit display:
소소한 수정(minor edit) 출력:
Use "changes" as link to history
"~번 변경됨"을 클릭하면 변경내역 보기로 이동
Differences:
변경된 내용 보기:
Show (diff) links on %s
%s 에 (변경사항) 링크 표시
Show differences on all pages
페이지를 볼 때 페이지의 최근변경 사항을 항상 표시
No differences on %s
%s 페이지는 예외
Major
일반적인 수정 (Major Edit)
Minor
소소한 수정 (Minor Edit)
Author
다른 사용자에 의한 수정 (Author)
Default difference type:
기본적으로 다음 변경사항을 기준으로 보여줌:
Misc:
기타 설정:
Server time:
현재 서버 시각:
Time Zone offset (hours):
사용자의 표준 시간대 (서버 시각과 차이. 시간 단위):
Use 100% wide edit area (if supported)
편집창을 브라우저 창 폭에 맞춰 최대한 넓게 사용
Edit area rows:
편집창의 행 수:
columns:
열 수:
Show link bar on top
화면 상단에 메뉴를 보임 (주의: 이 옵션을 해제하면 상단의 메뉴바가 사라져 버립니다. 웬만하면 건드리지 마세요!)
Add "Random Page" link to link bar
"오늘의 페이지" 링크를 메뉴에 포함
Saving Preferences
환경설정 저장
Invalid UserID %s, preferences not saved.
%s 는 잘못된 사용자ID입니다. 환경설정이 저장되지 않았습니다.
(Preferences require cookies, but no cookie was sent.)
환경설정을 보관하기 위해서는 쿠키가 필요합니다. 쿠키가 전송되지 않았습니다.
UserName removed.
사용자 이름이 삭제되었습니다.
Invalid UserName %s: not saved.
%s 는 잘못된 사용자ID입니다: 저장하지 않음.
UserName must be 50 characters or less. (not saved)
사용자명은 50글자를 넘을 수 없습니다: 저장하지 않음.
UserName %s saved.
사용자명 %s 을 저장했음.
Password removed.
사용자 암호 지움.
Password changed.
사용자 암호 변경.
Administrator password removed.
관리자 암호 지움.
Administrator password changed.
관리자 암호 변경.
User has administrative abilities.
사용자에게 관리자 권한이 부여되었습니다.
User has editor abilities.
사용자에게 편집자 권한이 부여되었습니다.
User does not have administrative abilities.
사용자에게는 관리자 권한이 없음.
(Password does not match administrative password(s).)
(관리자 암호가 일치하지 않음.)
Local time:
현재 지역 시각:
Preferences saved.
사용자 설정이 저장되었습니다.
Could not read from %s:
%s 를 읽을 수 없습니다:
Could not get mail lock
메일에 대한 락을 획득할 수 없습니다:
Could not append to %s:
%s 에 덧붙여 쓸 수 없습니다:
Could not overwrite %s:
%s 를 덮어쓸 수 없습니다:
Index of all pages
모든 페이지 목록
Login
로그인
User ID number:
사용자 ID 번호:
Password:
사용자 암호:
Login Results
로그인 결과
Login for user ID %s complete.
사용자 %s 의 로그인에 성공하였습니다.
Login for user ID %s failed.
사용자 %s 의 로그인에 실패하였습니다.
Could not get user-ID lock
사용자ID 에 대한 락을 획득할 수 없습니다.
Search for: %s
검색결과 : %s
%s pages found:
페이지 수 : %s
Full Link List
전체 링크 목록
Editing not allowed for %s.

SampleUndefinedPage

%s cannot be defined.

Sample_Undefined_Page

[[%s]] cannot be defined.

Could not get editing lock

Normal Unlock.

Removing edit lock
페이지 수정시 생성된 락 제거
This operation may take several seconds...

Forced Unlock.

%s log error:

can not write diff_log
diff_log 를 기록할 수 없습니다.
Maintenance on all pages
전체 페이지 보수
Maintenance not done.

(Maintenance can only be done once every 12 hours.)

Remove the "maintain" file or wait.

Could not get maintain-lock

Processing rename/delete commands:
페이지 이름변경/삭제 명령 처리중:
This operation is restricted to site editors only...
편집자 권한이 있어야 수행할 수 있는 명령입니다...
This operation is restricted to administrators only...
관리자 권한이 있어야 수행할 수 있는 명령입니다...
Set or Remove global edit lock
전체 사이트 수정금지 설정 또는 해제
Edit lock created.
사이트 수정금지가 설정되었습니다.
Edit lock removed.
사이트 수정금지가 해제되었습니다.
Set or Remove page edit lock
페이지 수정금지 설정 또는 해제
Missing page id to lock/unlock...
수정금지 또는 해제할 페이지 이름이 누락되었습니다...
Lock for %s created.
%s 페이지에 대한 수정금지가 설정되었습니다.
Lock for %s removed.
%s 페이지에 대한 수정금지가 해제되었습니다.
########## appended for UseModWiki K3 (Korean characters support)  ##########
########## DO NOT insert any blank line below this line            ##########
History
변경내역 보기
Index
페이지목록
Admin
관리
Links
링크
Logout
로그아웃
Logout Results
로그아웃 결과
Logout for user ID %s complete.
사용자 %s 의 로그아웃이 완료되었습니다.
Open in a New Window
새 창으로 열기
Popup Preview
미리 보기
Compare
변경 비교
Current Revision
현재 버전
(Difference from %s
(%s부터
to %s)
%s까지의 변경사항)
Create new UserName
새로 등록하기
lock
잠금
unlock
해제
(locked)
(잠겼음)
(read-only)
(읽기전용)
Editing/Deleting page titles:
페이지 제목 변경 또는 페이지 삭제
Enter one command on each line.  Commands are:
한 줄에 한 명령씩 입력하시오. 명령은 다음과 같습니다:
<tt>!PageName</tt> -- deletes the page called PageName
<tt>!페이지명</tt> -- '페이지명'에 해당하는 페이지 삭제
<tt>=OldPageName=NewPageName</tt> -- Renames OldPageName
<tt>=이전페이지명=새페이지명</tt> -- '이전페이지명'을 '새페이지명'으로 변경.
to NewPageName and updates links to OldPageName.
'이전페이지명'을 갖는 모든 링크 변경
<tt>|OldPageName|NewPageName</tt> -- Changes links to OldPageName to NewPageName.
<tt>|이전페이지명|새페이지명</tt> -- '이전페이지명'을 참조하는 모든 링크를 '새페이지명'으로 변경
(Used to rename links to non-existing pages.)
(존재하지 않는 페이지로 향하는 링크를 수정할 때 사용.)
Main Page:
상위페이지:
Create a new page : %s
새로운 페이지 만들기 : %s
Go
바로 가기
Edit %s
%s 갱신
Substitute text for rename
제목 변경을 위해 본문도 치환 (원문: Substitute text for rename)
Finished command list.
명령 수행을 완료했습니다.
Updating Links
링크 갱신
Editing Links
링크 변경
Delete-Page: page %s is invalid
페이지 삭제: %s 는 올바른 페이지가 아닙니다
error is: %s
다음 에러가 발생했습니다: %s
Return to %s
%s 페이지로 돌아가기
Top
처음으로
Bottom
마지막으로
Error: Can not update prefs. That ID already exists and does not match your ID.
에러: 이미 존재하는 아이디입니다. 설정을 저장할 수 없습니다.
RecentChanges
최근변경내역
Su
일
Mo
월
Tu
화
We
수
Th
목
Fr
금
Sa
토
Displaying Wiki Version
위키 버전 정보
UserName must be 4 characters or more. (not saved)
사용자명은 영문 4자 또는 한글 2자 이상이어야 합니다: 저장하지 않음.
Try Again
다시 시도
Login completed
로그인 성공
Login failed
로그인 실패
Links to %s
%s 의 역링크
No reverse link.
역링크가 없습니다.
%s includes external page
%s 페이지는 외부의 페이지를 표시합니다.
You need the web browser which supports frame tag.
이 페이지를 보려면, 프레임을 볼 수 있는 브라우저가 필요합니다.
Keep login information
자동 로그인 사용
Update my bookmark timestamp
북마크 타임스탬프 갱신
currently set to %s
현재는 %s 으로 설정되어 있음
set bookmark
북마크 지정
cant create directory %s
%s 디렉토리를 생성할 수 없습니다
Editing Help :
편집 도움말 :
Make Page
페이지 만들기
Text Formatting
문장 구성
Link and Image
링크와 이미지
Table
표 만들기
Macro
매크로
Emoticon
이모티콘
View revision %s of this page
%s 번째 수정본 소스 보기
View text of this page
페이지 소스 보기
Viewing %s
%s 페이지의 소스 보기
Viewing revision %s of
%s 번째 수정본 소스 보기 :
%s hit

%s hits

This is the difference between the saved text and your text:
다음은 저장된 내용과 귀하가 작성한 내용 중 서로 다른 부분입니다:
Go to the on-line bookstore
온라인 서점으로 이동
Upload File
화일 업로드
Upload completed successfully
업로드가 성공적으로 끝났습니다
Invalid filename
화일 이름이 올바르지 않습니다
You can not upload html or any executable scripts
html 또는 실행 스크립트는 올릴 수 없습니다
File is too large
화일이 너무 큽니다
File has no content
화일의 내용이 없습니다
Failed to get lock
업로드를 위한 lock 을 얻지 못했습니다
Following is the Interlink of your file
다음 주소를 복사해서 사용하세요
Uploading is not allowed
업로드가 허용되지 않습니다
Select the file you want to upload
업로드할 화일을 선택하세요
File must be smaller than %s MB
화일 크기는 %s MB 이하여야 합니다.
Upload
업로드
cant opening %s
%s 를 열 수 없습니다
Delete
삭제
File Name
화일명
Size (byte)
크기 (byte)
Date
날짜
Total %s files
전체 화일 갯수 : %s
Delete Checked Files
선택한 화일 삭제
Delete Uploaded Files
업로드한 화일 삭제
Deleting is not allowed
화일 삭제가 허용되지 않습니다
%s is deleted successfully
%s 화일이 삭제되었습니다
%s can not be deleted
%s 화일을 삭제할 수 없습니다
Oekaki
오에카키
Oekaki is not allowed
오에카키를 사용하는 것이 허용되지 않습니다
If saving oekaki was done successfully
그림이 제대로 저장되었다면
If you want to paint a new picture
또다른 그림을 그리고 싶다면
If the picture above is not what you had painted, find your picture from the follwing list
위에 있는 그림이 귀하가 그린 것이 아니라면, 아래의 목록에서 그림을 찾아 보세요
Oekaki paint
오에카키 그리기
Oekaki save
오에카키 저장
Oekaki exit
오에카키 종료
Add to my interest list
관심있는 페이지로 등록
Remove from interest list
관심있는 페이지에서 제거
Fail to access Interest Page List
관심있는 페이지 목록 수정 실패
You must login to do this action
이 명령을 수행하기 위해서는 로그인을 해야 합니다
Add a page to Interest Page List
관심있는 페이지 목록에 추가
Remove a page from Interest Page List
관심있는 페이지 목록에서 제거
Page %s does not exist
%s 페이지가 존재하지 않습니다
Page %s is added to your Interest Page List
%s 페이지를 관심있는 페이지 목록에 추가했습니다
Page %s is removed from your Interest Page List
%s 페이지를 관심있는 페이지 목록에서 제거했습니다
Interesting Page
관심있는 페이지
(hidden)
(숨겨짐)
hide
숨김
unhide
드러냄
Hide or Unhide page
페이지 숨김 설정 또는 해제
Missing page id to hide/unhide
숨김 또는 해제할 페이지 이름이 누락되었습니다...
%s is hidden.
%s 페이지의 숨김 속성을 설정했습니다.
%s is revealed.
%s 페이지의 숨김 속성을 제거했습니다.
%s is a hidden page
%s 는 관리자가 감춘 페이지입니다.
Hiding/Unhiding page failed
페이지 감춤/드러냄 명령에 실패했습니다
Name
이름
Comment
내용
Submit
달기
Comment is not allowed
글 달기가 허용되지 않습니다
Footnote
각주
Send Trackback
트랙백 주고받기
Send Trackback Ping of this page to:
이 페이지의 트랙백 핑을 다음 주소로 보냄:
Trackback URL:
트랙백 URL:
Permalink URL (optional):
해당 글의 URL (선택사항):
Send Ping
트랙백 핑 보내기
You are not allowed to send Trackback ping of this page
이 페이지의 트랙백 핑을 보낼 권한이 없습니다
No Ping URL
트랙백 핑을 받을 주소가 없습니다
New Trackback Sent
트랙백 핑을 보냄
Error occurred: %s
에러가 발생했습니다: %s
Send Trackback Ping
트랙백 핑 보내기
Ping successfully sent
핑을 보내는 데 성공했습니다
Trackback address of this page:
이 페이지의 트랙백 주소:
Copy
복사
Copy the address to the clipboard.
이 주소를 클립보드에 복사합니다.
This page can not receive Trackback
이 페이지로는 트랙백을 보낼 수 없습니다
Trackback from %s
%s 로부터의 트랙백
Title:
제목:
Content:
내용:
New Trackback Received
트랙백 핑을 받음
No Trackback sent
보낸 트랙백 없음
Trackback sent [%s]
보낸 트랙백 [%s]
No Trackback received
받은 트랙백 없음
Trackback received [%s]
받은 트랙백 [%s]
Write New Thread
새 글 쓰기
Write Comment
위 글에 의견달기
Prev
이전
Next
다음
TOC
목차
Up
위
Index:
찾아보기:
Admin Menu
관리자 메뉴
Editing Banned list
접근 차단 목록 수정
Lock Site
사이트 수정금지
Unlock Site
사이트 수정금지 해제
Editing not allowed: text includes banned text
수정할 수 없습니다: 금지된 단어가 포함되어 있습니다
(Copy the text, go back with your browser, paste the text, and edit again please)
(아래 텍스트를 복사하고, 브라우저의 뒤로 가기를 사용하여, 이전 화면에 붙여놓고 다시 편집해 주시기 바랍니다)
Editing Banned text
등록 금지 단어 목록 수정
Updating Banned text
등록 금지 단어 목록 갱신
Title will be converted into [[/Title]] automatically.
제목은 자동으로 [[/제목]]의 형식으로 변환됩니다.
Monthly View
월별 보기
If you leave current page, the contents you are writing will not be stored.
이 페이지를 벗어나면 작성중이던 글이 지워집니다.
Replace strings in all pages
모든 페이지의 문자열 일괄 치환
(section)
(부분)
END_OF_TRANSLATION
