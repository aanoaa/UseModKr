#!/usr/bin/perl


#   �� ���Ͽ��� ������ ���� ù���� ��path(usr/bin/perl or usr/local/bin/perl)
#   �ۿ��� �����ϴ�.                          

####################################################################################
#                                                                                  #
#      ���α׷��̸� : kimsBOARD                                                    #
#            ������ : �輺ȣ(w3master@kimsworld.net)                               #
#            ����ó : http://www.kimsworld.net                                     #
#          ���̼��� : �� �ҽ��� ������� �뵵�� �ƴѰ�쿡 ���ο� ���ؼ� ��������  #
#                     �̸� �ҽ��� �����Ͽ� ����� ��� �����ڿ� �ݵ�� ���Ǹ� ���� #
#                     �� �ϸ� ������ �ҽ��� ��� ��쿡�� ����� �� �� �����ϴ�. #
#            ���۱� : �� �ҽ��� ���� ���۱��� �������� �輺ȣ���� �ֽ��ϴ�.        #
#                                                                                  #
#                                                                                  #
####################################################################################



if($ENV{'QUERY_STRING'} ne "") {
    @pairs = split(/&/,$ENV{'QUERY_STRING'});
    }
    else {
        $buffer = "";
        read(STDIN,$buffer,$ENV{'CONTENT_LENGTH'});
        @pairs = split(/&/, $buffer);
        }
        
        foreach $pair (@pairs) {
            ($name, $value) = split(/=/,$pair);

            $value =~ tr/+/ /;
            $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;

            $FORM{$name} = $value;
    }
  
$CgiUrl = "kimsnobody.pl";
# $CgiUrl = "kimsnobody.cgi";
$BaseDir = "./";
$ImgUrl = "http://www.junksf.net/kimsboard/image";

     if ($FORM{'action'} eq "remove") {remove_file();}
  elsif ($FORM{'action'} eq "view") {starting(); open_directory(); ending();}
  else {starting(); open_directory(); ending();}
	

###############################################################################
sub open_directory {
print "<form action=$CgiUrl method=post>
       <table border=0 width=700 bgcolor=gray cellspacing=1 cellpadding=1>
  <tr>
    <td bgcolor=C0C0C0 align=center><font face=����><strong>NO.</strong></font></td>
    <td bgcolor=C0C0C0 align=center><font face=����><strong>����</strong></font></td>
    <td bgcolor=C0C0C0 align=center><font face=����><strong>���丮 �� ����</strong></font> <font color=red face=����>[������] <input type=text size=40 name=dir value=\"$FORM{'value'}/\">
     <a href=$CgiUrl>[ó��]</a> <a href=javascript:history.go(-1)>[�ڷ�]</a> <a href=\"$CgiUrl?action=$FORM{'action'}&value=$FORM{'value'}\">[���ε�]</a></font></td>
    <td bgcolor=C0C0C0 align=center><font face=����><strong>����</strong></font></td>
    <td bgcolor=C0C0C0 align=center><font face=����><strong>����</strong></font></td>
  </tr></form>\n";    
  
if(!$FORM{'value'}) {$FORM{'value'} = $BaseDir;} else {$FORM{'value'} = "$FORM{'value'}/"; }
opendir(DIRECTORY, "$FORM{'value'}");
@data = readdir(DIRECTORY);
closedir(DIRECTORY);
$pp = 1;

foreach $data (@data) {

if(($data ne ".") && ($data ne "..")) {

file_type();

print "<tr>
    <td align=center bgcolor=EEEEEE><font color=black><b>$pp</b></font></td>\n";
if(!opendir(DIRECTORY, "$FORM{'value'}$data")) {
print "<td align=center bgcolor=white>$wtype</td>
       <td align=center bgcolor=white><a href=\"$FORM{'value'}$data\" target=_blank><font color=blue>$data</font></a></td>
       <td align=center bgcolor=eeeeee> </td>
       <td align=center bgcolor=eeeeee><a href=\"$CgiUrl?action=remove&value=$FORM{'value'}$data\">Del</a></td></tr>\n";
    }
else{ 
print "<td align=center bgcolor=white>Dir</td>
       <td align=center bgcolor=white><a href=\"$FORM{'value'}$data\" target=_blank><font color=blue><b>$data</b></font></a></td>
       <td align=center bgcolor=eeeeee><a href=\"$CgiUrl?action=view&value=$FORM{'value'}$data\">View</a></td>
       <td align=center bgcolor=eeeeee><a href=\"$CgiUrl?action=remove&value=$FORM{'value'}$data\">Del</a></td></tr>\n";
}

$pp++;
}
}
print "</table>\n";
}
###############################################################################
sub remove_file {

if(!opendir(DIRECTORY, "$FORM{'value'}")) {
print `chmod 777 $FORM{'value'}`;
unlink ("$FORM{'value'}");
print "unlink" . $FORM{'value'};
}
else {
print `rmdir -rf $FORM{'value'}`;
print `chmod 777 $FORM{'value'}`;
rmdir ("$FORM{'value'}");
opendir(DIRECTORY, "$FORM{'value'}");
@data = readdir(DIRECTORY);
closedir(DIRECTORY);

foreach $data (@data) {
unlink ("$FORM{'value'}/$data");
}
print `chmod 777 $FORM{'value'}`;
rmdir ("$FORM{'value'}");
}
starting();
open_directory();
ending();
}
################################################################################
sub starting {
print "Content-type: text/html\n\n";
print "
<!---------------------------------------------------------------------->
<!--                                                                  -->
<!--  KIMSBOARD kimsnobody.cgi                                        -->
<!--                                                                  -->
<!--  ������ : �輺ȣ                                               -->
<!--  Ȩ������ : http://www.kimsworld.net                             -->
<!--  ���ڿ��� : w3master\@kimsworld.net                               -->
<!--  ������¥ : 2000.03.05                                           -->
<!--                                                                  -->
<!--  ���α׷��� ���� ���� Ȩ������ �Խ����̳� �̸����� ���� ������   -->
<!--  �ֽñ� �ٶ��ϴ�.                                                -->
<!--  Copyright (c) Kim Seong-ho All rights reserved.                 -->
<!--                                                                  -->
<!---------------------------------------------------------------------->";
  print "
  <HTML>
  <HEAD><TITLE>kims nobody_file killer</TITLE>
 <style>
 <!--
  A:link {text-decoration:none}
  A:visited {text-decoration:none}
  A:hover {  text-decoration:none;  color:black;}
   p,br,body,td,input,form,textarea,option {font-size:9pt;}
   select    { background-color:white;}
  .button   { height:21px; border-width:1; border-style:ridge; border-color:#d0d0d0; background-color:;}
  .bot { cursor: hand; font: 9pt ����; height: 20px; border-width: 1px 1px 1px 1px; border-color: 888888; color: white; background: 666666; }
  .editbox  { border:1 solid black; background-color:white; }
  .ver8 {font-family:Verdana,Arial,����;font-size:8pt}
  .ad{border:1 solid black}
  .family{line-height:140%}
 -->
 </style>\n";
 if($FORM{'action'} eq "remove") {       
       print "<META http-equiv=\"refresh\" content =\"0;url=$CgiUrl?action=view&value=$FORM{'value'}\">\n";
       }
  print "</HEAD>
  <BODY BGCOLOR=#eeeeee>\n";
  print"<center><font size=3><b> [ Kims NOBODY_FILE Killer 0.0.5 ] </b></font><p>\n";
}
###############################################################################
sub ending {
  print "
  <p><hr width=700 size=0>�� ������ nobody�� ������ ���ϰ� �۹̼��� rwx-rwx-rwx�� ���ϸ� ���� �� �ֽ��ϴ�.<br>
     �� ������ ���ε��ϱ��� �켱 ������� �ϴ� ���丮 �� ������ �ڳ��̳� ftp���� �ִ��� �����ݴϴ�.<br>
     ftp�� �ڳݿ��� �������� �ʴ� ���丮�� ������ �������ݴϴ�..<br>
     [����] nobody�� �ƴ� ������ nobody���� ���̿� ���� ������ �Ѳ����� �����ϱ�� �ȵ˴ϴ�.
  <hr width=700 size=0><br><a href=http://www.kimsworld.net>Created by kims</a></center></font></BODY>
  </HTML>
  \n";
  exit;
}
################################################################################[���������ľ�]
sub file_type {
    $word = $data;
    if($word =~ /.gif/) {$wtype = "Image";} 
    elsif($word =~ /.jpg/) {$wtype = "Image";} 
    elsif($word =~ /.jpeg/) {$wtype = "Image";} 
    elsif($word =~ /.htm/) {$wtype = "html";} 
    elsif($word =~ /.html/) {$wtype = "html";} 
    elsif($word =~ /.zip/) {$wtype = "arc";} 
    elsif($word =~ /.tar/) {$wtype = "arc";} 
    elsif($word =~ /.bmp/) {$wtype = "Image";} 
    elsif($word =~ /.exe/) {$wtype = "exe";} 
    elsif($word =~ /.doc/) {$wtype = "doc";} 
    elsif($word =~ /.cgi/) {$wtype = "cgi";}
    elsif($word =~ /.ph/) {$wtype = "cgi";}
    elsif($word =~ /.class/) {$wtype = "cgi";} 
    elsif($word =~ /.js/) {$wtype = "script";}  
    elsif($word =~ /.pl/) {$wtype = "cgi";} 
    elsif($word =~ /.ppt/) {$wtype = "doc";} 
    elsif($word =~ /.mp3/) {$wtype = "media";} 
    elsif($word =~ /.mpeg/) {$wtype = "media";} 
    elsif($word =~ /.swf/) {$wtype = "media";} 
    elsif($word =~ /.mpg/) {$wtype = "media";} 
    elsif($word =~ /.asx/) {$wtype = "media";}    
    elsif($word =~ /.txt/) {$wtype = "doc";} 
    elsif($word =~ /.rar/) {$wtype = "arc";} 
    elsif($word =~ /.xls/) {$wtype = "doc";} 
    elsif($word =~ /.hwp/) {$wtype = "doc";} 
    elsif($word =~ /.mid/) {$wtype = "doc";} 
    elsif($word =~ /.ra/) {$wtype = "media";} 
    elsif($word =~ /.ram/) {$wtype = "media";}
    else {$wtype = "unknown"}
 }
