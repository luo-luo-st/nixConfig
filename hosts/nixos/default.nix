
{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/sysgnome.nix
      ../../pkgs/variables.nix
      ../../pkgs/kanata.nix
    ];
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
}


