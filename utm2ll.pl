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
