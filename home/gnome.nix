{ config, pkgs, ... }:
let
  wallpaper = "${../static/images/wallpaper.jpg}";
  avatar = "${../static/images/avatar.jpg}";
in
{
  imports = [
    
  ];
  
  home.file.".face".source = avatar; 
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com" 
          "window-list@gnome-shell-extensions.gcampax.github.com"
          "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        ];
        favorite-apps = [
          "firefox.desktop"
          "zed.desktop"
          "nushell.desktop"
        ];

      };
      "org/gnome/desktop/background" = {
        
        picture-uri = wallpaper;
        picture-uri-dark = wallpaper;
      };
      "org/gnome/mutter" = {
        
        center-new-windows = true;
      };

      "org/gnome/desktop/interface" = {
        
        clock-show-date = true;
        clock-show-weekday = true;
      };
      
      "org/gnome/desktop/screensaver" = {
        lock-delay = 0;
        lock-enabled = true;
      };
      "org/gnome/desktop/session" = {
        idle-delay = -1;
      };
      
      
      "org.gnome.settings-daemon.plugins.power" = {
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-type = "nothing";
      };
      "org/gnome/settings-daemon/plugins/power" = {
        idle-dim = false;
        power-button-action = "suspend";
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-timeout = 0;
        sleep-inactive-battery-type = "nothing";
      };
      

      "org/gnome/desktop/wm/preferences" = {
        resize-with-right-button = true; 
        button-layout = "appmenu:minimize,close"; 
        focus-mode = "sloppy";
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Alt>F4" "<Super><Shift>q" ]; 
        show-desktop = [ "<Super>d" ]; 
        home = [ "<Super>e" ]; 
      };
    };
  };

}
