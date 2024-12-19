{lib, config, pkgs, ... }:
{	
	let
		cfg = config.main-user; 
	in
	options.main-user = {
		main-user.enable
			= lib.mkEnableOption "enable user module";
		main-user.userName = lib.mkOption {
			default = "mainuser"
			description = ''
				username
			'';
		};
	};
	config = libmkIf cfg.enable {
		users.users."mainuser" = {
			isNormalUser = true;
			initalPassword = "1234";
			description = "main user";
			shell = pkgs.zsh;
		};
	};
}
