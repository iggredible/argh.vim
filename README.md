# Argh.vim

Argh.vim is a lightweight plugin that extends the `:args` command by allowing you to contextually organize your arglist files.

## Motivation

I find that editing with argument list to be more useful than buffers. Why? Because it allows me to control the files that are going into the file set, whereas the buffer system indiscriminately adds every opened file into the buffer list.

However, I feel like the current argument list system is missing one feature: it only allows one file set at any time. What if I need multiple file sets? What if I want to collect 3 UI files in one argument list and 4 backend files in a different argument list?

I find that by adding the ability to store multiple argument list, my arglist workflow increases exponentially. This Argh.vim plugin allows you to create multiple argument lists so you can group them by their contexts.

## Usage

This plugin does not impede with Vim's native arglist commands. It is simply an extension to the current arglist workflow.

It comes with only 3 commands that are easy to remember:

```
:Argh a
:Arga a
:Argd a
```

Where `a` is the name of your argument list context. A context is like a category that can help you to organize the files you are working with. Let's say that you need to work with two set of files: UI and Backend files to accomplish whatever task you are working on. How can Argh.vim help?

First, you can collect all the UI files into the arglist with `:args ui.jsx ui.html ui.test.js`. Your `:args` should now contain these 3 files. To add a UI context, run:

```
:Argh ui
```

<img src="https://raw.githubusercontent.com/iggredible/argh.vim/assets/assets/ArghInit.gif" align="left" height="500px">

Argh.vim will store these files in the `ui` context. 

By the way, you could also do `:Argha ui` to achieve the same effect.

<img src="https://github.com/iggredible/argh.vim/blob/assets/assets/ArghaUI.gif?raw=true" align="left" height="500px">

Second, now that we added the ui argument list files into the `ui` context, let's add the backend files into the argument list with: `:args backend.rb backend_service.rb backend_spec.rb`. Your `:args` should now contain these 3 files. To add a Backend context, run:

```
:Argh backend
```

<img src="https://github.com/iggredible/argh.vim/blob/assets/assets/ArghBackend.gif?raw=true" align="left" height="500px">

Argh.vim will store those files under the `backend` context (again, you could equally run `:Argha backend` for a similar effect). 

Now you have two arglist contexts that you can switch to anytime you want: `ui` and `backend`.

To see what context you have and to switch to a different context, run:

```
:Argh
```

<img src="https://github.com/iggredible/argh.vim/blob/assets/assets/ArghSwitchBackendUI.gif?raw=true" align="left" height="500px">

Argh.vim will display a popup menu, displaying the available contexts for you to choose from (if you don't want to switch, just press `<Escape>` to exit).


Anytime that you are inside a context and you switch to a different context, if you've made a change to the current argument list, don't forget to save them. 

<img src="https://github.com/iggredible/argh.vim/blob/assets/assets/ArghUpdate.gif?raw=true" align="left" height="500px">

For example, say you are currently in the `ui` context and your argument list files are `ui.jsx`, `ui.html`, and `ui.test.js`. Then you add a new file into the current argument list (`:arga ui.slim`). You need to save the current argument list. In this case, you need to run either `:Argh ui` or `:Argha ui`. Otherwise, Argh.vim won't know that the `ui` context now has 4 files instead of 3.

If you notice, `:Argh ui` and `:Argha ui` do the same thing. It is because when I was writing this library, I want it to mimic the behavior of arglist.

Finally, to remove a context, just run the `:Arghd` command. So if you want to remove `ui` context, run:

```
:Arghd ui
```

<img src="https://github.com/iggredible/argh.vim/blob/assets/assets/ArghDelete.gif?raw=true" align="left" height="500px">

To summarize, Argh.vim is super useful if you have multiple files in your arglist that you want to split into multiple contexts so you can categorize your files and quickly traverse between them.

# Installation

If you use [vim-plug](https://github.com/junegunn/vim-plug):

```
call plug#begin('~/.vim/plugged')
  Plug 'iggredible/argh.vim'
call plug#end()
```

Restart Vim / source your vimrc, then run `:PlugInstall`.

It should work with other plugin managers too.

If you use packages (`:h packages`):

```
git clone https://github.com/iggredible/argh.vim.git ~/.vim/pack/vendor/start/argh.vim
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/argh.vim/doc/" -c q
```

# License

Same as Vim license (`:h license`).

