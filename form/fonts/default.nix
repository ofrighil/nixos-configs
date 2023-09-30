{ pkgs, ... } : {
  fonts.fonts = with pkgs; [
    intel-one-mono
    sarasa-gothic
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "Iosevka" "IosevkaTerm" "Mononoki" "NerdFontsSymbolsOnly" ]; })
  ];
}
