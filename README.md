# Preamble

Dotfiler is a (primitive) personal development environment configuration manager that works with Git.

I built this because every time I've ever written a collection of config files, on a personal or a company machines, I either eventually lost them, or nearly bricked my environment with some change that didn't play nice. Env config management isn't anything new, but I haven't yet seen a tool that integrates nicely with Git.

# Goals 

* (v1) Easily add version control to your environmental config.
* (v1) Easily reuse publicly available dot files.
* (v2) Easily swap configs into or out of your environment.

# Example usage 

Dotfiler is made with Github in mind. The idea is that (1) I will create publicly available Github repos for Dotfiler modules, and (2) I will create a publicly available repo of my Dotfiler snapshot.

# Caveats

If it can't be rolled back by simply swapping a symlink, then Dotfiler probably won't be a good fit.

# Inspirations

* https://github.com/divad12/dotfiles
* https://github.com/sentientmonkey/vimfiles
* Vundle: https://github.com/gmarik/Vundle.vim
* Homebrew: https://github.com/homebrew/homebrew
* Heroku multi buildpacks: https://github.com/ddollar/heroku-buildpack-multi
* Amazon Brazil & Apollo: http://www.allthingsdistributed.com/2014/11/apollo-amazon-deployment-engine.html
* Git: https://github.com/git/git
* Every package management system ever

# License

MIT

# TODO

* Build dotfiler script
* Build dotfiler-git: the plumbing
* Build dotfiler-install: install a module, or use -s to install a snapshot. V1 should have a force mode and run in non-force mode by default, because it's critical to NOT destroy existing config without user's knowledge.
* Build dotfiler-uninstall
* Build dotfiler-profile: somewhat analogous to ```git branch```
* Push example snapshot.

