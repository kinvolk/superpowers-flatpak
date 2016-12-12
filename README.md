# superpowers-flatpak

Flatpak of [Superpowers](http://superpowers-html5.com/).

# TODO

- currently we copy the core and app directory directly to `${prefix}` and remove the `.git` directories from there; probably we could copy even less files ([install script](https://github.com/kinvolk/superpowers-flatpak/blob/master/superpowers/install#L8-L11))
- it does not work
  - welcome screen is being shown up, but it stays like that
  - shows some error when shutting down the app
  - leaves an icon in the expandable tray bar in gnome shell, likely the result of the previous point?
- maybe provide the additional assets - Superpowers Mega Asset Pack (1200+ files!), available only through their downloads website
- consider adding the [dependencies](misc/deps) explicitly as sources to the flatpak manifest to avoid the requirement of having an access to the network during the build phase
