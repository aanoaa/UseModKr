#!/usr/bin/perl

# ������
$DataDir = "data";
$ConfigFile = "config.pl";
if (-f $ConfigFile) {
	do "$ConfigFile";
} else {
	die "Can not load config file";
}

$filename = "oekaki.png";

# POST ����Ÿ ����
read (STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
$p = index($buffer, "\r");

# ���� ó��
if ($p < 0) {
	$size = length($buffer);
	print "mod_oekaki.pl error : data size $size\n";
	die "mod_oekaki.pl error : data size $size\n";
}

# ���� ȹ��
&RequestLockDir('oekaki', 5, 2, 0) || die "can not get lock";

# ������ ȭ�ϸ� ����
$prefix = &GetLastPrefix($UploadDir, $filename);
if ($prefix == 0) {
	$prefix = "";
} else {
	$prefix = ($prefix+1)."_";
}
$target_full = $UploadDir."/".$prefix.$filename;

# ����
&CreateDir($UploadDir);
&WriteStringToFile($target_full, substr($buffer, $p+2));

# ���� ����
&ReleaseLockDir('oekaki');

chmod(0644, "$target_full");

# ����
print "Content-type: text/plain\n\n";
print "success\n";
1;

### wiki.pl ���� ������ �Լ���

### ȭ�ϸ��� ��ĥ ��� ���� �ֱ� ȭ���� prefix �� ��� �Լ�
sub GetLastPrefix {
	my ($dir, $file) = @_;

	if (!(-f "$dir/$file")) {
		return 0;
	}
	
	if (!(-f "$dir/2_$file")) {
		return 1;
	}

	my $prefix = 2;
	while (-f "$dir/$prefix"."_$file") {
		$prefix += 10;
	}
	$prefix -= 10;
	while (-f "$dir/$prefix"."_$file") {
		$prefix++;
	}

	return ($prefix - 1);
}

sub WriteStringToFile {
	my ($file, $string) = @_;

	open (OUT, ">$file") or die "cant write ". $file . ": $!";
	print OUT  $string;
	close(OUT);
}

sub CreateDir {
	my ($newdir) = @_;

	if (!(-d $newdir)) {
		mkdir($newdir, 0775) or die "cant create directory ". $newdir. ": $!";
	}
}

sub RequestLockDir {
	my ($name, $tries, $wait, $errorDie) = @_;
	my ($lockName, $n);

	&CreateDir($TempDir);
	$lockName = $LockDir . $name;
	$n = 0;
	while (mkdir($lockName, 0555) == 0) {
		if ($! != 17) {
			die "can not make ". $LockDir. ": $!\n"  if $errorDie;
			return 0;
		}
		return 0  if ($n++ >= $tries);
		sleep($wait);
	}
	return 1;
}


sub ReleaseLockDir {
	my ($name) = @_;
	rmdir($LockDir . $name);
}
