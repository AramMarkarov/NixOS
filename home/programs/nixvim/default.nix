{config, pkgs, inputs, ... }:
{
    programs.nixvim = {
        enable = true; viAlias = true; vimAlias = true; defaultEditor = true; extraPlugins = with pkgs.vimPlugins; [
            ]; colorschemes.rose-pine = {
          enable = true;
          settings = {
            styles.transparency = true;
            varient = "dawn";
            extend_background_behind_borders = true; };
        };
        opts = {
            number = true;
            relativenumber = true;
            cursorline = true;
            shiftwidth = 4;
          }; 
          plugins = {
              web-devicons = {
                enable = true;
              };
              neogit = {
                enable = true;
              };
              git-conflict = {
                enable = true;
              }; 
              gitblame = {
                enable = true;
              };
              gitgutter = { 
                enable = true;
              }; 
              headlines = {
                enable = true;
              };
              nix = {
                  enable = true;
                };
              hmts = {
                enable = true;
              };
              image = {
                enable = true;
                ueberzugPackage = pkgs.ueberzug;
                backend = "ueberzug";
              };
              vim-css-color = {
                enable = true;
              };
              neoscroll = {
                enable = true;
              };
              git-worktree = {
                enable = true;
              };
              gitignore = {
                enable = true;
              };
              nvim-surround = {
                enable = true;
              };
              copilot-vim = {
                enable = true;
              };
              copilot-chat = {
                enable = true;
              };
              lualine = {
                enable = true;
              };
              nvim-tree = {
                enable = true;
                view.width = 35;
                openOnSetup = true;
              };
              treesitter = {
                enable = true;
                settings = {
                  auto_install = false;
                  ensure_installed = "all";
                  highlight.enable = true;
                };
              };
              telescope = {
                enable = true;
              };
              harpoon = {
                enable = true;
              };
          };
      };
}
