#!/usr/bin/perl

# CGI script to copy directory for restoration
# by gypark (raymundo@kebi.com)
# 2003-03-10

# �ٸ� ���� ����ص� ��Ű ����Ÿ�� nobody �� �������� �����Ͽ� �����ϴ� ��ũ��Ʈ�Դϴ�.
# ��ũ��Ʈ�� �۹̼��� 755 �� ������ �� ���������� ���� �����ϼ���.

umask 0;

# �Ķ���� ����
if ($ENV{'QUERY_STRING'} ne "") {
	@pairs = split(/&/, $ENV{'QUERY_STRING'});
} else {
	$buffer = "";
	read (STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
	chomp $buffer;
	@pairs = split(/&/, $buffer);
}

foreach (@pairs) {
	($name, $value) = split(/=/, $_);
	$value =~ tr/+/ /;
	$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
	$param{$name} = $value;
}

# ����
if (defined($param{'source'}) && defined($param{'dest'})) {
	print_header();
	if (copy_dir($param{'source'}, $param{'dest'})) {
		print "<p><b>���������� ����Ÿ�� �����߽��ϴ�.</b>";
	} else {
		print "<p><b>����Ÿ ���翡 �����߽��ϴ�.</b>";
		print_form();
		print_footer();
	}
	exit;
} else {
	print_header();
	print_form();
	print_footer();
	exit;
}


sub print_header {
	print "Content-type: text/html\n\n";
	print <<END_OF_FILE;
<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=EUC-KR">
<title>restore the files to nobody's permission</title>
</head>
<body>
���丮�� ������ �ִ� ��ũ��Ʈ �Դϴ�.<br>
���������� ���ؼ� CGI �� ������ �ϸ�,<br>
�ڽ��� ����� �� ��Ű����Ÿ ���丮�� �����Ͽ�<br>
nobody ������ ���丮�� ȭ�Ϸ� ����� �ݴϴ�.<br>
<p>
<hr>
END_OF_FILE
}

sub print_form {
	print <<END_OF_FILE;
<form method="post" action="restore.pl" name="form_input">
<p>
��ũ��Ʈ�� ���: $0<br>\n
<p>
������ ����Ÿ ���丮�� ��� : <input type="text" name="source" size="60" value="$param{'source'}" /><br>\n
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (��: /home/foo/backup/data)<br>\n
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (�� ���丮�� �ý��ۿ� �����ؾ� �մϴ�)<br>\n
<p>
������ ����Ÿ ���丮�� ��� : <input type="text" name="dest" size="60" value="$param{'dest'}" /><br>\n
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (��: /home/foo/public_html/cgi-bin/wiki/data)<br>\n
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (�� ���丮�� �ý��ۿ� �����ϰ�, �۹̼��� 777�� �Ǿ� ������,<br>\n
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ���丮 �ȿ� �ٸ� ȭ���̳� ���丮�� ����� �մϴ�)<br>\n
<p>
<input type="submit" name="copy" value="����" />
</form>
END_OF_FILE
}

sub print_footer {
	print <<END_OF_FILE;
</body>
</html>
END_OF_FILE
}

sub copy_dir {
	my ($source, $dest) = @_;

	if ($source eq "") {
		print "<p><b>���� ���丮�� ��θ� �Է��ϼ���</b>";
		return 0;
	}
	if ($dest eq "") {
		print "<p><b>������ ��� ���丮�� ��θ� �Է��ϼ���</b>";
		return 0;
	}
	if (!(-d $source)) {
		print "<p><b>���� ��ΰ� �������� �ʰų�, ���丮�� �ƴմϴ�</b>";
		return 0;
	}
	if (!(-d $dest)) {
		print "<p><b>��� ��ΰ� �������� �ʰų�, ���丮�� �ƴմϴ�</b>";
		return 0;
	}
	if (!(-w $dest)) {
		print "<p><b>��� ����� �۹̼��� �ùٸ��� �ʽ��ϴ�</b>";
		return 0;
	}
	opendir(DIR, $dest);
	my @files = readdir(DIR);
	if ($#files != 1) {
		print "<p><b>��� ���丮�� ��� ���� �ʽ��ϴ�</b>";
		return 0;
	}
	print "<p><b>����Ÿ ���縦 �����մϴ�.</b>";
	if (copy_dir_recursive($source, $dest)) {
		return 1;
	} else {
		return 0;
	}

}

sub copy_dir_recursive {
	my ($source, $dest) = @_;
	if (!opendir (SOURCEDIR, "$source")) {
		print "<p><b>$source ���丮�� ���� �� �����߽��ϴ�: $!</b>" ; 
		return 0; 
	}
	my @sourcefiles = readdir(SOURCEDIR);
	closedir SOURCEDIR;

	print "<br>enter [$source] ...";
	foreach my $file (@sourcefiles) {
		next if (($file eq ".") || ($file eq ".."));
		if (-d "$source/$file") {
			mkdir ("$dest/$file", 0775) or die "$dest/$file ���丮 ���� ���� : $!";
			copy_dir_recursive("$source/$file", "$dest/$file");
		} else {
			my $content;
			print "<br>copying [$file] to [$dest] ...";
			open (SRCFILE, "<$source/$file");
			open (DESTFILE, ">$dest/$file");
			while ($content = <SRCFILE>) {
				print DESTFILE $content;
			}
			close (SRCFILE);
			close (DESTFILE);
		}
	}
	return 1;
}
