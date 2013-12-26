My Vim Configuration
====================

Initial Setup
-------------

1. Clone this repository to `~/.vim`

```bash
git clone https://github.com/jeffshantz/vimconfig.git ~/.vim
```

2. Install `vundle`:

```bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

3. Install all bundles:

```bash
vim +BundleInstall +qall
```

4. Link `~/.vimrc` to `~/.vim/vimrc` (if necessary)

```bash
ln -s ~/.vim/vimrc ~/.vimrc
```

Features
--------

Some of the features of this configuration include:

* Forcing one to use `hjkl` navigation

* Powerline status bar

* Tabularize
  * Use `,a=` to align by `=`
  * Use `,a:` to align by `:`
  * Tabularize is called every time you type `|`, which is great for Cucumber tables

* Comment boxes
  * An 80-character comment box is inserted when you use `,cb #`, where `#` is the comment
    character to use.

* Snippets
  * Plenty of snippets in `.vim/bundle/vim-snippets/snippets/`
  * I added a few custom Java snippets that I use in my teaching:
    * `pc` - `public class ClassName { }`
    * `psvm` - `public static void main(String[] args) { }`
    * `psvmte` - `public static void main(String[] args) throws Exception { }`
    * `sop` - `System.out.println("text");`
  * Additional snippets can be added to the `.vim/snippets` directory

* Ctrl-p file navigation
