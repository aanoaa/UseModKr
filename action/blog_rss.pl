# blog_rss �׼�

my @ChannelField = ('title','link','description','language',
		'copyright','manageingEditor','webMaster','pubDate',
		'lastBuildDate','category','generator','docs','could',
		'ttl','image','rating','textInput','skipHours','skipDays');
my @ItemField = ('title','link','description','author','category',
		'comments','enclosure','guid','pubDate','source');
my %NeedCdata = map { $_ => 1 } ('description');
my (%RssChannelField, %RssItemFieldInList, %RssItemField, $ListPageAuthor);

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
# cache ������ �о ���
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

# ����Ʈ ���� ���� ����
# ����Ʈ ����
		$RssChannelField{'title'} = &QuoteHtml($SiteName);
# ����Ʈ ��ũ
		$FullUrl = $q->url(-full=>1)  if ($FullUrl eq "");
		$QuotedFullUrl = &QuoteHtml($FullUrl);
		$RssChannelField{'link'} = $QuotedFullUrl;
 		$RssChannelField{'link'} .= &ScriptLinkChar() . $blogpage if ($blogpage);
# ����Ʈ ����
		$RssChannelField{'description'} = &QuoteHtml($SiteDescription);
# ��� - how to detect?
		$RssChannelField{'language'} = "ko";
# xml�ۼ� �ð�
		$RssChannelField{'pubDate'} = &BlogRssGetPubDate($Now);

# ����Ʈ �������� ����ڰ� ������ ���� �о ���� ��
		&OpenPage($listpage);
		&OpenDefaultText;
		$ListPageAuthor = $Section{'username'};
		&BlogRssGetUserDefinedValue($Text{'text'}, "list");

# rss header ����
		$rssHeader = <<EOF;
<?xml version="1.0" encoding="$HttpCharset" ?>
<rss version="2.0">
<channel>
EOF
		foreach my $field (@ChannelField) {
			if ($RssChannelField{$field} ne "") {
				$rssHeader .= 
					"<$field>".
					(($NeedCdata{$field})?("<![CDATA[".$RssChannelField{$field}."]]>"):($RssChannelField{$field})).
					"</$field>".
					"\n";
			}
		}

# rss footer ����
		$rssFooter = <<EOF;
</channel>
</rss>
EOF

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

	# ����Ʈ�� �� �������� �о item �������� ����� ��ȯ��
	my $txt;

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

# ������ �ʵ� �ʱ�ȭ
		%RssItemField = %RssItemFieldInList;

		&OpenPage($pageid);
		&OpenDefaultText();
# ����
		$RssItemField{'title'} = $page;
# ��ũ
		$RssItemField{'link'} = $QuotedFullUrl.&ScriptLinkChar().&EncodeUrl($pageid);
# ����
		my $description = $Text{'text'};
		$description =~ s/<noinclude>.*?<\/noinclude>//igs;
		$description =~ s/<blog_rss>.*?<\/blog_rss>//igs;
		$description = &QuoteHtml($description);
		$description =~ s/\n/<br \/>\n/g;
 		$RssItemField{'description'} = $description;
# �ۼ��� - �������, list �������� �ۼ��ڸ� �� ���� �ۼ��ڷ� ����
		my $author;
		if ($RssItemFieldInList{'author'}) {
			$author = $RssItemFieldInList{'author'};
		} else {
			$author = $ListPageAuthor;
		}
		$RssItemField{'author'} = &QuoteHtml($author);
# ī�װ� - ��å����
# 		$RssItemField{'category'} = "";
# �ۼ��ð�
		$RssItemField{'pubDate'} = &BlogRssGetPubDate($Page{'tscreate'});

# ����Ʈ �������� ����ڰ� ������ ���� �о ���� ��
		&BlogRssGetUserDefinedValue($Text{'text'});

		$txt .= "<item>\n";
		foreach my $field (@ItemField) {
			if ($RssItemField{$field} ne "") {
				$txt .=
					"<$field>".
					(($NeedCdata{$field})?"<![CDATA[".$RssItemField{$field}."]]>":$RssItemField{$field}).
					"</$field>".
					"\n";
			}
		}
		$txt .= "</item>\n";

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


# param: �ؽ�Ʈ[,��ó]
# �ؽ�Ʈ���� <blog_rss> </blog_rss> �κ��� ã�Ƽ� �Ľ��Ͽ� ���������� ����
sub BlogRssGetUserDefinedValue {
	my ($text, $where) = @_;
	my ($text_channel, $text_item);

	my $text_blog;
	while ($text =~ /<blog_rss>(.+?)<\/blog_rss>/igs) {
		$text_blog .= $1;
	}
	while ($text_blog =~ /<channel>(.+?)<\/channel>/igs) {
		$text_channel .= $1;
	}
	while ($text_channel =~ s/<item>(.+?)<\/item>//igs) {
		$text_item .= $1;
	}

	while ($text_channel =~ /<(.+?)>(.+?)<\/\1>/gs) {
		$RssChannelField{$1} = $2;
	}
	while ($text_item =~ /<(.+?)>(.+?)<\/\1>/gs) {
		if ($where eq "list") {
			$RssItemFieldInList{$1} = $2;
		} else {
			$RssItemField{$1} = $2;
		}
	}
}

1;
