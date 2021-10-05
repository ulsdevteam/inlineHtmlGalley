# Inline HTML Galley plugin for PKP

This plugin provides inline display of article galleys for PKP Open Journal Systems, replacing the default HTML Article Galley plugin's use of an iframe to deliver the HTML Galleys.  Also consider the [Alternate HTML Galley plugin](https://github.com/ajnyga/embedHtmlArticleGalley).  This plugin will present the galley content within your website's Bootstrap3 theme.  The Alternate HTML Galley plugin will present the galley in the same manner as the HTML Article Galley plugin (with just a simple header), but without requiring an iframe. 

## Requirements

* OJS 3.x
  * The PKP plugin htmlArticleGalley (which ships by default with OJS)
* [Bootstrap3 theme](https://github.com/NateWr/bootstrap3)
  * The plugin will function with other themes, but the structure of the blocks conforms to bootstrap3 expectations
* PHP modules
  * [libxml](https://www.php.net/manual/en/book.libxml.php)
  * [dom](https://www.php.net/manual/en/book.dom.php)

## Installation

Install this as a "generic" plugin in OJS.  The preferred installation method is through the Plugin Gallery.

To install manually via the filesystem, extract the contents of this archive to a "inlineHtmlGalley" directory under "plugins/generic" in your OJS root.

To install via Git submodule, target that same directory path: 
```
git submodule add https://github.com/ulsdevteam/inlineHtmlGalley plugins/generic/inlineHtmlGalley
```

If not installed via the Plugin Gallery, run the upgrade script to register this plugin, e.g.: 
```
php lib/pkp/tools/installPluginVersion.php plugins/generic/inlineHtmlGalley/version.xml
```

## Configuration

Login as a Journal Manger and navigate to the Journal for which you wish to use inline display of HTML Galleys.  Enable the plugin via Login -> Settings -> Website -> Plugins -> Inline HTML Galley -> Enable.

Once enabled, the default view of an HTML Galley will extract the HTML `body` from the Galley and will place it inline in the Galley view.  You will need to replicate any CSS or Javascript directives used in the `head` of the Galley in your website configuration.  (Hint: see the Custom Headers plugin.)

The Settings Form allows you to target another arbitrary HTML element from which to extract the HTML, via xpath.  For example, since you likely have the article's title in an `h1` in the `body`, and since Bootstrap3 will render the article title independently, you might want to target a content `div` within the body.

The plugin provides article metadata as sidebar blocks, which may be enabled and positioned via the Website Settings.

## Author / License

Written by Clinton Graham and Chrysanthemum Lovelace for the [University of Pittsburgh](http://www.pitt.edu).  Copyright (c) University of Pittsburgh.

Released under a license of GPL v2 or later.
