use strict;
my $lon = 12;
my $lat = 56;
my $epsg_from = 4326;
my $epsg_to = 32633;

my ($x,$y) = convert_coordinates(X=>$lon,Y=>$lat,EpsgFrom=>$epsg_from,EpsgTo=>$epsg_to,Format=>"%.2f");
my ($lo,$la) = convert_coordinates(X=>$x,Y=>$y,EpsgFrom=>$epsg_to,EpsgTo=>$epsg_from,Format=>"%.5f");
print "$lon;$lat --> $x,$y --> $lo;$la\n";

sub convert_coordinates {

    my %args = @_;
    my $x = $args{X};
    my $y = $args{Y};
    my $epsg_from =$args{EpsgFrom} || die;
    my $epsg_to =$args{EpsgTo} || die;
    my $format =$args{Format} || die;
    my ($xc,$yc) = split(/\s+/,qx/echo $x $y | cs2cs +init=epsg:$epsg_from +to +init=epsg:$epsg_to -f "$format"/);
    return ($xc,$yc);

}
