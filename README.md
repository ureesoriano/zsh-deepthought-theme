Ubuntu with vitamins 🥑🥝🍉🍊
===============================

Zsh [Zim] theme mimicking default Ubuntu shell theme, but with vitamins.

![screenshot]

What does it show? (AKA: vitamins)
------------------

  * Red username & prompt when **last command failed**.
  * When in a **git** working tree:
    * Green label with current git branch name, or commit short hash when in ['detached HEAD' state].
    * Red `*` when there are **dirty** files.
    * Red `%` when there are **untracked** files.
    * Green `+` when there are **staged** files.
    * `<` when **behind the remote**.
    * `>` when **ahead of the remote**.
    * `<>` when local & remote repositories have **diverged**.

Requirements
------------

Requires Zim's [git-info] module to show git information.

[screenshot]: https://raw.githubusercontent.com/ureesoriano/zsh-ubuntu-with-vitamins-zim-theme/master/content/ubuntu_with_vitamins.png
[Zim]: https://github.com/zimfw/zimfw
['detached HEAD' state]: http://gitfaq.org/articles/what-is-a-detached-head.html
[git-info]: https://github.com/zimfw/git-info
