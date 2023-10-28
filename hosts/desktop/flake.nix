{
  description = "Desktop configuration using flakes";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
  };

  outputs = { self, nixpkgs, nix, nixos-hardware, home-manager }: {
    nixosConfigurations = {
      thinknix52 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /etc/nixos/hardware-configuration.nix
          ./hosts/desktop/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
          }
        ];
      };
    };
  };
}
