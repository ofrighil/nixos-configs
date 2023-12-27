let
  fonts = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEyHG9JyTC3kTOvbpIcvWJN8PlAX35/txp5UkIdw85tu" ];
  font-mll = "MLL-v1_808";
in
{
    "./form/fonts/personal/${font-mll}-Black.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-BlackItalic.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-Bold.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-BoldItalic.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-ExtraLight.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-ExtraLightItalic.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-Light.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-LightItalic.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-Medium.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-MediumItalic.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-Regular.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-RegularItalic.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-Thin.ttf.age".publicKeys = fonts;
    "./form/fonts/personal/${font-mll}-ThinItalic.ttf.age".publicKeys = fonts;
}
