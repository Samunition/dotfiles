#!/usr/bin/env bash
set -e

# .config folder links
for dir in .config/*; do
#ln -fns $PWD/$file $HOME/$file
	ln -fns "$PWD/$dir" "$HOME/$dir"
done

# dot file links
for file in .{bash_profile,bash_aliases,bash_prompt,exports,functions}; do
    ln -fns "$PWD/$file" "$HOME/$file"
done
