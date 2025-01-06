{ options, config, lib, pkgs, ... }:
{
  program.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://duckduckgo.com/";
          "browser.search.defaultenginename" = "duckduckgo";
          "browser.search.order.1" = "duckduckgo";
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            Sponsor-Block
            Return-Youtube-Dislike
            indie-wiki-buddy
            firefox-color
            stylus
          ];

      };
    };      
  };           
}
