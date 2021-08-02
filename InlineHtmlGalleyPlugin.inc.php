<?php

/**
 * @file plugins/generic/inlineHtmlGalley/InlineHtmlGalleyPlugin.inc.php
 *
 * Copyright (c) University of Pittsburgh
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * @class InlineHtmlGalleyPlugin
 * @ingroup plugins_generic_inlineHtmlGalley
 *
 * @brief Class for InlineHtmlGalley plugin
 */

import('plugins.generic.htmlArticleGalley.HtmlArticleGalleyPlugin');

class InlineHtmlGalleyPlugin extends HtmlArticleGalleyPlugin {
	/**
	 * @see Plugin::register()
	 */
	function register($category, $path, $mainContextId = null) {
		$success = parent::register($category, $path, $mainContextId);
		if (!$success) return false;
		if ($success && $this->getEnabled()) {
			// Load this plugin as a block plugin as well
			$this->import('InlineHtmlGalleyBlockPlugin');
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			$this->import('InlineHtmlGalleySidebarBlockPlugin');
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyAuthorsSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyKeywordsSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyDoiSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyCoverImageSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyPublishedDateSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyHowToCiteSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyLicenseSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyReferencesSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			PluginRegistry::register(
				'blocks',
				new InlineHtmlGalleyGalleysSidebarBlockPlugin($this->getName(), $this->getPluginPath()),
				$this->getPluginPath()
			);
			HookRegistry::register('ArticleHandler::view', array($this, 'articleViewCallback'), HOOK_SEQUENCE_LATE);
			HookRegistry::register('TemplateResource::getFilename', array($this, '_overridePluginTemplates'), HOOK_SEQUENCE_CORE);
		}

		return true;
	}

	/**
	 * Get the display name of this plugin.
	 * @return String
	 */
	function getDisplayName() {
		return __('plugins.generic.inlineHtmlGalley.displayName');
	}

	/**
	 * Get a description of the plugin.
	 */
	function getDescription() {
		return __('plugins.generic.inlineHtmlGalley.description');
	}

	/**
	 * Present the article wrapper page.
	 * @param string $hookName
	 * @param array $args
	 */
	function articleViewCallback($hookName, $args) {
		if ($hookName == "ArticleHandler::view") {
			$request =& $args[0];
			$issue =& $args[1];
			$article =& $args[2];
			$galleys = $article->getGalleys();
			if (!$galleys) return false;

			foreach ($galleys as $galley) {
				if ($galley->getFileType() == 'text/html') {
					$templateMgr = TemplateManager::getManager($request);
					$templateMgr->assign(array(
						'issue' => $issue,
						'article' => $article,
						'galley' => $galley,
						'orcidIcon' => $this->getOrcidIcon()
					));
					$inlineHtmlGalley = $this->_getHTMLContents($request, $galley);
					$inlineHtmlGalleyBody = $this->_extractBodyContents($inlineHtmlGalley, $request->getContext()->getId());
					$templateMgr->assign('inlineHtmlGalley', $inlineHtmlGalleyBody);
					$templateMgr->display($this->getTemplateResource('displayInline.tpl'));

					return true;
				}
			}
		}

		return false;
	}

	/**
	 * Return string containing the contents of the HTML body
	 * @param $html string
	 * @param $contextId int
	 * @return string
	 */
	function _extractBodyContents($html, $contextId) {
		$bodyContent = '';
		try {
			if (!function_exists('libxml_use_internal_errors') || !class_exists('DOMDocument') || !class_exists('DOMXPath')) {
				throw new Exception('Missing libxml/dom requirements');
			}
			$errorsEnabled = libxml_use_internal_errors();
			libxml_use_internal_errors(true);
			$dom = DOMDocument::loadHTML($html);
			$xpath = $this->getSetting($contextId, 'xpath');
			if (empty($xpath)) {
				$tags = $dom->getElementsByTagName('body');
				foreach ($tags as $body) {
					foreach ($body->childNodes as $child) {
						$bodyContent .= $dom->saveHTML($child);
					}
					last;
				}
			} else {
				$domXpath = new DOMXPath($dom);
				$tags = $domXpath->query($xpath);
				foreach ($tags as $tag) {
					$bodyContent .= $dom->saveHTML($tag);
				}
			}
			libxml_use_internal_errors($errorsEnabled);
		} catch (Exception $e) {
			$html = preg_replace('/.*<body[^>]*>/isA', '', $html);
			$html = preg_replace('/<\/body\s*>.*$/isD', '', $html);
			$bodyContent = $html;
		}
		return $bodyContent;
	}

	/**
	 * Return a string of the ORCiD SVG icon
	 *
	 * @return string
	 */
	function getOrcidIcon() {
		$path = Core::getBaseDir() . '/' . $this->getPluginPath() . '/templates/images/orcid.svg';
		return file_exists($path) ? file_get_contents($path) : '';
	}

	/**
	 * @copydoc Plugin::manage()
	 */
	function manage($args, $request) {
		$this->import('InlineHtmlGalleySettingsForm');
		if ($request->getUserVar('verb') == 'settings') {
			$settingsForm = new InlineHtmlGalleySettingsForm($this, $request->getContext()->getId());
			if ($request->getUserVar('save')) {
				$settingsForm->readInputData();
				if ($settingsForm->validate()) {
					$settingsForm->execute();
					return new JSONMessage(true);
				}
			} else {
				$settingsForm->initData();
			}
			return new JSONMessage(true, $settingsForm->fetch($request));
		}
		return parent::manage($args, $request);
	}

	/**
	 * @copydoc Plugin::getActions()
	 */
	function getActions($request, $verb) {
		$router = $request->getRouter();
		import('lib.pkp.classes.linkAction.request.AjaxModal');
		return array_merge(
			$this->getEnabled()?array(
				new LinkAction(
					'settings',
					new AjaxModal(
						$router->url($request, null, null, 'manage', null, array('verb' => 'settings', 'plugin' => $this->getName(), 'category' => 'generic')),
						$this->getDisplayName()
					),
					__('manager.plugins.settings'),
					null
				),
			):array(),
			parent::getActions($request, $verb)
		);
	}
}
