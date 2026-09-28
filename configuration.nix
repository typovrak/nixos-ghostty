{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.ghostty = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/ghostty
		mkdir ${home}/.config/ghostty
		chown ${username}:${group} ${home}/.config/ghostty
		chmod 700 ${home}/.config/ghostty

		cp ${./config} ${home}/.config/ghostty/config
		chown ${username}:${group} ${home}/.config/ghostty/config
		chmod 600 ${home}/.config/ghostty/config

		cp ${./custom.css} ${home}/.config/ghostty/custom.css
		chown ${username}:${group} ${home}/.config/ghostty/custom.css
		chmod 600 ${home}/.config/ghostty/custom.css

		mkdir ${home}/.config/ghostty/themes
		chown ${username}:${group} ${home}/.config/ghostty/themes
		chmod 700 ${home}/.config/ghostty/themes

		cp ${./themes/catppuccin-mocha-green} ${home}/.config/ghostty/themes/catppuccin-mocha-green
		chown ${username}:${group} ${home}/.config/ghostty/themes/catppuccin-mocha-green
		chmod 600 ${home}/.config/ghostty/themes/catppuccin-mocha-green

		cp ${./themes/catppuccin-latte-green} ${home}/.config/ghostty/themes/catppuccin-latte-green
		chown ${username}:${group} ${home}/.config/ghostty/themes/catppuccin-latte-green
		chmod 600 ${home}/.config/ghostty/themes/catppuccin-latte-green
	'';

	environment.systemPackages = with pkgs; [
		ghostty
	];
}
