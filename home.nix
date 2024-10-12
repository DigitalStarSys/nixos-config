{ config, pkgs, ... }:

{
	home.username = "digistarsys";
	home.homeDirectory = "/home/digistarsys";

	home.packages = with pkgs; [
	
	# -- cli tools
	neofetch
	
	# -- personal apps
	vesktop
	
	# -- system utils
	pciutils # aka lspci
	usbutils # aka lsusb

	];

	programs.git = {
		enable = true;
		userName = "Digital Star System";
		userEmail = "acelia.sys@gmail.com";
	};
		
	# don't touch these
	home.stateVersion = "24.05";
	programs.home-manager.enable = true;
	home.enableNixpkgsReleaseCheck = false;

}
