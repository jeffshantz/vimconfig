My Vim Configuration
====================

Initial Setup
-------------

Clone this repository to `~/.vim`

```bash
git clone https://github.com/jeffshantz/vimconfig.git ~/.vim
```

Install `neobundle`:

```bash
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

Link `~/.vimrc` to `~/.vim/vimrc`

```bash
ln -s ~/.vim/vimrc ~/.vimrc
```

Run `vim` to have NeoBundle install all plugins, exit, and rerun to ensure all
plugins are loaded.

Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for 
efficient code search (*optional but recommended*).

Features
--------

Some of the features of this configuration include:

* Forcing one to use `hjkl` navigation

* Airline status bar

* Unite

  * Commands
    * `,f` - Fuzzy file open
    * `,g` - Recursive grep
    * `,y` - Yank history
    * `,m` - MRU files
    * `,b` - Open buffers
    * `,c` - Quick commands

  * When Unite is open:
    * `Esc` or `qq` exits Unite
    * `Ctrl+J` or `jj` allows you to select a menu item
    * `Ctrl+R` refreshes Unite
    * `Ctrl+S` opens the selected menu item in a horizontal split
    * `Ctrl+V` opens the selected menu item in a vertical split

* Tabularize
  * Use `,a=` to align by `=`
  * Use `,a:` to align by `:`
  * Tabularize is called every time you type `|`, which is great for Cucumber tables

* Comment boxes
  * An 80-character comment box is inserted when you use `,cb #`, where `#` is the comment
    character to use.

* Write using sudo
  * Forgot to use `sudo vim`?  No problem.  Save the file using `:w!!` and it will be 
    written as `root`.

* Insert blank lines above/below without going into insert mode
  * Above: `,O`
  * Below: `,o`

* Skeleton files
  * `pom.xml`
  * Angular JS - Edit any new file named `*-ng.html`, and you get a basic Angular skeleton
  * Bootstrap - Edit any new file named `*-bs.html`, and you get a basic Bootstrap skeleton

* Snippets
  * Plenty of snippets in `.vim/bundle/vim-snippets/snippets/`
  * I added a few custom Java snippets that I use in my teaching:
    * `pc` - `public class ClassName { }`
    * `psvm` - `public static void main(String[] args) { }`
    * `psvmte` - `public static void main(String[] args) throws Exception { }`
    * `sop` - `System.out.println("text");`
  * Additional snippets can be added to the `.vim/snippets` directory
