# <blog_calendar(����������,��,��)>

sub blog_calendar {
	my ($txt) = @_;

	$txt =~ s/\&__LT__;blog_calendar\(([^,\n]+),([-+]?\d+),([-+]?\d+)\)\&__GT__;/&MacroBlogCalendar($1, $2, $3)/gei;

	return $txt;
}

sub MacroBlogCalendar {
	use Time::Local;
	use strict;
	my ($tocpage, $cal_year, $cal_month) = @_;

	my $result='';
	my $cal_result='';
	my $cal_page;
	my @cal_color = ("red", "black", "black", "black", "black", "black", "blue", "green");
	my @cal_dow = (T('Su'), T('Mo'), T('Tu'), T('We'), T('Th'), T('Fr'), T('Sa'));
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($Now+$TimeZoneOffset);
	my ($this_year, $this_month, $this_day) = ($year, $mon, $mday);
	my $cal_time;
	my ($td_class, $span_style);
	my $temp;

	# ���� ���� 13 �̻��̸� ��ȿ
	if (!($cal_month =~ /[-+]/) && ($cal_month > 12)) {
		return "&lt;calendar($tocpage,$cal_year,$cal_month)&gt;";
	}

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

	# ����Ʈ�� �ϳ��� ����
	my $tocitems = join("\n", @tocitem_List);

	# �⵵�� �޿� 0 �� ���ڷ� ������ ���� �Ǵ� �̹� ��
	$cal_year = $this_year+1900 if ($cal_year == 0); 
	$cal_month = $this_month+1 if ($cal_month == 0);

	# �⵵�� + �Ǵ� - �� ������ ���طκ��� ���� ���
	if ($cal_year =~ /\+(\d+)/ ) {
		$cal_year = $this_year+1900 + $1;
	} elsif ($cal_year =~ /-(\d+)/ ) {
		$cal_year = $this_year+1900 - $1;
	}

	# �޿� + �Ǵ� - �� ������ �̹� �޷κ��� ���� ���
	if ($cal_month =~ /\+(\d+)/ ) {
		$cal_month = $this_month+1 + $1;
		while ($cal_month > 12)  {
			$cal_month -= 12;
			$cal_year++;
		}
	} elsif ($cal_month =~ /-(\d+)/ ) {
		$cal_month = $this_month+1 - $1;
		while ($cal_month < 1) {
			$cal_month += 12;
			$cal_year--;
		}
	}
	
	# 1902����� 2037�� ���̸� ������. �� ������ ����� 1902��� 2037������ ���
	$cal_year = 2037 if ($cal_year > 2037);
	$cal_year = 1902 if ($cal_year < 1902);

	# 1��~9���� 01~09�� ����
	if ($cal_month < 10) {
		$cal_month = "0" . $cal_month;
	}

	# �޷� ���� ���
	$result .= "<TABLE class='calendar'>";
	$result .= "<CAPTION class='calendar'>" 
		."<a href=\"$ScriptName".&ScriptLinkChar()."$toc_mainpage/$cal_year-$cal_month\">"
		.(length($toc_mainpage)?"$toc_mainpage<br>":"")
		."$cal_year-$cal_month"
		."</a>"
		."</CAPTION>";

	# ����� ���� ��� 
	$result .= "<TR class='calendar'>";
	for (0..6) {
		$result .= "<TH class='calendar'>"
			. "<span style='color:$cal_color[$_]'>$cal_dow[$_]</span></TH>";
	}
	$result .= "</TR>";

	# ���ڷ� �־��� ���� 1�ϳ��� ã��
	$cal_time = timelocal(0,0,0,1,$cal_month-1,$cal_year);
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($cal_time);
	# �޷��� ù��° �� ã��
	$cal_time -= $wday * (60 * 60 * 24);
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($cal_time);

	# �޷� �׸�
	my ($temp_month, $temp_day);
		
	for (1..6) {
		$result .= "<TR class='calendar'>";
		for (0..6) {

			# 1~9�� 01~09�� ����
			($temp_month, $temp_day) = ($mon + 1, $mday);
			$temp_month = "0".$temp_month if ($temp_month < 10);
			$temp_day = "0".$temp_day if ($temp_day < 10);
			$cal_page = ($year + 1900)."-".($temp_month)."-".($temp_day);

			$cal_result = $mday;
			$span_style = "";
			if (($year == $this_year) && ($mon == $this_month) && ($mday == $this_day)) {
				$td_class = "calendartoday";
				$span_style = "text-decoration: underline; ";
			} else {
				$td_class = "calendar";
			}

# �ش� ��¥�� ����Ʈ�� �ִ� ���
			my ($page, $pagename) = ("", "");
			if ($tocitems =~ /^\[\[(.+?)(\|.*)?\]\] $cal_page$/m) {
				($page, $pagename) = ($1, $1);
				$page =~ s|^/|$toc_mainpage/|;
				$page = &FreeToNormal($page);
				$span_style .= "font-weight: bold; text-decoration: underline; ";
				$wday = 7;
# ���� ���� �������� �ش��ϴ� ��¥�� ���
				if ($page eq $OpenPageName) {
					$td_class .= "thispage";
				}
			}

			if ($cal_month != ($mon+1)) {
				$span_style .= "font-size: 0.9em; ";
			}

			$result .= "<td class='$td_class'>"
				.(($page)?"<a href=\"$ScriptName".&ScriptLinkChar()."$page\" title=\"$pagename\">":"")
				."<span style='color:$cal_color[$wday]; $span_style'>"
				.$cal_result
				."</span>"
				.(($page)?"</a>":"")
				."</td>";
			$cal_time += (60 * 60 * 24);
			($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($cal_time);
		}
		$result .= "</TR>";
		# 4 �Ǵ� 5 �ٷ� ���� �� ������ ����
		last if (($mon+1 > $cal_month) || ($year+1900 > $cal_year));
	}

	$result .= "</table>";
	return $result;
}

1;
