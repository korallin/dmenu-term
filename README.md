# dmenu-term

This is a simple script that emulates `dmenu` by running a fuzzy filter in a new terminal window.

Right now `fzf` and `kitty` are hardcoded, but if there is a demand, I am open for refactoring the script to make both terminal and fuzzy filter apps configurable - just open a PR!

## Usage

The standard `dmenu` arguments are either supported or safely ignored, so using this as a drop-in replacement for `/usr/bin/dmenu` should be safe.

In addition, the following non-standard params are added to the script:

- `-k` - open `dmenu` in a terminal panel instead of a new window
- `-f` - provide additional options to the fuzzy filter
- `-0` - treat input as `\0` separated instead of `\n` separated

## Window customizations

Terminal window class is set to `dmenu`, or if you provide a custom prompt via `-p` flag, it will be set to `dmenu-<prompt>`.

You can then use your WM to set custom window size, position, etc. based on the class name.

## Installation

On Arch Linux you can use [dmenu-term](https://aur.archlinux.org/packages/dmenu-term/) package.
