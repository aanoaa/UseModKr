# <rss([�ɼ�])>
# action=rss[&�ɼ�] �� ���·� ��ũ ��ȯ

sub rss {
	my ($txt) = @_;

	$txt =~ s/\&__LT__;rss\((.*?)\)&__GT__;/&MacroRss($1)/gei;

	return $txt;
}

sub MacroRss {
	use strict;
	my ($arg) = @_;
	my $txt;

	if ($arg ne "") {
		$arg = "&".$arg;
	}

	$txt = &ScriptLink("action=rss$arg",
			"<img align='absmiddle' src='$IconDir/xml_rss.gif'> Get RSS of Entire Wiki");

	return $txt;
}

1;
