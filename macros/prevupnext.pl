# <prevupnext(������)> ��ũ��
sub prevupnext {
	my ($txt) = @_;

	$txt =~ s/(&__LT__;prevupnext\((.*?)\)&__GT__;)/&MacroPrevUpNext($1,$2)/gei;

	return $txt;
}

sub MacroPrevUpNext() {
	my ($itself, $tocpage) = @_;
	my $temp;
	my ($mainpage, $subpage);
	my $txt;

	$temp = $tocpage;
	$temp = &RemoveLink($temp);
	$temp = &FreeToNormal($temp);
	if (&ValidId($temp) ne "") {
		return "[Invald id: ".&ValidId($temp)."]";
	}

	$tocpage = $temp;

	my ($toc_mainpage, $toc_subpage);
	if ($tocpage =~ m|(.*)/(.*)|) {
		($toc_mainpage, $toc_subpage) = ($1,$2);
	} else {
		$toc_mainpage = $tocpage;
	}

	# ���� �������� ����
	my ($fname, $status, $data);
	$fname = &GetPageFile($tocpage);
	if (!(-f $fname)) {
		return "[No such page: $tocpage]";
	}

	($status, $data) = &ReadFile($fname);
	if (!$status) {
		return "[Error in read pagefile: $tocpage]";
	}

	my %temp_Page = split(/$FS1/, $data, -1);
	my %temp_Section = split(/$FS2/, $temp_Page{'text_default'}, -1);
	my %temp_Text = split(/$FS3/, $temp_Section{'data'}, -1);
	my $tocpage_Text = $temp_Text{'text'};

	# ���� ���� �и�
	my @tocpage_Lines = split('\n',$tocpage_Text);
	my @tocitem_List;

	# ��ȿ�� ���θ� ����
	foreach my $line (@tocpage_Lines) {
		if ($line =~ m/^(\*|#)+\s*(.*)\s*$/) {
			my $item = $2;
			if ($item =~ m/$LinkPattern|(\[\[$FreeLinkPattern(|[^]]+)?\]\])/) {
				push(@tocitem_List, $item);
			}
		}
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

	# ����,����,��,���� ��ũ ����
	my ($prev, $toc, $next);
	if ($idx > $#tocitem_List) {
		return "[Not found this page:$OpenPageName in TOC]";
	}

# "/����������" ������ ��� ��ũ�� �߸� �ɸ��� ���� ���� ���� MainPage
# ������ �ٲ�ġ���ؾ� ��
	my $mainPage_backup = $MainPage;
	$MainPage = $toc_mainpage;
	$prev = &CommonMarkup($tocitem_List[$idx-1],0,1) if ($idx > 0);
	$next = &CommonMarkup($tocitem_List[$idx+1],0,1) if ($idx < $#tocitem_List);
	$up = &GetPageLink($mainpage) if ($subpage ne '');
	$toc = &GetPageLink($tocpage);
	$MainPage = $mainPage_backup;

	# ���
	$txt = "<B>";
	$txt .= &T('Prev')." : $prev<BR>";
	$txt .= &T('Next')." : $next<BR>";
	$txt .= &T('Up')." : $up<BR>" if ($up ne '');
	$txt .= &T('TOC')." : $toc";
	$txt .= "</B>";

	return $txt;
}

1;
