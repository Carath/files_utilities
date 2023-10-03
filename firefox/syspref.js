// Firefox - User settings.

// Tested with version 106.0.1 (64-bit) for Linux Mint

// File to be placed in: /etc/firefox/syspref.js
// Complete settings list: $HOME/.mozilla/firefox/*.default/prefs.js

// This doesn't seem to work ~~mozilla~~ but will at least be used
// as a backup of changed settings.

// Note: global font size handled by layout.css.devPixelsPerPx

pref("accessibility.typeaheadfind.flashBar", 0);
pref("browser.aboutConfig.showWarning", false);
pref("browser.bookmarks.editDialog.confirmationHintShowCount", 3);
pref("browser.bookmarks.restore_default_bookmarks", false);
pref("browser.contentblocking.category", standard);
pref("browser.ctrlTab.recentlyUsedOrder", false);
pref("browser.download.autohideButton", false);
pref("browser.download.panel.shown", true);
pref("browser.download.save_converter_index", 0);
pref("browser.newtabpage.activity-stream.feeds.topsites", false);
pref("browser.newtabpage.activity-stream.prerender", false);
pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
pref("browser.newtabpage.activity-stream.showSearch", false);
pref("browser.newtabpage.enabled", false);
pref("browser.newtabpage.storageVersion", 1);
pref("browser.search.hiddenOneOffs", DuckDuckGo, Google);
pref("browser.search.region", FR);
pref("browser.startup.homepage", about:blank);
pref("browser.homepage_welcome_url", about:blank);
pref("browser.tabs.allowTabDetach", false);
pref("browser.tabs.drawInTitlebar", true);
pref("browser.urlbar.placeholderName", DuckDuckGo);
pref("browser.urlbar.placeholderName.private", DuckDuckGo);
pref("browser.urlbar.suggest.bookmark", false);
pref("browser.urlbar.suggest.history", false);
pref("browser.urlbar.suggest.openpage", false);
pref("browser.urlbar.suggest.topsites", false);
pref("browser.urlbar.timesBeforeHidingSuggestionsHint", 0);
pref("browser.urlbar.tipShownCount.tabToSearch", 60);
pref("devtools.toolbox.selectedTool", webconsole);
pref("devtools.toolbox.splitconsoleEnabled", true);
pref("dom.webnotifications.enabled", false);
pref("extensions.activeThemeID", default-theme@mozilla.org);
pref("full-screen-api.warning.timeout", 300);
pref("general.smoothScroll.mouseWheel", false);
pref("general.smoothScroll.mouseWheel.migrationPercent", 0);
pref("general.warnOnAboutConfig", false);
pref("layout.css.devPixelsPerPx", 0.95);
pref("lightweightThemes.usedThemes", []);
pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);
pref("pref.downloads.disable_button.edit_actions", false);
pref("services.sync.tabs.lastSync", 0);
pref("browser.tabs.firefox-view", false);
pref("browser.tabs.inTitlebar", 1);
pref("pdfjs.defaultZoomValue", 100);
