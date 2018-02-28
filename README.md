# dotvim
VimConfig

# ctags key bindings
## tags generation
* `<F5>` allow you to generate as well as refresh tags list


<b>N.B.</b> You can add a `~/.ctags` to your home directory in which you can specify, among other things, folders that you don't want to consider when generating tags list of your project. The following is an example of a `.ctags` file for a python project:
```
--python-kinds=-iv
--exclude=build
--exclude=dist
```

## navigation between definitions
* `Ctrl+]` - go to definition
* `Ctrl+T` - Jump back from the definition.
* `Ctrl+W` `Ctrl+]` - Open the definition in a horizontal split
* `Ctrl+\` - Open the definition in a new tab
* `Alt+]` - Open the definition in a vertical split

# Dependencies
* Get pathogen
* Get ctags: `apt-get install exuberant-ctags`

# How it looks
comming...

# Troubleshooting
Some users either on MacOS or Linux are experiencing some troubles getting NERDTree to work. One of the proposed solutions is to replace the current NERDTree submodule by . Many thanks to <b>Mathias Ramparison</b>.
