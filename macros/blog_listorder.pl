# <blog_listorder(����������,���ۼ���,������[,��¥��¹��])>
# ������������ �о ���ۼ������� ������������ �������� ����� ���

sub blog_listorder {
	my ($txt) = @_;

	$txt =~ s/\&__LT__;blog_listorder\(([^,]+),([-+]?\d+),([-+]?\d+)(,([-+]?\d))?\)\&__GT__;/&MacroBlogListOrder($1,$2,$3,$5)/gei;

	return $txt;
}

sub MacroBlogListOrder {
	use strict;
	my ($tocpage, $start, $end, $showdate) = @_;

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
	($status, @tocitem_List) = &BlogGetListOrder($start, $end, @tocitem_List);
	if (!$status) {
		return "@tocitem_List";
	}

	# ����Ʈ�� �� �������� ��� ���
	my $txt;
	$txt = "<UL>";
	my ($page, $date, $pageid);
	foreach my $item (@tocitem_List) {
		if ($item =~ /^(.+)!(.+)$/) {
			($page, $date) = ($1, $2);
		}
		$pageid = $page;
		$pageid =~ s|^/|$toc_mainpage/|;
		$pageid = &FreeToNormal($pageid);
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
