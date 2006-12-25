# replacetext action
# �ϰ�ġȯ
sub action_replacetext {
	print &GetHeader("", T('Replace strings in all pages'), "");
	return  if (!&UserIsAdminOrError());

	my ($old, $new, $ignoreCase, $test);
	$oldStr = &GetParam("old", "");
	$newStr = &GetParam("new", "");
	$ignoreCase = &GetParam("p_ignore", "0");
	$ignoreCase = "1" if ($ignoreCase eq "on");
	$test = &GetParam("p_test", "0");
	$test = "1" if ($test eq "on");

# �� ���
	print &GetFormStart();
	print &GetHiddenValue("action", "replacetext"),"\n";
	print "Use Perl regular expression for text replacement.\n";
	print "<p><b>Old string:</b><br>\n";
	print $q->textfield(-name=>"old",-size=>"100",-maxlength=>"255",-default=>"$oldStr");
	print "<br>\n";
	print $q->checkbox(-name=>"p_ignore", -override=>1, -checked=>$ignoreCase,
						-label=>T('Ignore case'));

	print "\n<p><b>New string:</b><br>\n";
	print $q->textfield(-name=>"new",-size=>"100",-maxlength=>"255",-default=>"$newStr"). "\n";

	print "<p>";
	print $q->submit(-name=>'Replace'), "\n";
	print $q->checkbox(-name=>"p_test", -override=>1, -checked=>1,
								-label=>T('Just test'));
	print $q->endform;

# old string ���� ���� ���. ���� ó�� �ҷ��� �� ��
	if ($oldStr eq '') {
		print &GetCommonFooter();
		return;
	}


	if ($test) {
		print "<p>Just test ...<br>\n";
	} else {
		print "<p>Search & replace ...<br>\n";
	}

	my ($page, $num);
	$num = 0;
	foreach $page (&AllPagesList()) {		# ��� ������ �˻�
		&OpenPage($page);
		&OpenDefaultText();
		my $newText = $Text{'text'};
		my $match = 0;

# ġȯ �õ�
		if ($ignoreCase) {
			$match = ($newText =~ s/$oldStr/$newStr/ige);
		} else {
			$match = ($newText =~ s/$oldStr/$newStr/ge);
		}

# ġȯ�Ǵ� ���� �ִ� ���
		if ($newText ne $Text{'text'}) {
			$num++;
			print "[$num] Processing $page ... $match string(s) were found.<br>";
			print &DiffToHTML(&GetDiff($Text{'text'}, $newText))."<br>";

			if (!$test) {	# �׽�Ʈ ��尡 �ƴ� ���� ����
				DoPostMain($newText, $page, "*", $Section{'ts'}, 0, 1, "!!");
			}
		}
	}

	print "Completed.";
	print &GetCommonFooter();
}

1;
