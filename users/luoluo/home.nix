{ config, pkgs, ... }:
let 
  OPENAI_API_KEY = builtins.readFile ../../env/OPENAI_API_KEY;
in
{
  imports = [
    # ../../home/gnome.nix
    ../../home/firefox.nix
    ../../home/zed.nix
    ../../home/direnv.nix
    ../../home/shell
  ];
  # 注意修改这里的用户名与用户目录
  home.username = "luoluo";
  home.homeDirectory = pkgs.lib.mkForce "/home/luoluo";
  home.language.base = "zh_CN.UTF-8";
  home.sessionVariables  = {
    OPENAI_API_KEY = OPENAI_API_KEY;
  };

  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };

  # 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
  # home.file.".xxx".text = ''
  #     xxx
  # '';
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  home.packages = with pkgs;[
    # dconf
    glib-networking 
    neofetch
  ];
  
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}