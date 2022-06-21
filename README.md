# Arch Linux Configurator

This is a script to install and configure Arch.
It is a work in progress and my first attempt at real bash scripting with logic, so expect it to be pretty rough around the edges as I figure this stuff out.

## Usage

It's intended to be used the moment you've booted into the installation media. If you have internet when you boot, there's a few ways you can acquire the script. If you don't have internet access upon booting then you'll need to follow an Arch installation guide ( [official](https://wiki.archlinux.org/title/Installation_guide) | [mine](https://github.com/aidlran/linux-bible/wiki/Arch-Linux-Install-Guide) ) until you've got it set up, or use a USB stick or some other means to copy the script over.

**Option 1 -** Install `git` and clone this repo:

```sh
pacman -Sy git
git clone https://github.com/aidlran/arch-configurator.git
./arch-configurator/install.sh
```

> FYI please never use `-Sy` outside of this one instance.
> It's only needed here because the package databases don't exist in the installation environment until you download them.

**Option 2 -** Download the script with `curl`:

```sh
curl https://raw.githubusercontent.com/aidlran/arch-configurator/main/install.sh > install.sh
chmod +x install.sh
./install.sh
```
