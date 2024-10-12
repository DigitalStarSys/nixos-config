{
	description = "Test Flake";

	inputs = {
		# NixOS's official package source
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		# home-manager, which is useful I think
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ nixpkgs, home-manager, ... }: {
		nixosConfigurations = {
			prometheus-nix = nixpkgs.lib.nixosSystem rec  {
				system = "x86_64-linux";

				modules = [
					# this imports the default configuration
					./configuration.nix
				
					# this makes home-manager a nix module
					home-manager.nixosModules.home-manager
						{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.digistarsys = import ./home.nix;
						}
					];
				};
			};
		};
	}

