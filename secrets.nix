let
  fonts = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEyHG9JyTC3kTOvbpIcvWJN8PlAX35/txp5UkIdw85tu" ];
  personal_fonts = "./modules/form/fonts/personal";
  font_bml = "BML-v1_009";
  font_mll = "MLL-v1_808";
in
{
    "${personal_fonts}/${font_bml}-Bold.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_bml}-BoldItalic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_bml}-Italic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_bml}-Regular.ttf.age".publicKeys = fonts;

    "${personal_fonts}/${font_mll}-Black.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-BlackItalic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-Bold.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-BoldItalic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-ExtraLight.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-ExtraLightItalic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-Light.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-LightItalic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-Medium.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-MediumItalic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-Regular.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-RegularItalic.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-Thin.ttf.age".publicKeys = fonts;
    "${personal_fonts}/${font_mll}-ThinItalic.ttf.age".publicKeys = fonts;
}
