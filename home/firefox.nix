{pkgs,nur,...} : {
  programs.firefox = {
    enable = true;
    languagePacks = [
      "zh-CN"
      "en-GB"
  ];
    profiles.luoluo = {
      id = 0;
      name = "luoluo";
      isDefault = true;
      settings = {
          extensions.autoDisableScopes = 0;
          "distribution.searchplugins.defaultLocale" = "zh-CN";
          "general.useragent.locale" = "zh-CN";
          "browser.bookmarks.showMobileBookmarks" = true;
          "browser.newtabpage.pinned" = [{
            title = "NixOS";
            url = "https://nixos.org";
          }];
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        absolute-enable-right-click
        vimium-c
        gesturefy
        rust-search-extension
        tree-style-tab
        tst-wheel-and-double

      ];
    
      search = {
        force = true;
        order = [
          "cnBing"
          "DuckDuckGo"
          "Google"
          "Nix Packages"
          "Nix Wiki"
        ];
        default = "cnBing";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "NixOS Wiki" = {
            urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}"; }];
            iconUpdateURL = "https://wiki.nixos.org/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nw" ];
          };
          "cnBing" = {
            urls = [{
              template = "https://cn.bing.com/search?q={searchTerms}+-site:*.csdn.net+-site:*.zhihu.com";
              
            }];
            definedAliases = [ "@cb" ];
          };

          "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias

        };
      };
    };

  };
}