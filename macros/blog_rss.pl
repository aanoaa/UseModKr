# <blog_rss(����������[,��α�������])>
# XML�����ܰ� RSS�� URL ��ũ�� ���

sub blog_rss {
	my ($txt) = @_;

	$txt =~ s/\&__LT__;blog_rss\((.*?)\)&__GT__;/&MacroBlogRss($1)/gei;

	return $txt;
}

sub MacroBlogRss {
	use strict;
	my ($arg) = @_;
	my $txt;

	my ($listpage, $blogpage);
	if ($arg =~ /^([^,]+)(,([^,]+))?$/) {
		($listpage, $blogpage) = ($1, $3);
	} else {
		return "<font color='red'>Invalid args</font>";
	}

	$listpage = &RemoveLink($listpage);
	$listpage = &FreeToNormal($listpage);
	$blogpage = &RemoveLink($blogpage);
	$blogpage = &FreeToNormal($blogpage);

	$txt = &ScriptLink("action=blog_rss&listpage=$listpage&blogpage=$blogpage",
			"<img align='absmiddle' src='$IconDir/xml_rss.gif'> Get XML");

	return $txt;
}

1;
