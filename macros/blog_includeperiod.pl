# <blog_includeperiod(����������,���۳�¥,����¥)>
# ������������ �о ���۳�¥���� ����¥������ �������� include�Ѵ�.

sub blog_includeperiod {
	my ($txt) = @_;

	$txt =~ s/<blog_includeperiod\(([^,]+),([\d-]+),([\d-]+)\)>/&MacroBlogIncludePeriod($1,$2,$3)/geim;

	return $txt;
}

sub MacroBlogIncludePeriod {
	use strict;
	my ($tocpage, $startdate, $enddate) = @_;

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

	# ����Ʈ�� �� �������� �о include��
	my $txt;
	my ($page, $date);
	foreach my $item (@tocitem_List) {
		if ($item =~ /^(.+)$FS1(.*)$FS1(.+)$/) {
			($page, $date) = ($1, $3);
		}
		$page =~ s|^/|$toc_mainpage/|;
		$page = &FreeToNormal($page);
		$txt .= &MacroInclude($page);
	}

	return $txt;
}

1;
