# usage :
# {{{#!gnuplot
# plot sin(x)
# }}}
#
# {{{#!gnuplot
# plot "data1.dat"
# ##FILE:data1.dat
# 1    2
# 2    3
# 3    3.5
# }}}

sub plugin_gnuplot {
    my ($content, @opt) = @_;
	my $plt = $content;
	my $log;

	my $gnuplot = "gnuplot";		# PATH of gnuplot;

# �׸� ������ �̸� ����
	my $hash;
	my $hasMD5 = eval "require Digest::MD5;";
	if ($hasMD5) {
		$hash = Digest::MD5::md5_base64($content);
		$hash =~ s/\W//g;
	} else {
		$hash = crypt($content, $HashKey);
		$hash =~ s/\W//g;
	}

	my $hashimage = "$hash.png";
	my $imgpath = "";
	my $GnuplotDir = "$UploadDir/gnuplot";
	my $GnuplotUrl = "$UploadUrl/gnuplot";

	if (-f "$GnuplotDir/$hashimage" && not -z "$GnuplotDir/$hashimage") {
		# �̹� �����Ǿ� ĳ���� ����
	} else {
		&CreateDir($UploadDir);
		&CreateDir($GnuplotDir);

		my $hashdir = "$TempDir/$hash";
		if (not -d $hashdir) {
			mkdir($hashdir, 0775) or return "[Unable to create $hash dir]";
		}

		my $pwd = `pwd`;
		$pwd =~ s/(.*)(\n|\r)*/$1/;

# �Է� �ؽ�Ʈ �� ������ �и��Ͽ� ����
		my @blocks = split(/\n##FILE:/, $content);
		$plt = shift @blocks;
		
		foreach my $block (@blocks) {
			if ($block =~ /^(\S+)\n((.|\n)*)$/) {
				my ($filename, $filetext) = ($1, $2);
				&WriteStringToFile("$hashdir/$filename", $filetext);
			}
		}

# for security (code from MoniWiki)
		$plt = "\n".$plt."\n";
		$plt =~ s/^\s*![^\n]+$//gim;	# strip shell commands
		$plt =~ s/[ ]+/ /gi;
		$plt =~ s/^\s*set?\s+(t|o).*$//gim;

		my $input = << "EOT";
set size 0.5,0.6
set term png
set out '$hashimage'
$plt
EOT

		&WriteStringToFile("$hashdir/gnuplot.dat", $input);

		chdir ($hashdir);
		
		open SAVEOUT, ">&STDOUT";
		open SAVEERR, ">&STDERR";
		open STDOUT, ">hash.log";
		open STDERR, ">&STDOUT";

# �׸� ����
		qx($gnuplot gnuplot.dat);

		close STDOUT;
		close STDERR;
		open STDOUT, ">&SAVEOUT";
		open STDERR, ">&SAVEERR";

# �׸� �ű�
		chdir($pwd);
		if (-f "$hashdir/$hashimage" && not -z "$hashdir/$hashimage") {
			my $png = &ReadFile("$hashdir/$hashimage");
			&WriteStringToFile("$GnuplotDir/$hashimage", $png);
		} else {
			$log = &ReadFile("$hashdir/hash.log");
			$log = "[Error retrieving image from hashdir]\n$log";

		}
		unlink (glob("$hashdir/*")) or return "[unlink fail]";
		rmdir ($hashdir) or return "[rmdir fail]";
	}
	if ($log ne '') {
		$imgpath = "<pre>\n$log\n</pre>";
	}
	$imgpath .= "<img src='$GnuplotUrl/$hashimage' alt='gnuplot'>";
    return $imgpath;
}

1;

