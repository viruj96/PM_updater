# Node Package Manager Updater

## Why?

Automatically updates node package managers when npm, yarn or pnpm command is run.

I would constantly be annoyed with messages to update the package manager because of a new release. Sometimes I would, sometimes I would not. But it was just bugging me that it was almost always there (for pnpm at least it is).

So I wrote this script to handle the updates automatically for me. Whenever I run npm install, yarn add or pnpm add, this script will start and read the `LAST_UPDATE_FILE`, if it exists, to check when the last update check occured. If the `LAST_UPDATE_FILE` does not exist or the last check was over a day ago, then the package manager will attempt to update itself. After that it will pick up where it left off and execute the initial command.

## Get it working

### Linux/MacOS

I am assuming it's the same steps or similar for MacOS

Either download the `package_manager_update.sh` file or copy its contents into a newly created file. Make sure the file is executable:

```
chmod package_manager_update.sh +x
```

Edit the `~/.bashrc` file. Add the following at the end of the file:
```
# Alias npm, yarn, and pnpm to the function that checks for the update
alias npm="~/package_manager_update.sh npm"
alias yarn="~/package_manager_update.sh yarn"
alias pnpm="~/package_manager_update.sh pnpm"
```
Save and close the file. Finally run:
```
source ~/.bashrc
```

### Windows

Coming soon... Maybe
