package UseModWiki;

@HelpItem = (
	"Make Page",		# 0
	"Text Formatting",	# 1
	"Link and Image",	# 2
	"Table",		# 3
	"Macro",			# 4
	"Emoticon",			# 5
	);


########### Make Page

$HelpText[0] = qq(
=== 한글이름페이지 ===

한글페이지이름 만드는 법입니다.

이렇게 편집 창에 입력하면... <nowiki>[[새한글이름]] [[한글이름페이지]]</nowiki>

* 새한글이름<font color="blue">?</font> 또는 <font color="blue"><b>새</b></font>한글이름
** 기존 페이지가 없는 경우 물음표가 생기거나, 첫글자가 굵게 표시가 됩니다. (후자는 환경설정에서 "내용이 없는 페이지의 이름 첫 글자에 링크를 만듦"에 체크한 경우) 물음표 또는 첫 글자를 클릭하면 새페이지 창이 열립니다.
* <font color="blue">한글이름페이지</font>
** 이미 페이지가 있으면 자동으로 링크가 생깁니다.

=== 영어이름페이지 ===

1. 페이지 이름으로 쓰고자 하는 영어를 공백없이 씁니다. 이때 대소문자를 섞어서 쓰면 자동으로 물음표가 생깁니다. 이 페이지 이름이 이미 있다면 물음표는 생기지 않습니다.

편집창에 <nowiki>NewPage WikiSandBox</nowiki>라고 입력하면 다음과 같이 표시됩니다.

* <nowiki>NewPage</nowiki><font color="blue">?</font> 또는 <font color="blue"><b>N</b></font>ewPage
** 현재 존재하지 않는 페이지
* <font color="blue"><nowiki>WikiSandBox</nowiki></font>
** 이미 있는 페이지

이때 물음표 또는 첫 글자를 클릭하면 새 페이지 편집창이 생깁니다. 이 페이지이름은 'a href=' 이런표시 없이 그냥 쓰기만 해도 어디서나 자동으로 링크가 되어 바로 이동할 수 있습니다. 이것이 위키의 큰 장점입니다.

2. 대소문자를 섞어쓰지 않는 경우, 즉 모두 소문자거나 모두 대문자인 경우는 자동으로 물음표가 생기지 않습니다. 이런 경우는 한글 이름 페이지와 같이 두개의 꺽쇠"[[", "]]"로 묶어줍니다. 또한 이미 페이지가 있다고 해도 자동링크가 되지 않으니 링크를 하고 싶으면 역시 이중 꺽쇠로 둘러쌓아야 합니다. 보통 로그인시 아이디는 링크하기 편하라고 소문자로만 써주고, 다른 페이지 이름들은 대소문자 섞어 쓰는 것이 자동링크 만들기가 좋습니다.

편집할 때 <nowiki>ika tommy [[ika]] [[tommy]]</nowiki> 식으로 입력하면 다음과 같은 형태로 보입니다.

* ika <- 대소문자 섞어쓰지 않았기 때문에 꺽쇠없이는 이미 페이지가 있어도 자동링크가 되지 않습니다.
* tommy <- 대소문자 섞어쓰지 않았기 때문에 꺽쇠없이는 새페이지가 만들어지지 않습니다.
* <font color="blue">ika</font> <- 기존페이지가 이미 있기 때문에 자동링크가 생깁니다.
* tommy<font color="blue">?</font> <- 기존페이지가 없기 때문에 물음표가 있습니다. 물음표를 누르면 새페이지가 생깁니다.

=== 하위페이지 만들기 ===

"/"를 하고 페이지 이름을 만들면 현재 편집하고 있는 문서 밑으로 페이지가 만들어집니다. 이 것을 확인하려면 위의 메뉴바에 있는 '페이지목록'을 눌러보시면 됩니다. 또한 하위페이지로 들어가면 메뉴바에 상위페이지이름이 보입니다. 

<nowiki>[[/연습페이지]]</nowiki>

라고 입력하면 [[/연습페이지]]라고 보입니다. 그러면 이 페이지의 주소는 '현재편집중인페이지/연습페이지'라는 이름을 갖게 됩니다.
);

########### Text Formatting

$HelpText[1] = qq|
=== 글자 장식 ===

UseModWiki는 "따옴표(')"를 사용합니다. (html도 사용할 수 있지만, 다른 위키에서도 쓰이는 방법이니 될 수 있으면 이 방법을 익히세요.)

이렇게 입력하면

*<nowiki>''한개 따옴표(') 두개로 이탤릭체 만들기''</nowiki>
*<nowiki>'''한개 따옴표(') 세개로 굵게 만들기'''</nowiki>
*<nowiki>'''''한개 따옴표(') 다섯개로 굵은 이탤릭체 만들기'''''</nowiki>

미리 보기나 저장을 했을때 이렇게 보입니다.

*''한개 따옴표(') 두개로 이탤릭체 만들기''
*'''한개 따옴표(') 세개로 굵게 만들기'''
*'''''한개 따옴표(') 다섯개로 굵은 이탤릭체 만들기'''''

=== 제목줄 쓰기 ===

제목(Heading)은 1~6개의 이퀄표시(=)로 이루어집니다. 이것은 HTML &lt;h1&gt; - &lt;h6&gt; 태그에 상응합니다. 이퀄표시를 시작할 때는 왼쪽부터 빈칸없이 딱 붙여서 시작하시고 이퀄표시와 제목글과는 빈칸을 한칸씩 두어야 합니다. 아래 예제를 잘 보세요.

= = Headline size 1 = =
== == Headline size 2 == ==
=== === Headline size 3 === ===
==== ==== Headline size 4 ==== ====
===== ===== Headline size 5 ===== =====
====== ====== Headline size 6 ====== =====

'''제목이 나타나지 않는 경우 다음을 살펴보세요.'''
* 좌우 이퀄표시 개수가 똑같아야합니다.
* 왼쪽에 빈칸없이 이퀄표시가 시작되어야 합니다.
* 이퀄과 안쪽 제목글과는 빈칸을 한칸씩 두어야 합니다.

=== 수평선 긋기 ===

수평선을 긋고 싶으면 '-'(빼기, 하이픈, 대시)를 왼쪽으로부터 딱 붙여서 4개 써주면 됩니다.

<nowiki>----</nowiki><br>
 ↑ 이렇게 쓰면

----
 ↑ 이렇게 보입니다.

=== 들여쓰기 ===

다른 위키(예를 들면 모인모인)에서는 스페이스 공백으로 들여쓰기를 하기도 하지만 UseModWiki에서는 그렇지 않습니다. 왼쪽에서 스페이스 한칸을 띄우면 pre 태그 안에 넣은 것과 같은 효과를 냅니다.

'''기본 들여쓰기 방법'''

이렇게 편집창에 쓰면

 : 한칸 들여 넣고 싶을 때
 :: 두칸 들여 넣고 싶을 때
 ::: 세칸 들여 넣고 싶을 때

미리 보기나 저장을 했을 때 이렇게 보입니다:

: 한칸 들여 넣고 싶을 때
:: 두칸 들여 넣고 싶을 때
::: 세칸 들여 넣고 싶을 때

=== Bullet 넣기 ===

이렇게 편집창에 쓰면

 * 한칸 들여쓰기
 ** 두칸 들여쓰기
 *** 세칸 들여쓰기

Preview나 Save 했을 때 이렇게 보입니다:

* 한칸 들여쓰기
** 두칸 들여쓰기
*** 세칸 들여쓰기

=== 숫자 리스트 ===

이렇게 편집창에 쓰면

 # 숫자리스트 한개 넣었을 때
 ## 숫자리스트를 두개 넣었을 때
 ### 숫자 리스트를 세개 넣었을 때
 ## 숫자리스트를 두개 넣었을 때

Preview나 Save 했을 때 이렇게 보입니다:

# 숫자리스트 한개 넣었을 때
## 숫자리스트를 두개 넣었을 때
### 숫자 리스트를 세개 넣었을 때
## 숫자리스트를 두개 넣었을 때

|;

########### Link and Image

$HelpText[2] = qq(
=== 이미지 넣기 ===

이미지는 그냥 주소만 쓰면 됩니다.

이렇게 쓰면 <nowiki>http://www.usemod.com/wiki.gif</nowiki>

http://www.usemod.com/wiki.gif 그림이 나옵니다.

=== 링크 넣기 ===

'''위키링크'''

* 대소문자 섞어 있는 이름은 페이지 이름만 써주면 됩니다. 예: WikiSandBox
* 대문자만, 혹은 소문자만 있는 이름과 한글이름페이지는 이중 꺽쇠를 둘러주세요. 예: <nowiki>[[ika]]</nowiki> -> [[ika]], <nowiki>[[방명록]]</nowiki> -> [[방명록]]
* 문서내의 특정 위치에 가기 위해서는 '#'을 사용합니다. 예: <nowiki>SandBox#test</nowiki>. 그리고 <nowiki>SandBox</nowiki>에서 위치 지정은 <nowiki>[#test]</nowiki> 으로 해 줍니다.

'''인터넷링크'''

*주소 그냥 쓰기
**<nowiki>http://www.yahoo.com</nowiki> -> http://www.yahoo.com

*주소에 라벨 붙이기 : Url과 라벨사이에 공백을 하나 두고 꺽쇠"[", "]"로 둘러 쌉니다.
**<nowiki>[http://www.yahoo.com Yahoo페이지로 이동]</nowiki> -> [http://www.yahoo.com Yahoo페이지로 이동]

'''메일주소넣기'''

메일주소를 자동링크시키려면 메일 앞에 <nowiki>mailto:</nowiki>를 넣어주세요.
* <nowiki>mailto:honggildong\@mail.net</nowiki>
이라고 쓰면  mailto:honggildong\@mail.net 라고 자동링크되어 클릭만 하면 메일창이 뜹니다.

'''인터위키 링크'''

* <nowiki>NoSmok:TextFormatting</nowiki>
NoSmok:TextFormatting

=== 책소개 넣기 ===

좋아하는 책이나, 참고할 책에 대해 즐겨찾기를 하고 싶으면 이 방법을 이용하세요.  책마다 고유의 ISBN(International Standard Book Number)가 있습니다. 이 것을 인터넷 서점 등에서 알아내어 대문자로 ISBN을 쓴 다음 콜론(:)하고 번호를 같이 써주세요.

즉, 편집창에 이렇게 입력하면

<nowiki>ISBN:8930705987</nowiki>

ISBN:8930705987 <- 이렇게 나타나고 이미지를 클릭하시면 [http://www.aladin.co.kr 알라딘]으로 이동합니다. 책링크한 후에 소개를 따로 하셔도 좋겠지요.

=== 음반 소개 넣기 ===

<nowiki>CD:2231815</nowiki>

CD:2231815 <-- 이렇게 나타나고 이미지를 클릭하면 [http://www.hottracks.co.kr 핫트랙]으로 이동합니다.
);

########### Table
$HelpText[3] = q(
=== 단순한 테이블 ===
<nowiki>||</nowiki>로 각 셀을 구분합니다. 구분자와 셀의 내용 사이에는 공백을 넣으세요.
{{{
|| 1 || 2 ||
|| 3 || 4 ||
}}}

|| 1 || 2 ||
|| 3 || 4 ||

=== 텍스트 정렬 ===
셀 안의 텍스트를 다음과 같이 정렬시킬 수 있습니다.
* <nowiki>|<</nowiki> : 왼쪽 정렬
* <nowiki>||</nowiki> : 가운데 정렬
* <nowiki>|></nowiki> : 오른쪽 정렬

{{{
|< 왼쪽정렬 || 가운데정렬 |> 오른쪽정렬 ||    # 제일 오른쪽은 무조건 || 를 사용
|< a        || b          |> c          ||    # 왼쪽과 같이 || 를 위아래에 맞춰 적을 필요는 없음
}}}

|< 왼쪽정렬 || 가운데정렬 |> 오른쪽정렬 ||
|< a        || b          |> c          ||

=== 열을 합칠 때 (colspan) ===
열을 합칠 때는 <nowiki>ll</nowiki> 문자를 여러번 반복하여 적어줍니다. 예를 들어 3개의 열을 합칠 때는 <nowiki>llllll</nowiki>가 됩니다. 

{{{
|||| a 2칸 || bbbbb || ccccc ||
|| d |||||> e 3칸오른쪽 ||         # "|| || |>" 를 붙여 쓴 형태이다. 앞의 두 구분자는 || 만 가능.
|||||||< f 4칸왼쪽 ||
|| g || h || i || j ||
}}}

|||| a 2칸가운데 || bbbbb || ccccc ||
|| d |||||> e 3칸오른쪽 ||
|||||||< f 4칸왼쪽 ||
|| g || h || i || j ||


=== 행을 합칠 때 (rowspan) ===
rowspan="3" 이라면, <nowiki>||v3</nowiki> 뒤에 내용을 적습니다.. 즉 <nowiki>||</nowiki>v(rowspan값) 으로 지정을 하면 됩니다. 앞의 구분자는 <nowiki>||, |<, |></nowiki> 셋 다 가능하며, "v" 뒤에 숫자가 없으면 기본값은 "2"입니다.

{{{
|| 1111111111 || 2222222222 || 3333333333 ||
||v3 a 3칸 || b || c  ||
|<v d 2칸왼쪽 || e ||
|| f ||
}}}

|| 1111111111 || 2222222222 || 3333333333 ||
||v3 a 3칸 || b || c  ||
|<v d 2칸왼쪽 || e ||
|| f ||


=== 복잡한 표 예제 ===
{{{
|| 1111111111 || 2222222222 || 3333333333 || 4444444444 || 5555555555 || 6666666666 ||
|| 1 |||||||> 2 |< 3 ||
|||<v5 4 |> 5 |< 6 |||| 7 ||
|>v 8 ||||v 9 |< 10 ||
|> 11 ||
|||||| 12 |<v3 13 ||
||||v 14 |> 15 ||
|< 16 || 17 |>v 18 ||
|< 19 |||||> 20 || 21 ||
}}}

|| 1111111111 || 2222222222 || 3333333333 || 4444444444 || 5555555555 || 6666666666 ||
|| 1 |||||||> 2 |< 3 ||
|||<v5 4 |> 5 |< 6 |||| 7 ||
|>v 8 ||||v 9 |< 10 ||
|> 11 ||
|||||| 12 |<v3 13 ||
||||v 14 |> 15 ||
|< 16 || 17 |>v 18 ||
|< 19 |||||> 20 || 21 ||


=== 테이블 꾸미기 ===

 TABLE: <table tag>

 TABLE:으로 줄이 시작하면 그 행 전체는 table tag가 됩니다.

* table tag =
** width=<number percent>
** align=<center left right>
** cellpadding=<number>
** cellspacing=<number>
** border=<number>
** bgcolor=<html color value>

예:
<pre>
 TABLE: bgcolor=yellow cellspacing=5 border=1 width=90% align=center
 ll first ll second ll third ll
 llll span four ll five ll
</pre>
TABLE: bgcolor=yellow cellpadding=2 cellspacing=5 border=1 width=90% align=center

|| first || second || third ||
|||| span four || five ||
);

########### Macro

$HelpText[4] = q|
매크로는 꺽쇠로 둘러싸인 이런 저런 목적의 키워드입니다. 위키 링크와 헷갈리므로 대소문자를 섞어 쓰지 않도록 하셔야 합니다.

=== <nowiki><date>, <time>, <datetime></nowiki> ===
{{{
지금은 <datetime>, 오늘은 <date>, 지금 시각은 <time>
}}}
지금은 <datetime>, 오늘은 <date>, 지금 시각은 <time>

=== <nowiki><pagecount></nowiki> ===
{{{
이 위키에는 총 <pagecount>개의 문서가 있습니다.
}}}
이 위키에는 총 <pagecount>개의 문서가 있습니다.

=== <nowiki><randompage(숫자)></nowiki> ===
위키 내의 페이지들 중에서 '숫자'로 지정한 수 만큼 무작위로 출력
{{{
오늘의 페이지: <randompage(2)>
}}}
오늘의 페이지: <randompage(2)>

=== <nowiki><titlesearch(문자열)></nowiki> ===
위키 내의 페이지 제목 중에서 문자열을 검색하여 일치하는 페이지 제목을 출력. 정규식을 사용한다. 예를 들어 위키내에 SF-사변소설, SF-사이버펑크, 스팀펑크 라는 문서가 있을 때,
{{{
<titlesearch(^SF)>라고 하면 SF-사변소설, SF-사이버펑크를 출력. ^ 는 첫 글자부터 일치
<titlesearch(펑크$)>라고 하면 SF-사이버펑크와 스팀펑크를 출력. $ 는 마지막부터 일치
<titlesearch(사변)> 이라고 하면 SF-사변소설 출력. 제목중에 '사변'과 일치하는 모든 항목
<titlesearch(.*)> 이라고 하면 모든 문서 출력. .*는 모든 문자와 일치.
}}}

=== <nowiki><fullsearch(문자열)></nowiki> ===
타이틀서치와 마찬가지인데, 문서 제목 뿐만 아니라 문서 내용도 같이 검색. 페이지가 늘어나면 속도가 느려짐.

=== <nowiki><goto(문자열)></nowiki> ===
페이지를 찾아가는 폼을 출력. 문자열은 디폴트...
{{{
<goto(바보)>
}}}
<goto(바보)>

=== <nowiki><history(숫자)></nowiki> ===
현재 페이지의 수정 내역(변경 히스토리)를 테이블로 출력. 이때 괄호안의 숫자는 출력할 가장 최근의 변경 내역의 갯수.
{{{
<history(5)>
}}}

=== <nowiki>&lt;mysign&gt;</nowiki> ===
&lt;mysign&gt; 이라 적고 저장을 하면 그 자리에 자신의 아이디 (로그인 하지 않았을 경우는 IP 주소) 와 저장 시각이 표시된다. 서명처럼 사용 가능.

=== <nowiki><calendar([페이지이름,] [+/-]년,[+/-]월)></nowiki> ===
해당 년, 월에 대한 달력을 표시한다. 이때 달력의 각 날짜를 클릭하면 "년-월-일"에 해당하는 페이지가 생성된다. 페이지이름을 추가로 줄 경우, 각 날짜를 클릭하면 "페이지이름/년-월-일"의 페이지가 생성된다.

년도와 월에 "0"을 입력하면 각각 "올해"와 "금월"을 의미한다. + 또는 - 를 사용할 경우는 현재 날짜에서 증감을 하여 계산한다. 

{{{
<calendar(0,0)>
}}}
<calendar(0,0)>


=== <nowiki><wikiversion></nowiki> ===
{{{
현재 사용중인 UseModWiki 소스의 버전 : <wikiversion>
}}}
현재 사용중인 UseModWiki 소스의 버전 : <wikiversion>


=== <nowiki><vote(count[,scale])></nowiki> ===
count * scale 의 길이(픽셀 단위)의 막대가 그려진다. scale 을 생략하면 기본값은 10이다.
{{{
<vote(0)>
<vote(1)>
<vote(2)>
<vote(10)>
<vote(20,5)>
<vote(5,20)>
}}}
<vote(0)>
<vote(1)>
<vote(2)>
<vote(10)>
<vote(20,5)>
<vote(5,20)>


=== <nowiki><allpagesto(페이지이름)></nowiki> ===
페이지의 역링크 목록을 출력

=== <nowiki><allpagesfrom(페이지이름[,옵션])></nowiki> ===
특정한 페이지 안에 있는 링크의 목록을 출력. allpagesto 와 반대의 개념. 옵션은 0,1,2 중의 하나이고 기본값은 2이다.
* 0 - 현재 존재하지 않는 페이지에 대한 링크만 출력 
* 1 - 현재 존재하는 페이지에 대한 링크만 출력 
* 2 - 모든 링크를 출력 

=== <nowiki><orphanedpages([+,-]숫자)></nowiki> ===
고아 페이지들을 찾기 위한 매크로.
* 역링크 페이지 수가 "숫자"개인 페이지들의 목록이 출력된다. 따라서 인자로 0 을 주면 역링크의 갯수가 0 인 OrphanedPages 들이 출력된다. 
* 숫자 앞에 별도로 + 또는 - 를 붙일 수 있다. -3 은 "역링크의 갯수가 3개 이하", +4 는 "역링크의 갯수가 4개 이상"인 페이지들의 목록을 출력한다. 

=== <nowiki><wantedpages></nowiki> ===
링크만 있고 내용은 아직 없는 페이지들의 목록을 출력

=== <nowiki><userlist></nowiki> ===
현재 이 위키에 등록된 아이디 목록을 출력한다.

=== <nowiki>사전 매크로 <dic(단어)> <kdic(단어)> <jdic(단어)></nowiki> ===
영어, 한국어, 일본어 사전에 링크를 걸어주는 매크로
{{{
* <dic(school)>, <dic(학교)>  - 영한 사전, 한영 사전
* <kdic(학교)> - 국어 사전
* <jdic(がっこう)>, <jdic(학교)> - 일한 사전, 한일 사전
}}}

* <dic(school)>, <dic(학교)>  - 영한 사전, 한영 사전
* <kdic(학교)> - 국어 사전
* <jdic(がっこう)>, <jdic(학교)> - 일한 사전, 한일 사전

=== <nowiki><mostpopular(시작순위,끝순위)></nowiki> ===
페이지들을 조회수에 의해 정렬하여 출력하는 매크로.
* 시작순위와 끝순위는 0 이 아닌 정수로 주어야 한다. 
* 1 은 가장 조회수가 높은 페이지, 2 는 두번째로 높은 페이지, -1 은 가장 낮은 페이지, -2 는 두번째로 낮은 페이지... 

=== <nowiki><myinterest> 또는 <myinterest(사용자아이디)></nowiki> ===
* <nowiki><myinterest></nowiki> 매크로는, 이 매크로가 포함된 페이지를 브라우징하는 사용자의 관심 페이지 목록을 출력한다. 로그인하지 않은 사용자의 경우는 아무것도 출력되지 않는다. 최근변경내역 등에 이 매크로를 넣어 두는 식으로 사용할 수 있다. 
* <nowiki><myinterest(사용자아이디)></nowiki> 매크로는, 인자로 받은 아이디에 해당하는 사용자가 존재하고 그 사용자가 페이지 하나 이상을 관심페이지로 등록한 경우 그 페이지들의 목록을 출력한다. 그 외의 경우는 아무것도 출력되지 않는다. 

=== <nowiki><comments(숫자)> , <longcomments(숫자)></nowiki> ===
페이지 수정 절차를 거치지 않고 간단한 답글을 쉽게 추가할 수 있는 폼을 생성하는 매크로.
* comments 는 한 줄 크기의 텍스트 필드, longcomments 는 여러 줄 크기의 텍스트 영역으로 나타난다.
* 처음 작성시 자동으로 &lt;(long)comments(페이지이름,숫자)&gt; 로 확장되니, 신경쓰지 말 것
* 한 페이지 내에 코멘트 입력창을 여러 개 넣을 경우, 숫자를 서로 다르게 하여 구분해 주면 된다.
* 숫자가 양수냐 음수냐에 따라 동작이 달라진다
** 숫자가 양수일 경우는 댓글이 입력창 위쪽에, 최근글이 아래 오는 순서로 달린다.
** 숫자가 음수일 경우는 댓글이 입력창 아래쪽에, 최근글이 위에 오는 순서로 달린다.
* 숫자의 범위에 따라 페이지 수정 권한의 적용이 달라진다.
** 숫자의 절대값이 100 보다 작을 경우는, 페이지 수정 권한이 없는 경우는 코멘트창에 아예 입력을 할 수 없다.
** 100 이상일 경우는, 수정 권한에 관계 없이 코멘트를 달 수 있다. 


=== <nowiki>&lt;toc&gt;</nowiki> ===
헤드라인 들을 모아서 목차를 출력한다. 헤드라인들은 다음과 같은 형태여야 한다.
{{{
== # 제목 ==    <-- 반드시 # 이 있어야 하며, = 는 두 개 이상이어야 함
}}}

=== <nowiki>&lt;include(페이지이름)&gt; , &lt;includenotoc(페이지이름)&gt;</nowiki> ===
인자로 받은 페이지의 내용을 매크로가 있는 자리에 삽입하여 출력한다. includenotoc 의 경우는 인자로 받은 페이지 내에 있는 &lt;toc&gt; 태그를 처리하지 않는다.

=== <nowiki>&lt;includeday([페이지이름,] [+/-]숫자)&gt;</nowiki> ===
* 숫자는 오늘 날짜로부터의 간격을 의미한다. 0 은 오늘, 2 또는 +2 는 이틀 후, -3 은 사흘 전... 
* 페이지 이름이 없을 경우는 위에서 계산한 날짜에 해당되는 페이지를 include 한다. 
* 페이지 이름을 인자로 주면, "페이지이름/계산된날짜" 에 해당하는 페이지를 include 한다. 
* 페이지 이름이 올바르지 않은 문자열일 경우는 치환되지 않는다. 

=== <nowiki>&lt;includedays([페이지이름,] [+/-]숫자, [+/-]숫자)&gt;</nowiki> ===
* 페이지 이름과 첫번째 숫자는 includeday 매크로와 동일하다
* 세번째 인자인 숫자의 갯수만큼의 "존재하는" 페이지를 include 한다.
* 세번째 인자의 부호가 "-" 이면 이전 날짜로, "+" 또는 부호가 없으면 이후 날짜로 이동하며 탐색한다.
* 예를 들어 두 숫자가 0,-5 라면, "오늘부터 시작해서 과거로 거슬러가며 존재하는 날짜 페이지 5개를 각각 include" 하게 된다.
* 세번째 인자의 숫자만큼의 페이지를 찾아내지 못했을 경우에도 시작 날짜를 중심으로 전후 100 일 이내의 페이지들만을 검사한다.
* 만일 날짜 페이지 중에 "페이지는 존재하지만 내용은 아무것도 없는" 페이지의 경우는 "존재하는" 페이지로 간주한다.

=== <nowiki><noinclude>내용</noinclude></nowiki> ===
다른 페이지에 include 되어 출력될 때, noinclude 태그로 둘러쌓인 내용은 표시되지 않는다.

=== <nowiki><memo(제목)>내용</memo></nowiki> ===
페이지에 제목만 출력되고, 제목을 클릭하면 그 때 내용이 나타난다. 스포일러 등을 적을 때 사용한다.

{{{
<memo(여기를클릭)>
범인은 바로 ...
</memo>
}}}

<memo(여기를클릭)>
범인은 바로 ...
</memo>

=== <nowiki><footnote(내용)></nowiki> ===
매크로가 있던 자리에는 각주 번호가 표시되고, 페이지 하단에 각주 번호와 내용이 나온다.

=== <nowiki><color(글자색,[배경색,]내용)></nowiki> ===
지정한 글자색, 배경색으로 내용을 출력한다.
{{{
<color(blue,yellow,이 매크로는)> <color(red,#EEE,다음과 같이)> 
<color(green,짧은 부분의)> <color(gold,색깔을 바꿀 때)> 
<color(#369,쉽게 사용할 수 있다.)>
}}}
<color(blue,yellow,이 매크로는)> <color(red,#EEE,다음과 같이)> <color(green,짧은 부분의)> <color(gold,색깔을 바꿀 때)> <color(#369,쉽게 사용할 수 있다.)>

=== <nowiki><img(이미지URL,너비,높이[,캡션][,정렬방향])></nowiki> ===
이미지를 너비, 높이, 캡션, 정렬방향 등의 속성을 주어 표시한다. 이미지URL에는 인터위키를 사용할 수 있다. 너비와 높이의 경우 둘 다 0이면 원래 크기로, 하나만 0이면 비율에 맞게 나온다.
{{{
<img(Upload:그림1.jpg,200,0)>
<img(Inter:그림1.jpg,200,0,그림1)>
<img(http://내.홈/그림1.jpg,200,0,그림1,right)>
}}}

=== <nowiki><trackbacksent></nowiki> ===
이 매크로가 있으면 트랙백을 보낸 로그가 이 매크로가 있는 자리에 삽입된다.
이 매크로가 없을 경우는 로그가 삽입되지 않는다.

=== <nowiki><trackbackreceived></nowiki> ===
이 매크로가 있으면 트랙백을 받았을 때 받은 트랙백의 내용이 이 매크로가 있는
자리에 삽입된다. 만일 이 매크로가 없는데 트랙백을 받았다면 페이지 제일
아래에 매크로를 자동으로 추가한다.

=== #REDIRECT 페이지이름 ===
'페이지이름'에 해당하는 페이지로 자동으로 이동한다. 현재 페이지의 제일 첫 줄에 존재해야 한다. 

=== #EXTERN URL ===
URL 에 해당하는 외부 웹 페이지를 표시한다. 현재 페이지의 제일 첫 줄에 존재해야 한다.
|;

########### Emoticon

$HelpText[5] = q|
'''홈페이지 관리자가 이모티콘을 사용하도록 허용한 경우에 적용됩니다'''

이모티콘은 감정표현에 사용되는 작은 그림입니다. <br>
다음과 같은 문자열 중 하나를 입력하시면 왼쪽의 그림이 자동으로 삽입됩니다.

* ^^  <nowiki>^^ ^-^ ^_^ ^o^ ^O^ ^^; ^-^; ^_^; ^o^ ^O^ :-D :D</nowiki>
* :-) <nowiki>:-)</nowiki>
* -_- <nowiki>-_- -_-; =.= =.=; :-s :-S</nowiki>
* o.O <nowiki>o.O *.* :-o :-O :o :O</nowiki>
* :-( <nowiki>:-( :(</nowiki>
* :-p <nowiki>:-p :-P :p :P</nowiki>
* ;-) <nowiki>;-) ;)</nowiki>

|;


############# end of help contents

1;
