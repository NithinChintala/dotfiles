# GNOME Terminal Preference "File"
- See https://askubuntu.com/questions/774394/wheres-the-gnome-terminal-config-file-located
- To read preferences to `stdout` do `dconf dump /org/gnome/terminal/ > gterminal.preferencs`
- To write preferences from `stdin` do `cat gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/`
