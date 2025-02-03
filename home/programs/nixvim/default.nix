{config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    enable = true; viAlias = true; vimAlias = true; defaultEditor = true; 
    # command-completion.nvim focus.nvim
    extraPlugins = with pkgs.vimPlugins; [ ]; 
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        code_font_family = "0_xProto Nerd Font";
        styles.transparency = false;
        varient = "dawn";
        extend_background_behind_borders = true; };
    };
    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      softtabstop = 4;
      colorcolumn = "80";
      smartindent = true;
      swapfile = false;
      backup = false;
      undodir = "/home/aramjonghu/.config/nvim/undodir";
      undofile = true;
      termguicolors = true;
      scrolloff = 8;
    }; 
    plugins = {
      auto-session = {
        enable = true;
        settings = { # settings needed callchat
        };
      };
      cmp = {
        enable = true;
      };
      presence-nvim = { # prescense so that discord knows when im in nvim
        enable = true;
      };
      conform-nvim = { # formatter
        enable = true;
      };
      undotree = { # Undotree settings needed, keybinds
        enable = true;
      };
      web-devicons = { # provides nerdfonts icons
        enable = true;
      };
      neogit = { # a git like instance to do git stuff
        enable = true;
      };
      gitgutter = { # shows which push the version was a part of of each row/line
        enable = true;
      }; 
      nix = {
        enable = true;
      };
      hmts = {
        enable = true; # makes different syntax langauges show within a .nix file
      };
      image = { # allows images to be viewed in nvim (seems to not work within zellij/tmux)
        enable = true;
        ueberzugPackage = pkgs.ueberzugpp;
        backend = "ueberzug";
        hijackFilePatterns = [
          "*.png"
          "*.jpg"
          "*.jpeg"
          "*.gif"
          "*.webp"
          "*.JPG"
          "*.JPEG"
        ];
      };
      vim-css-color = { # css color highlighting
        enable = true;
      };
      neoscroll = { # supposed to do smooth scrolling among other things
        enable = true;
      };
      git-worktree = { 
        enable = true;
      };
      gitignore = { # able to generate .gitignore, even offline
        enable = true;
      };
      nvim-surround = { # Can surround ( { [ and complete functions etc. with keybinds
        enable = true;
      };
      #copilot-vim = { 
      #  enable = true;
      #  settings = {
      #    panel = {
      #      enabled = true;
      #      auto_refresh = true;
      #      keymap = {
      #        jump_prev = "[[";
      #        jump_next = "]]";
      #        accept = "<CR>";
      #        refresh = "gr";
      #        open = "<M-CR>";
      #      };
      #    };
      #    suggestion = {
      #      enabled = true;
      #      auto_trigger = true;
      #      hide_during_completion = true;
      #      debounce = 75;
      #      keymap = {
      #        accept = "<A-tab>";
      #        accept_word = false;
      #        accept_line = false;
      #        next = "<M-]>";
      #        prev = "<M-[>";
      #        dismiss = "<C-]>";
      #      };
      #    };
      #  };
      #};
      copilot-chat = { # Copilot chat settings needed
        enable = true;
      };
      lualine = { # the statusline on the bottom, editable
        enable = true;
      };
      nvim-tree = { # file tree explorer
        enable = true;
        view.width = 35;
        openOnSetup = true;
      };
      treesitter = { # syntax highlighter and more for many languages
        enable = true;
        settings = {
          auto_install = true;
          ensure_installed = "all";
          highlight.enable = true;
          highlight.additional_vim_regex_highlighting = false;
          indent.enable = true;
        };
      };
      rainbow-delimiters = {
        enable = true;
      };
      telescope = { # search and stuff, current keybind for searching files
        enable = true;
        keymaps = { "<C-f>f" = {
          action = "find_files";
          options = {
            desc = "Telescope find files";
          };
        };
        };
      };
      harpoon = {
        enable = true;
      };
      zig = { # zig
        enable = true;
      };
    };
  };
}
