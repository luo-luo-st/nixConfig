{
  description = "一个普普通通的 NixOS 配置";
  nixConfig = {
    extra-substituters = [
      "https://mirrors.sjtug.sjtu.edu.cn/nix-channels/store/"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nur, hyprland, ... }: {
    nixosConfigurations = {
      nixos = let
        username = "luoluo";
        system = "x86_64-linux";
        specialArgs = {inherit username system inputs;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            nur.modules.nixos.default
            nur.legacyPackages."${system}".repos.iopq.modules.xraya
            ./configuration.nix
            ./hosts/nixos
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
        ];
      };
    };
  };
}