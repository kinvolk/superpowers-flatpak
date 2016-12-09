# superpowers-flatpak

Flatpak of [Superpowers](http://superpowers-html5.com/).

# TODO

- fill [appdata](metadata/com.sparklinlabs.Superpowers.appdata.xml) and [desktop](metadata/com.sparklinlabs.Superpowers.desktop) files, currently they are empty
- [finish flags](com.sparklinlabs.Superpowers.json#L9-L15)
- currently we copy the core and app directory directly to `${prefix}` and remove the `.git` directories from there; probably we could copy even less files ([install script](https://github.com/kinvolk/superpowers-flatpak/blob/master/superpowers/install#L8-L11))
- check if it even works
- maybe provide the additional assets - Superpowers Mega Asset Pack (1200+ files!), available only through their downloads website
