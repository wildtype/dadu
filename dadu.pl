#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

sub isdigit
{
    $_ = shift;
    return 1 if (/^\d+$/);
    return 0;
}

sub dadu
{
    my ($param) = @_;
    if (defined $param) {
        my $start = $param->{start};
        my $stop = $param->{stop};
        return int(rand(($stop-$start)+1)+$start);
    } else {
        return int(1.5+rand(5)); #dadu simpel, 1-6
    }
}

sub pilih
{
    return $_[int(rand(@_))];
}

if (defined @ARGV) {
    my $numarg = @ARGV;
    if (($numarg==1) && isdigit($ARGV[0])) {
        #satu argumen program berupa angka N,
        #hasilkan angka random antara 0 sampai N
        say dadu({start=>0,stop=>$ARGV[0]});
    } elsif (($numarg==2) && isdigit($ARGV[0]) && isdigit($ARGV[1])) {
        #dua argumen program berupa angka M dan N, 
        #hasilkan angka random antara M dan N
        say dadu({start=>$ARGV[0],stop=>$ARGV[1]});
    } else {
        #argumen berapapun dianggap sebagai kata
        #pilih salah kata
        say pilih(@ARGV);
    }
} else {
    #tanpa argumen
    #hasilkan hasil kocokan dadu biasa
    say dadu;
}
