# Bash config

## Setup

The ``` .bashrc ``` file is to be placed in ``` ~/ ```

The ``` myconfig.sh ``` one needs to be placed in ``` /etc/profile.d/ ```

For the changes to take effect, those files need to be sourced, e.g with:

```sh
source ~/.bashrc
```

To prevent an error message from appearing, do this once:

```sh
sudo mkdir -p /var/lib/samba/usershares/
```


## Useful things

To list all defined aliases, run:

```sh
alias
```

To list all exported variables, run:

```sh
export -p
```
