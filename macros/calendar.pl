sub calendar {
	my ($txt) = @_;

	$txt =~ s/\&__LT__;calendar\(([^,\n]+,)?([-+]?\d+),([-+]?\d+)\)\&__GT__;/&MacroCalendar($1, $2, $3)/gei;

	return $txt;
}

sub MacroCalendar {
	use Time::Local;
	my ($cal_mainpage, $cal_year, $cal_month) = @_;

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
		return "&lt;calendar($cal_mainpage$cal_year,$cal_month)&gt;";
	}

	# prefix ó��
	if (length($cal_mainpage) != 0) {
		$temp = $cal_mainpage;
		$temp =~ s/,$//;
		$temp = &RemoveLink($temp);
		$temp = &FreeToNormal($temp);
		if (&ValidId($temp) ne "") {
			return "&lt;calendar($cal_mainpage$cal_year,$cal_month)&gt;";
		}
		$temp =~ s/\/.*$//;
		$cal_mainpage = "$temp/";
	}

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
		."<a href=\"$ScriptName?$cal_mainpage$cal_year-$cal_month\">"
		.(length($cal_mainpage)?"$cal_mainpage<br>":"")
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
			if ($pageid eq $cal_mainpage.$cal_page) {
				$td_class .= "thispage";
			}

			if ((-f &GetPageFile($cal_mainpage . $cal_page)) && (!&PageIsHidden($cal_mainpage . $cal_page))) {
				$span_style .= "font-weight: bold; text-decoration: underline; ";
				$wday = 7;
			}
			if ($cal_month != ($mon+1)) {
				$span_style .= "font-size: 0.9em; ";
			}

			$result .= "<td class='$td_class'>"
				."<a href=\"$ScriptName?$cal_mainpage$cal_page\">"
				."<span style='color:$cal_color[$wday]; $span_style'>"
				.$cal_result
				."</span></a></td>";
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
