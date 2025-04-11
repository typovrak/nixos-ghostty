# nixos-ghostty

nixos-ghostty = fetchGit {
	url = "https://github.com/typovrak/nixos-ghostty.git";
	ref = "main";
};

(import "${nixos-ghostty}/configuration.nix")
