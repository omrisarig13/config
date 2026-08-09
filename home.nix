{ config, pkgs, lib, ... }:

let
  unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
in
{
  # Always use nixpkgs-unstable, regardless of the system channel
  _module.args.pkgs = lib.mkForce (import unstableTarball {
    config = { allowUnfree = true; };
  });

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "omri";
  home.homeDirectory = "/home/omri";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.git-doc
    pkgs.gitFull
    # pkgs.git-gr # TODO: Look into that.
    pkgs.cowsay
    pkgs.fortune
    pkgs.nodejs

    pkgs.btop
    pkgs.htop
    pkgs.home-manager

    pkgs.fd

    pkgs.just

    pkgs.python314
    pkgs.python314Packages.pip
    pkgs.python314Packages.restructuredtext-lint
    pkgs.python314Packages.ipython

    pkgs.lua
    pkgs.lua55Packages.tree-sitter-cli

    pkgs.stylua

    pkgs.neovim
    pkgs.sqlite
    pkgs.tree-sitter
    pkgs.clang-tools
    pkgs.ncurses5
    pkgs.pyright
    pkgs.jdt-language-server
    pkgs.lua-language-server
    pkgs.bash-language-server
    pkgs.luaformatter
    pkgs.nixfmt
    pkgs.shfmt
    pkgs.shellcheck

    # pkgs.github-copilot-cli - Not currently working...

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/omsi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    # NIX_PATH = "$\{NIX_PATH}:home-manager=/nix/store/qry07p07whgb0ppszdl1jq0gkpy72rcr-home-manager-source";
  };

  home.shell = {
    enableShellIntegration = true;
    enableBashIntegration = true;
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      source $HOME/.config/personal/.bashrc
    '';
  };
  # programs.git = {
  #   enable = true;
  #   package = pkgs.gitFull;
  #   includes = [ { path = "~/.config/personal/.gitconfig"; } ];
  # };
  # This was broken for a while - try to fix it again...
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   withNodeJs = true;
  #   withPerl = true;
  #   withPython3 = true;
  #   withRuby = true;
  # };
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    newSession = true;
    prefix = "C-a";
    extraConfig = "source-file ~/.config/personal/.tmux.conf";
  };
  # programs.npm = {
  #   enable = true;
  # };

  programs.fzf = {
    enable = true;
    tmux.enableShellIntegration = true;
  };
  # nixpkgs.config.allowUnfreePredicate =
  #   pkg:
  #   builtins.elem (pkgs.lib.getName pkg) [
  #     "github-copilot-cli"
  #   ];
}
