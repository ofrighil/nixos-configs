{ pkgs, ... } : {
  age.secrets."MLL-v1_808-Regular.ttf.age" = {
    symlink = false;
    file = ./personal/MLL-v1_808-Regular.ttf.age;
    path = "/home/ofrighil/.local/share/fonts/MLL-v1_808-Regular.ttf";
    mode = "444";
  };

  age.secrets."MLL-v1_808-RegularItalic.ttf.age" = {
    symlink = false;
    file = ./personal/MLL-v1_808-RegularItalic.ttf.age;
    path = "/home/ofrighil/.local/share/fonts/MLL-v1_808-RegularItalic.ttf";
    mode = "444";
  };

  fonts.packages = with pkgs; [
    intel-one-mono
    sarasa-gothic
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { 
      fonts = [ "Iosevka" "IosevkaTerm" "Mononoki" "NerdFontsSymbolsOnly" ];
    })
  ];
}
