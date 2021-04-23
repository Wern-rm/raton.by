var $navbar_logo_height = $('#navbar-logo-height');
var $navbar_logo_map = $('#navbar-logo-map');
var $padding_result_map = ($navbar_logo_height.height() - $navbar_logo_map.height()) / 2;
$navbar_logo_map.css({
    'padding-top': $padding_result_map
});