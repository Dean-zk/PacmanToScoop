# Syntacticly Awsome Package-Manager

A silly little project where I made the scoop package manager syntax more simple to use.

# How to use it?

Copy the code into your $PROFILE

```bash
notepad $PROFILE
```
If you don't have this file then enter this command:

```bash
New-Item -Path $PROFILE -Type File -Force
```
# Why should I use it:
It is just for a more concise systax. I love scoop, but the syntax is kinda long.
For example, here is how to update and download a package in scoop:
```bash
scoop update && scoop install <package name>
```
Not that bad but I find the syntax the pacman package manager uses much better.
so now you use this instead:
```bash
sap -Syu <package name>
```

Enjoy using SAP!
