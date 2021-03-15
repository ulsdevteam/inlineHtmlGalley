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