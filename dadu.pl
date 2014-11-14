#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
#use POSIX;

sub isdigit
{
    $_ = shift;
    return 1 if (/^\d+$/);
    return 0;
}

sub dadu
{
    my ($param) = @_;
    if(defined $param) {
        my $start = $param->{start};
        my $stop = $param->{stop};
        return int(rand(($stop-$start)+1)+$start);
    } else {
        return int(1.5+rand(5)); #dadu simpel, 1-6
    }
}

if(defined @ARGV) {
    my $numarg = @ARGV;
    if($numarg==1) {
        my $arg = $ARGV[0];
        if (isdigit($arg)) {
            say dadu({start=>0,stop=>$ARGV[0]});
        } else {
            say STDERR "Error: parameter batas atas bukan angka";
        }
    } elsif ($numarg==2) {
        my $bawah = $ARGV[0];
        my $atas = $ARGV[1];
        if (isdigit($atas) && isdigit($bawah)) {
            say dadu({start=>$bawah,stop=>$atas});
        } else {
            say STDERR "Error: parameter batas atas atau bawah bukan angka";
        }
    }
} else {
    say dadu;
}
