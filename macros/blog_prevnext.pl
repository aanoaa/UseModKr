# <blog_prevnext(����������)>
# ������������ �о, ���� ���� �ִ� �������� ���� �������� ���� �������� ��ũ�� ���

$MacroFunc{"blog_prevnext"} = \&blog_prevnext;

sub blog_prevnext {
	my ($txt) = @_;

	$txt =~ s/&__LT__;blog_prevnext\((.*?)\)&__GT__;/&MacroBlogPrevNext($1)/gei;

	return $txt;
}

sub MacroBlogPrevNext {
	use strict;
	my ($tocpage) = @_;
	my ($mainpage, $subpage);
	my $txt;

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

	if ($OpenPageName =~ m|(.*)/(.*)|) {
		($mainpage, $subpage) = ($1,$2);
	} else {
		$mainpage = $OpenPageName;
	}

	# �������� ���� �������� ��ġ�� ã��
	my $idx = 0;
	for ($idx = 0; $idx <= $#tocitem_List; $idx++) {
		my $line = $tocitem_List[$idx];
		if ($line =~ m/\[\[$FreeLinkPattern(\|[^\]]+)?\]\]/) {
			my $link = $1;
			$link =~ s/ /_/g;
			if (($link eq $OpenPageName) || ($link eq "/$subpage")) {
				last;
			}
		} elsif ($line =~ m/$LinkPattern/) {
			my $link = $1;
			$link =~ s/ /_/g;
			if (($link eq $OpenPageName) || ($link eq "/$subpage")) {
				last;
			}
		}
	}

	# ������������ ���������� �̸� ã��
	my ($prev, $next);
	if ($idx > $#tocitem_List) {
		return "";
#		return "[Not found this page:$OpenPageName in TOC]";
	}

	my $item;
	my ($thispage, $thispagename, $thisdate);
	$item = $tocitem_List[$idx];
	if ($item =~ /\[\[(.+?)\]\] (\d+-\d+-\d+)/) {
		($thispage, $thispagename, $thisdate) = ($1, $1, $2);
		$thispage =~ s|^/|$toc_mainpage/|;
		$thispage = &FreeToNormal($thispage);
	}

	my ($prevpage, $prevpagename, $prevdate);
	my ($nextpage, $nextpagename, $nextdate);
	if ($idx > 0) {
		$item = $tocitem_List[$idx-1];
		if ($item =~ /\[\[(.+?)\]\] (\d+-\d+-\d+)/) {
			($prevpage, $prevpagename, $prevdate) = ($1, $1, $2);
			$prevpage =~ s|^/|$toc_mainpage/|;
			$prevpage = &FreeToNormal($prevpage);
		}
	}
	if ($idx < $#tocitem_List) {
		$item = $tocitem_List[$idx+1];
		if ($item =~ /\[\[(.+?)\]\] (\d+-\d+-\d+)/) {
			($nextpage, $nextpagename, $nextdate) = ($1, $1, $2);
			$nextpage =~ s|^/|$toc_mainpage/|;
			$nextpage = &FreeToNormal($nextpage);
		}
	}

	# ���
	my $shortCutUrl = "$ScriptName".&ScriptLinkChar();
	my $shortCutKey;
	$txt = "<CENTER>";
 	if ($prevpage) {
		$txt .= "<b>&lt;&lt;</b>&nbsp;&nbsp; ".
			&GetPageOrEditLink($prevpage, $prevpagename).
			" ($prevdate)[p]";
		$shortCutKey .= "key['p'] = \"${shortCutUrl}$prevpage\";\n"
 	}
	$txt .= " &nbsp;&nbsp<b>|</b> $thispagename ($thisdate) <b>|</b>&nbsp;&nbsp; ";
 	if ($nextpage) {
		$txt .= &GetPageOrEditLink($nextpage, $nextpagename).
			" ($nextdate)[n]".
			" &nbsp;&nbsp;<b>&gt;&gt;</b>";
		$shortCutKey .= "key['n'] = \"${shortCutUrl}$nextpage\";\n"
 	}
	$txt .= "</CENTER>\n";
	if ($UseShortcut && $shortCutKey) {
		$txt .= "<script>\n".
			"<!--\n".
			$shortCutKey.
			"-->\n".
			"</script>";
	}

	return $txt;
}

1;
