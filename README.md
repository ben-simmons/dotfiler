# Preamble

Dotfiles is a (primitive) personal development environment configuration manager that works with Git.
This repo is a template for producing Dotfiles modules.
You can use this template to build each module in a tree of Dotfiles modules.

I built this because every time I've ever built a collection of config files, on personal or company machines, I either
eventually lost them, or forgot why I configured them the way I did, or nearly bricked my environment with some change that didn't
play nice. As far as I can tell, environment config is the last frontier that hasn't been package-managed.
At least, I haven't heard of such a package manager till now, and when I started building this I stopped looking.

Maybe I'm a bad developer, but I honestly don't want to deal with the mundane details of env config shit anymore.

# Benefits

* Easily add version control to your environmental config, to ensure that your personal customizations are always available.
* Easily swap configs into or out of your environment, to try new configurations without fear.
* Easily reuse all sorts of Dotfiles modules, to readily configure your tools.
* Easily sync package versions with the rest of your team, to eliminate dependency-mismatch build problems.

# Prototypical example

https://github.com/simmbot/dotfiles-root

# Usage

1. Fork.
2. Add dot files (e.g. ```.bash_profile```) to the ```.dotfiles``` directory. The default ```do``` script creates symlinks from ```$HOME``` to all dot files it finds in this directory.
3. Add Dotfiles module repository URLs to the ```.morefiles``` file. For example, add a ```dotfiles-vim``` module, residing at https://github.com/simmbot/dotfiles-vim.git, that loads a bunch of publicly available vim packages.
4. Add private Dotfiles module repository URLs to a ```.moresecrets``` file. Whatever you would rather not advertise to the fine people of Github. Not judging.
5. Re-write the ```do``` script to do some custom stuff for your Dotfiles module, if you are not content with your lot in life.

If you use ```.morefiles``` or ```.moresecrets```, the only requirement is that each linked git repo provide
an executable ```do``` file in the ```bin``` directory. Feel free to recursively link repos, indefinitely, to the last syllable of recorded time.

# Installation

Do this once you have built your legendary tree of Dotfiles modules.
```
$ git clone git://github.com/{YOUR_ROOT_DOTFILES_REPO}.git ~/.dotfiles
$ ~/.dotfiles/bin/do
```
# Caveats

If it can't be rolled back by simply swapping a symlink, then Dotfiles probably isn't a good fit.

# Inspirations

* https://github.com/divad12/dotfiles
* https://github.com/sentientmonkey/vimfiles
* Vundle: https://github.com/gmarik/Vundle.vim
* Heroku multi buildpacks: https://github.com/ddollar/heroku-buildpack-multi
* Amazon Brazil & Apollo: http://www.allthingsdistributed.com/2014/11/apollo-amazon-deployment-engine.html
* Every package management system ever

# License

MIT

# TODO

* Recursively pull down dotfiles repos.
* Way better deployment versioning.
* Way better undo.
* Namespace the modules. E.g. you can only link one ```dotfiles-vim``` module.
* Selectively ```do``` branches of the tree. Example: ```do vim``` finds the ```dotfiles-vim``` module, similar to how ```git``` commands work. E.g. ```git clone``` executes ```git-clone```.
* Build prototypical example.
* Would it be saner to separate dotfiles the program from dotfile modules? I.e. use this ```dotfiles``` repo for the client program, move the current contents to a ```dotfile-template``` repo, and call all actual dotfile modules something like ```dotfile-mod-X```? Probabily better, but too complicated for now. Worth doing if it ever becomes a full-fledged package manager.

