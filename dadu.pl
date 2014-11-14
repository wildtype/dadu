#!/usr/bin/env perl -l
use strict;
use warnings;

sub kocok
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

foreach(1..100){
print kocok {start=>10,stop=>20};
}

