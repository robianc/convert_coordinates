use strict;
my $lon = 12;
my $lat = 56;
my $epsg_from = 4326;
my $epsg_UTM33N = 32633;

my ($x,$y) = ll2utm(Lon=>$lon,Lat=>$lat,Epsg=>$epsg_UTM33N,Format=>"%.2f");
my ($x,$y) = ll2utm(Lon=>$lon,Lat=>$lat,Epsg=>$epsg_UTM33N);
my ($lo,$la) = utm2ll(X=>$x,Y=>$y,Epsg=>$epsg_UTM33N,Format=>"%.5f");
my ($lo,$la) = utm2ll(X=>$x,Y=>$y,Epsg=>$epsg_UTM33N);
print "$lon;$lat --> $x,$y --> $lo;$la\n";

sub ll2utm {

    my %args = @_;
    my $lon = $args{Lon};
    my $lat = $args{Lat};
    my $epsg = $args{Epsg} || die;
    my $format =$args{Format} || "%.2f";
    my $epsg_from = 4326; # WGS84
    my ($xc,$yc) = split(/\s+/,qx/echo $lon $lat | cs2cs +init=epsg:$epsg_from +to +init=epsg:$epsg -f "$format"/);
    return ($xc,$yc);

}
sub utm2ll {

    my %args = @_;
    my $x = $args{X};
    my $y = $args{Y};
    my $epsg = $args{Epsg} || die;
    my $format =$args{Format} || "%.2f";
    my $epsg_to = 4326; # WGS84
    my ($xc,$yc) = split(/\s+/,qx/echo $x $y | cs2cs +init=epsg:$epsg +to +init=epsg:$epsg_to -f "$format"/);
    return ($xc,$yc);

}
