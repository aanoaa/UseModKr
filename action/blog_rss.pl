sub action_blog_rss {
	use strict;
	my $listpage = &GetParam("listpage","");
	my $blogpage = &GetParam("blogpage","");
	my $num_items = &GetParam("items",15);			# xml���Ͽ� ���ԵǴ� �� ����
	my $update_period = &GetParam("update",60);		# xml���� ���� �ֱ�(����:��). 0�̸� �׻� ���� ����

	my $xml = "";

	my $cachefile = $blogpage."_".$listpage;
	$cachefile =~ s/(\W)/uc sprintf "_%02x", ord($1)/eg;
	$cachefile = "$TempDir/rss_$cachefile.xml";

# cache ������ �ְ� ������ ���� ���� $update_period(��)�� ������ ���� ��� 
	if (-f $cachefile) {
		my $mtime = (stat($cachefile))[9];
		if (($Now - $mtime) < ($update_period * 60)) {
			my ($status, $data) = &ReadFile($cachefile);
			if ($status) {
				$xml = $data;
			}
		}
	}

# xml�� ���� ������
	if ($xml eq "") {
		my ($rssHeader, $rssBody, $rssFooter);

		my ($title, $description, $link, $pubDate, $language);
# ����Ʈ ����
		$title = &QuoteHtml($SiteName);
# ����Ʈ ����
		$description = &QuoteHtml($SiteDescription);
# ����Ʈ ��ũ
		$FullUrl = $q->url(-full=>1)  if ($FullUrl eq "");
		$QuotedFullUrl = &QuoteHtml($FullUrl);
		$link = $QuotedFullUrl;
		$link .= &ScriptLinkChar() . $blogpage if ($blogpage);
# xml�ۼ� �ð�
		$pubDate = &BlogRssGetPubDate($Now);
# ��� - how to detect?
		$language = "ko";

# rss header ����
		$rssHeader = <<RSS;
<?xml version="1.0" encoding="$HttpCharset" ?>
<rss version="2.0">
<channel>
<title>$title</title>
<link>$link</link>
<description>$description</description>
<pubDate>$pubDate</pubDate>
<language>$language</language>
RSS

# rss footer ����
		$rssFooter = <<RSS;
</channel>
</rss>
RSS

# header�� footer������ body ����
		$rssBody = &BlogRssGetItems($listpage, $num_items);

# ��ü xml ����
		$xml = $rssHeader.
			$rssBody.
			$rssFooter;

# cache ���Ͽ� ����
		&WriteStringToFile($cachefile, $xml);
	}

# ���� ���
	print "Content-type: text/xml\n\n";
	print $xml;

	return;
}


# param: ����������, ������ ����
# return: $txt
#  $txt : Rss ������ <item>...</item>�׸��
sub BlogRssGetItems {
	use strict;
	my ($tocpage, $num_items) = @_;

	# ���̺귯�� ����
	my ($MacrosDir, $MyMacrosDir) = ("./macros/", "./mymacros/");
	if (-f "$MyMacrosDir/blog_library.pl") {
		require "./$MyMacrosDir/blog_library.pl";
	} elsif (-f "$MacrosDir/blog_library.pl") {
		require "./$MacrosDir/blog_library.pl";
	} else {
		return "";
	}

	# �����������κ��� ��������Ʈ�� ��
	my ($status, $toc_mainpage, @tocitem_List) = &BlogReadToc($tocpage);
	if (!$status) {
		return "";
	}

	# ���ǿ� �´� ����Ʈ�� ����
	($status, @tocitem_List) = &BlogGetListOrder(1, $num_items, @tocitem_List);
	if (!$status) {
		return "";
	}

	&OpenPage($tocpage);
	&OpenDefaultText();
	my $tocpage_author = $Section{'username'};

	# ����Ʈ�� �� �������� �о item �������� ����� ��ȯ��
	my $txt;

	my ($title, $description, $link, $pubDate, $category, $author);
	my ($page, $pagename, $date, $pageid);
	foreach my $item (@tocitem_List) {
		if ($item =~ /^(.+)$FS1(.*)$FS1(.+)$/) {
			($page, $pagename, $date) = ($1, $2, $3);
		}
		$pageid = $page;
		$pageid =~ s|^/|$toc_mainpage/|;
		$pageid = &FreeToNormal($pageid);

# �������� �������� ������ ���
		next if (not -f &GetPageFile($pageid));

		&OpenPage($pageid);
		&OpenDefaultText();

# ����
		$title = $page;
# ����
		$description = $Text{'text'};
		$description =~ s/<noinclude>.*?<\/noinclude>//igs;
		$description = &QuoteHtml($description);
		$description =~ s/\n/<br \/>\n/g;
# ��ũ
		$link = $QuotedFullUrl.&ScriptLinkChar().&EncodeUrl($pageid);
# �ۼ��ð�
		$pubDate = &BlogRssGetPubDate($Page{'tscreate'});
# ī�װ� - ��å����
		$category = "";
# �ۼ��� - �������, list �������� �ۼ��ڸ� �� ���� �ۼ��ڷ� ����
		$author = &QuoteHtml($tocpage_author);

		$txt .= <<ITEM
<item>
<title>$title</title>
<description>$description</description>
<link>$link</link>
<pubDate>$pubDate</pubDate>
<category>$category</category>
<author>$author</author>
</item>
ITEM
	}

	return $txt;
}


# param: timestamp��
# return: $pubDate
#  $pubDate : <pubDate>�׸� �ȿ� �� ��¥�� �ð� ����
sub BlogRssGetPubDate {
	my ($ts) = @_;

	my @dow = ("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
	my @month = ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime($ts);
	my $pubDate = sprintf("%3s, %02d %3s %04d %02d:%02d:%02d +%02d00",
			$dow[$wday], $mday, $month[$mon], $year+1900, $hour, $min, $sec, $RssTimeZone);

	return $pubDate;
}

1;
