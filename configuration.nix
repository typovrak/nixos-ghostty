{ config, pkgs, ... }:

let
	username = "typovrak";
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
	'';

	environment.systemPackages = with pkgs; [
		ghostty
	];
}
