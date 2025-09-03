# Firefox

## Settings

A list of modified settings is contained in the file ``` syspref.js ```, saved in ``` /etc/firefox/ ```.

However, here are listed the most important ones:

```
layout.css.devPixelsPerPx -> 0.95 (font size)
general.smoothScroll.mouseWheel -> false (preventing screen tearing)
browser.tabs.allowTabDetach -> false
browser.ctrlTab.recentlyUsedOrder -> false
services.sync.tabs.lastSync -> 0
full-screen-api.warning.timeout -> 300
dom.webnotifications.enabled -> false
media.videocontrols.picture-in-picture.video-toggle.enabled -> false
browser.tabs.inTitlebar -> 1
browser.toolbars.bookmarks.visibility -> always
browser.tabs.groups.enabled -> false
```

## Addons to install

- ublock Origin


## Bookmarks

Firefox bookmarks are automatically saved in a compressed format as ``` .jsonlz4 ``` files in the following directory, where [ID] depends on the Firefox version:

```
~/.mozilla/firefox/[ID].default-release/bookmarkbackups/
```
