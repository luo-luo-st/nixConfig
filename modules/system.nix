{ config, lib, pkgs, username, ... }:{
  
  # 系统包安装
  environment.systemPackages = with pkgs; [
    vim
    open-vm-tools
  ];
  # i18n.defaultLocale = "zh_CN.UTF-8";
  # time.timeZone = "Asia/Shanghai";
  # git 相关配置
  programs.git = {
    enable = true;
  };

  # SSH服务配置
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  # 网络配置
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
    

  # 用户配置
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "uinput" "video"];
    initialPassword = "luoluo";
  };



}