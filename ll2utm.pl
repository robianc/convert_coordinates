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
