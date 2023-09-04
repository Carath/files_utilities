# Qalculate

*Better calculator than the default one.*

## Softwares and configs

Install ``` qalculate ``` (preferably the GTK variant), or the CLI version ``` qalc ``` (included in ``` qalculate ```).

Furthermore, 2 config files are stored in ``` ~/.config/qalculate/ ```, use the ones provided here:
- ``` qalc.cfg ```
- ``` qalculate-gtk.cfg ```

To run in a GUI (or terminal), just type ``` qalculate ``` (or ``` qalc ```).


## Building libqalculate from source

This will only install ``` qalc ```, and may take ~ 10 minutes. It is advised to choose a specific version (here ``` v4.6.0 ```):

```sh
sudo apt-get install -y git make automake curl libcurl4-openssl-dev libc6-dev libxml2-dev \
  libicu-dev libreadline-dev libmpfr-dev gettext gnuplot doxygen autoconf intltool libtool
cd ~/ && git clone -b v4.6.0 --depth 1 https://github.com/Qalculate/libqalculate.git
cd libqalculate && ./autogen.sh && ./configure && make && sudo make install && sudo ldconfig
```

The ``` ~/libqalculate ``` directory can then be deleted.


## Links

- [Official site](http://qalculate.github.io/index.html)
- [qalc manual](https://qalculate.github.io/manual/qalc.html)
- [qalculate manual](https://qalculate.github.io/manual/index.html)
- [Examples](https://qalculate.github.io/manual/qalculate-examples.html)
