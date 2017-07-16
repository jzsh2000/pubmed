#!/usr/bin/perl

# from https://www.ncbi.nlm.nih.gov/books/NBK179288/ (page 90-91)

my $max = scalar @ARGV;
if ( $max < 1 ) {
  die "Need argument for database\n";
}
my $db = $ARGV[0];

my $thisline = "";
my $laststr = "";
my $str = "";
my $uid = "";
my $uidlist = "";
my $count = 0;
my $base = "https://www.ncbi.nlm.nih.gov";

my $pfx = "";
while ($thisline = <STDIN>) {
  $thisline =~ s/\r//;
  $thisline =~ s/\n//;

  if ($thisline =~ /^([^\t]+)\t(.+)$/) {
    $uid = $1;
    $str = $2;

    if ( lc ($str) ne lc ($laststr) and $laststr ne "" ) {
      $laststr =~ s/\t/, /g;
      print "<p>(<a href=\"$base/$db/$uidlist\">";
      print " $count </a>) - $laststr</p>\n";
      $pfx = "";
      $count = 0;
      $uidlist = "";
    }
    $laststr = $str;

    $uidlist .= "$pfx$uid";
    $pfx = ",";
    $count++;
  }
}

if ( $laststr ne "" ) {
  $laststr =~ s/\t/, /g;
  print "<p>(<a href=\"$base/$db/$uidlist\">";
  print " $count </a>) - $laststr</p>\n";
}
