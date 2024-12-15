{ config, pkgs, ... }:
let
  wallpaper = "${../static/images/wallpaper.jpg}";
  avatar = "${../static/images/avatar.jpg}";
in
{
  imports = [
    # ../../../pkgs/wallpaper-hm
  ];
  home.file.".face".source = avatar; #头像
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com" #系统托盘
          #"dash-to-dock@micxgx.gmail.com"
          "clipboard-history@alexsaveau.dev" # 剪切板
          #"kimpanel@kde.org"
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
          #"auto-move-windows@gnome-shell-extensions.gcampax.github.corm"
          #"drive-menu@gnome-shell-extensions.gcampax.github.com"
          #"launch-new-instance@gnome-shell-extensions.gcampax.github.com"
          #"light-style@gnome-shell-extensions.gcampax.github.com"
          #"native-window-placement@gnome-shell-extensions.gcampax.github.com"
          #"places-menu@gnome-shell-extensions.gcampax.github.com"
          "window-list@gnome-shell-extensions.gcampax.github.com"
          "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
          #"workspace-indicator@gnome-shell-extensions.gcampax.github.com"

          #"paperwm@paperwm.github.com"
          #"material-shell@papyelgringo"
        ];
        favorite-apps = [
          "firefox.desktop"
          "zed.desktop"
          "nushell.desktop"
        ];

      };
      "org/gnome/desktop/background" = {
        # 壁纸
        picture-uri = wallpaper;
        picture-uri-dark = wallpaper;
      };
      "org/gnome/mutter" = {
        # 新窗口在屏幕中心打开
        center-new-windows = true;
      };

      "org/gnome/desktop/interface" = {
        # gtk-theme="Adwaita-dark";
        clock-show-date = true;
        clock-show-weekday = true;
      };
      #电源和做锁屏 ===============
      "org/gnome/desktop/screensaver" = {
        lock-delay = 0;
        lock-enabled = true;
      };
      "org/gnome/desktop/session" = {
        idle-delay = -1;
      };
      #gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
      #gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
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
      #电源和做锁屏 ===============

      "org/gnome/desktop/wm/preferences" = {
        resize-with-right-button = true; #win+右键 修改窗口大小  
        button-layout = "appmenu:minimize,close"; #去掉最大化按钮 没啥卵用
        focus-mode = "sloppy";
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Alt>F4" "<Super><Shift>q" ]; # 关闭窗口
        show-desktop = [ "<Super>d" ]; # win+d 显示桌面壁纸
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        ];
        home = [ "<Super>e" ]; # 打开文件home 使用默认文件管理器
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "nu -e 'echo $env.PWD'";
        name = "Open nushell";
      };
    };
  };

}
