<?php

/**
 * @file plugins/generic/inlineHtmlGalley/InlineHtmlGalleySidebarBlockPlugin.inc.php
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * @class InlineHtmlGalleySidebarBlockPlugin
 * @ingroup plugins_generic_inlineHtmlGalley
 *
 * @brief Class for Inline HTML Galley sidebar block plugin
 */

import('plugins.generic.inlineHtmlGalley.InlineHtmlGalleyBlockPlugin');

abstract class InlineHtmlGalleySidebarBlockPlugin extends InlineHtmlGalleyBlockPlugin {

    abstract function blockName();

    /**
	 * Get the display name of this plugin.
	 * @return String
	 */
	function getDisplayName() {
		return __('plugins.generic.inlineHtmlGalley.block.' . $this->blockName() . '.displayName');
	}

	/**
	 * Get a description of the plugin.
	 * @return String
	 */
	function getDescription() {
		return __('plugins.generic.inlineHtmlGalley.block.' . $this->blockName() . '.description');
	}

	/**
	 * Get the name of the block template file.
	 * @return String
	 */
	function getBlockTemplateFilename() {
		return 'block' . ucfirst($this->blockName()) . '.tpl';
	}

}

class InlineHtmlGalleyAuthorsSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "authors";
    }
}

class InlineHtmlGalleyKeywordsSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "keywords";
    }
}

class InlineHtmlGalleyDoiSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "doi";
    }

    /**
	 * @copydoc BlockPlugin::getContents()
	 */
	function getContents($templateMgr, $request = null) {
        if ($templateMgr && $request) {
            $pubIdPlugins = $templateMgr->getTemplateVars('pubIdPlugins');
            if ($pubIdPlugins) {
                foreach ($pubIdPlugins as $pubIdPlugin) {
                    if ($pubIdPlugin->getPubIdType() == 'doi') {
                        return parent::getContents($templateMgr, $request);
                    }
                }
            }
        }

        return false;
    }
}

class InlineHtmlGalleyCoverImageSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "coverImage";
    }
}

class InlineHtmlGalleyDetailsSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "details";
    }
}

class InlineHtmlGalleyPublishedDateSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "publishedDate";
    }
}

class InlineHtmlGalleyHowToCiteSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "howToCite";
    }
}

class InlineHtmlGalleyLicenseSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "license";
    }
}

class InlineHtmlGalleyReferencesSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "references";
    }
}

class InlineHtmlGalleyGalleysSidebarBlockPlugin extends InlineHtmlGalleySidebarBlockPlugin {
    function blockName() {
        return "galleys";
    }
}
