# Dotfiles
Configuration files from bash shell, vim editor and ubuntu terminal theme. After a bunch of OS reinstalls, I decided to backup them here. There are some basics bash scripts to automatically overwrite the tracked files. 

## Save the colors preferencies of terminal
List profiles with:
```
dconf dump /org/gnome/terminal/legacy/profiles:/
```
In the options, locate the string corresponding to the preferencies you want to save. The string is the first line in each block and appears between brackets. For example, one string can be 
```
[:123456-vivaperon-0303456]
```
with this, export the profile doing
```
dconf dump /org/gnome/terminal/legacy/profiles:/:123456-vivaperon-0303456/ > material-theme-profile.dconf
```

Then you can restore it with

```
dconf load /org/gnome/terminal/legacy/profiles:/:123456-vivaperon-0303456/ < material-theme-profile.dconf
```
