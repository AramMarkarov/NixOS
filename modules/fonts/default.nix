{ config, lib, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.hack
    nerd-fonts._0xproto
    nerd-fonts.symbols-only
    nerd-fonts.fira-mono
    nerd-fonts.zed-mono
    nerd-fonts.tinos

  ];
}
