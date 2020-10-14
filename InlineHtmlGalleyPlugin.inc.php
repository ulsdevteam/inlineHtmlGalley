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
		if (!parent::register($category, $path, $mainContextId)) return false;
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
		$request =& $args[0];
		$issue =& $args[1];
		$galley =& $args[2];
		$article =& $args[3];

		if ($galley && $galley->getFileType() == 'text/html') {
			$templateMgr = TemplateManager::getManager($request);
			$templateMgr->assign(array(
				'issue' => $issue,
				'article' => $article,
				'galley' => $galley,
			));
			$inlineHtmlGalley = $this->_getHTMLContents($request, $galley);
			$inlineHtmlGalleyBody = $this->_extractBodyContents($inlineHtmlGalley);
			$templateMgr->assign('inlineHtmlGalley', $inlineHtmlGalleyBody);
			$templateMgr->display($this->getTemplateResource('displayInline.tpl'));

			return true;
		}

		return false;
	}

	/**
	 * Return string containing the contents of the HTML body
	 * @param $html string
	 * @return string
	 */
	function _extractBodyContents($html) {
		$bodyContent = '';
		try {
			$errorsEnabled = libxml_use_internal_errors();
			libxml_use_internal_errors(true);
			$dom = DOMDocument::loadHTML($html);
			$tags = $dom->getElementsByTagName('body');
			foreach ($tags as $body) {
				foreach ($body->childNodes as $child) {
					$bodyContent .= $dom->saveHTML($child);
				}
				last;
			}
			libxml_use_internal_errors($errorsEnabled);
		} catch (Exception $e) {
			$html = preg_replace('/.*<body[^>]*>/isA', '', $html);
			$html = preg_replace('/<\/body\s*>.*$/isD', '', $html);
			$bodyContent = $html;
		}
		return $bodyContent;
	}
}
