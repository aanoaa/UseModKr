# <blog_listperiod(����������,���۳�¥,����¥[,��¥��¹��])>
# ������������ �о ���۳�¥���� ����¥������ �������� ����� ���

sub blog_listperiod {
	my ($txt) = @_;

	$txt =~ s/\&__LT__;blog_listperiod\(([^,]+),([\d-]+),([\d-]+)(,([-+]?\d))?\)\&__GT__;/&MacroBlogListPeriod($1,$2,$3,$5)/gei;

	return $txt;
}

sub MacroBlogListPeriod {
	use strict;
	my ($tocpage, $startdate, $enddate, $showdate) = @_;

	# ���̺귯�� ����
	my ($MacrosDir, $MyMacrosDir) = ("./macros/", "./mymacros/");
	if (-f "$MyMacrosDir/blog_library.pl") {
		require "./$MyMacrosDir/blog_library.pl";
	} elsif (-f "$MacrosDir/blog_library.pl") {
		require "./$MacrosDir/blog_library.pl";
	} else {
		return "<font color='red'>blog_library.pl not found</font>";
	}

	# �����������κ��� ��������Ʈ�� ��
	my ($status, $toc_mainpage, @tocitem_List) = &BlogReadToc($tocpage);
	if (!$status) {
		return "$toc_mainpage";
	}

	# ���ǿ� �´� ����Ʈ�� ����
	($status, @tocitem_List) = &BlogGetListPeriod($startdate, $enddate, @tocitem_List);
	if (!$status) {
		return "@tocitem_List";
	}

	# ����Ʈ�� �� �������� ��� ���
	my $txt;
	$txt = "<UL>";
	my ($page, $pagename, $date, $pageid);
	foreach my $item (@tocitem_List) {
		if ($item =~ /^(.+)$FS1(.*)$FS1(.+)$/) {
			($page, $pagename, $date) = ($1, $2, $3);
		}
		$pageid = $page;
		$pageid =~ s|^/|$toc_mainpage/|;
		$pageid = &FreeToNormal($pageid);
		$page = $pagename if ($pagename);
		if ($showdate == 0) {
			$txt .= "<LI>".&GetPageOrEditLink($pageid,$page);
		} elsif ($showdate < 0) {
			$txt .= "<LI>($date) ".&GetPageOrEditLink($pageid,$page);
		} else {
			$txt .= "<LI>".&GetPageOrEditLink($pageid,$page)." ($date)";
		}
	}
	$txt .= "</UL>";

	return $txt;
}

1;
