<?php

/**
 * @file plugins/generic/inlineHtmlGalley/InlineHtmlGalleyBlockPlugin.inc.php
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * @class InlineHtmlGalleyBlockPlugin
 * @ingroup plugins_generic_inlineHtmlGalley
 *
 * @brief Class for Inline HTML Galley block plugin
 */

import('lib.pkp.classes.plugins.BlockPlugin');

class InlineHtmlGalleyBlockPlugin extends BlockPlugin {

	/** @var $parentPluginName string name of InlineHtmlGalley plugin */
	var $parentPluginName;

	/** @var $pluginPath string path to InlineHtmlGalley plugins */
	var $pluginPath;

	/**
	 * Constructor
	 * @param $parentPluginName string
	 * @param $pluginPath string
	 */
	function __construct($parentPluginName, $pluginPath) {
		parent::__construct();
		$this->parentPluginName = $parentPluginName;
		$this->pluginPath = $pluginPath;
	}

	/**
	 * Override currentVersion to prevent upgrade and delete management.
	 * @return boolean
	 */
	function getCurrentVersion() {
		return false;
	}

	/**
	 * @copydoc LazyLoadPlugin::getEnabled()
	 */
	function getEnabled($contextId = null) {
		if (!Config::getVar('general', 'installed')) return true;
		return parent::getEnabled($contextId);
	}

	/**
	 * Get the display name of this plugin.
	 * @return String
	 */
	function getDisplayName() {
		return __('plugins.generic.inlineHtmlGalley.block.download.displayName');
	}

	/**
	 * Get a description of the plugin.
	 * @return String
	 */
	function getDescription() {
		return __('plugins.generic.inlineHtmlGalley.block.download.description');
	}

	/**
	 * Hide this plugin from the management interface (it's subsidiary)
	 * @return boolean
	 */
	function getHideManagement() {
		return true;
	}

	/**
	 * Get the supported contexts (e.g. BLOCK_CONTEXT_...) for this block.
	 * @return array
	 */
	function getSupportedContexts() {
		return array(BLOCK_CONTEXT_SIDEBAR);
	}

	/**
	 * Get the parent plugin
	 * @return object
	 */
	function &getParentPlugin() {
		$plugin = PluginRegistry::getPlugin('generic', $this->parentPluginName);
		return $plugin;
	}

	/**
	 * Override the builtin to get the correct plugin path.
	 * @return string
	 */
	function getPluginPath() {
		return $this->pluginPath;
	}

	/**
	 * Get the name of the block template file.
	 * @return String
	 */
	function getBlockTemplateFilename() {
		return 'blockDownload.tpl';
	}

	/**
	 * @copydoc BlockPlugin::getContents()
	 */
	function getContents($templateMgr, $request = null) {
		if ($templateMgr && $request) {
			$router = $request->getRouter();
			if ($router->getRequestedPage($request) === 'article' && $router->getRequestedOp($request) === 'view') {
				$submission = $templateMgr->getTemplateVars('article');
				$galley = $templateMgr->getTemplateVars('galley');
				if ($submission && $galley && $galley->getFileType() == 'text/html') {
					$templateMgr->assign('submissionId', $submission->getBestArticleId());
					$templateMgr->assign('galleyId', $galley->getBestGalleyId());
					return parent::getContents($templateMgr);
				}
			}
		}
		return false;
	}
}

?>
