# <blog_newpost(����������)>
# ������������ �� �� ����� ��¥�� �Է��ϴ� ���� ���
# ���� ��ư�� ������ �� ��ũ�� �ִ� �ڸ��� ġȯ��

$MacroFunc{"blog_newpost"} = \&blog_newpost;

sub blog_newpost {
	my ($txt) = @_;

	$txt =~ s/\&__LT__;blog_newpost\((.+)\)\&__GT__;/&MacroBlogNewPost($1)/gei;

	return $txt;
}

sub MacroBlogNewPost {
	use strict;
	my ($id) = @_;
	my $txt;

	$id = &RemoveLink($id);
	$id = &FreeToNormal($id);

	if (my $temp = &ValidId($id)) {
		return "<font color='red'>$temp</font>";
	}

	my ($readonly_true, $readonly_style, $readonly_msg);
	my ($title_field, $date_field, $submit_button);

	if (!&UserCanEdit($id,1)) {
		$readonly_true = "true";
		$readonly_style = "background-color: #f0f0f0;";
		$readonly_msg = T('Editing Denied');
		$submit_button = "";
		$title_field = $q->textfield(-name=>"title",
									-class=>"comments",
									-size=>"50",
									-maxlength=>"100",
									-readonly=>"$readonly_true",
									-style=>"$readonly_style",
									-default=>"$readonly_msg");
		$date_field = $q->textfield(-name=>"date",
									-class=>"comments",
									-size=>"10",
									-maxlength=>"10",
									-readonly=>"$readonly_true",
									-style=>"$readonly_style",
									-default=>"");
	} else {
		my $today = &CalcDay($Now);
		$today =~ s/-(\d)-/-0$1-/g;
		$today =~ s/-(\d)$/-0$1/g;
		$submit_button = $q->submit(-name=>"Submit",-value=>T("Submit"));
		$title_field = $q->textfield(-name=>"title",
									-class=>"comments",
									-size=>"50",
									-maxlength=>"100",
									-default=>"");
		$date_field = $q->textfield(-name=>"date",
									-class=>"comments",
									-size=>"10",
									-maxlength=>"10",
									-default=>"$today");
	}

	$txt =
		$q->startform(-name=>"newpost",-method=>"POST",-action=>"$ScriptName") .
		&GetHiddenValue("action","blog_newpost") .
		&GetHiddenValue("id","$id") .
		&GetHiddenValue("pageid","$pageid") .
		T('Title will be converted into [[/Title]] automatically.')."<BR>".
		T('Title:')." ".
		$title_field."&nbsp;".
		T('Date').": ".
		$date_field."&nbsp;".
		$submit_button.
		$q->endform;

	return $txt;
}

1;
