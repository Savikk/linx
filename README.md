linx
====
Repo do rzeczy, które uważam za przydatne #kali
Przyda sie dla osob ktore chca zainstalowac nowe sterowniki od AMD. (Dawno nie sprawdzane)

grafika
##
1. skrypt -z
2. instalacja nowych sterownikow z witryny amd.com

GLIBC 2.14 (4 steam)
##
1. skrypt wystarczy

Steam cd.
##
/usr/bin/steam
```
# Don't allow running as root
#if [ "$(id -u)" == "0" ]; then
#    show_message --error $"Cannot run as root user"
#    exit 1
#fi
```

dpkg -i 
[Jockey-common](http://ubuntu.mirror.cambrium.nl/ubuntu//pool/universe/j/jockey/jockey-common_0.9.7-0ubuntu11_all.deb)

[python xkit](http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/x/x-kit/python-xkit_0.5.0_all.deb)


```
sudo apt-get update --fix-missing

sudo dpkg --configure -a

sudo apt-get install -f

    $ sudo nano /var/lib/dpkg/status    (you can use vim or gedit instead of nano)
    Locate the corrupt package, and remove the whole block of information about it and save the file.

sudo fuser -vki /var/lib/dpkg/lock

sudo dpkg --configure -a

sudo rm /var/lib/apt/lists/lock

sudo rm /var/cache/apt/archives/lock
```

