{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];
  # 启用系统引导
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # 设置实验性功能
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # 系统状态版本
  system.stateVersion = "25.05"; 
}
