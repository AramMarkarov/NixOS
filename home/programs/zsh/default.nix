{ config, pkgs, ... }:

{
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" "extract" "dirhistory" "sudo"
      ];
    };
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
        ll = "ls -l";
        update = "cd ~/NixOS && nix flake update && sudo nixos-rebuild switch --flake .#nixos && cd";
    };
    history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
        fastfetch
        '';
};

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "night-owl";
  };
}
