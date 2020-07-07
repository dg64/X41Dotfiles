#!/usr/bin/perl
#
my $row2 = calRow(2);
my $row3 = calRow(3);
my $row4 = calRow(4);
my $row5 = calRow(5);
my $row6 = calRow(6);
my $row7 = calRow(7);
my $row8 = calRow(8);

chomp($row2);
chomp($row3);
chomp($row4);
chomp($row5);
chomp($row6);
chomp($row7);
chomp($row8);

$row2 =~ s/\s+$//;
$row3 =~ s/\s+$//;
$row4 =~ s/\s+$//;
$row5 =~ s/\s+$//;
$row6 =~ s/\s+$//;
$row7 =~ s/\s+$//;
$row8 =~ s/\s+$//;

#my $date1 = `date +%A\ \ \ \ \ \ \ \ \ \ \ \ %I\:%M\ %p`;
#my $date2 = `date +%B\ %d,\ %Y`;

sub calRow() {
	my $par = $_[0];
	my $CMD = "cal | gawk -v row=$par '{ if (NR==row) { print \$0 } }'";
	my $output = `$CMD`;
	return $output;
}

print <<EOFMENU;
<openbox_pipe_menu>
	<separator label="aa" />
	<item label="bb" />
	<separator />
	<item label="$row2" />
	<item label="$row3" />
	<item label="$row4" />
	<item label="$row5" />
	<item label="$row6" />
	<item label="$row7" />
	<item label="$row8" />
</openbox_pipe_menu>
EOFMENU

