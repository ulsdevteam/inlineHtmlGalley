{**
 * plugins/generic/inlineHtmlGalley/blockKeywords.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley keywords block
 *
 * @uses $keywords array List of keywords assigned to this article
 *
 *}

{if !empty($publication->getLocalizedData('keywords'))}
	<div class="pkp_block block_inline_html_keywords">
		<span class="title">
			{translate key="article.subject"}
		</span>
		<div class="list-group-item keywords">
			<strong>{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
			{translate key="semicolon" label=$translatedKeywords}</strong>
			<div class="">
				<span class="value">
					{foreach name="keywords" from=$publication->getLocalizedData('keywords') item="keyword"}
						{$keyword|escape}{if !$smarty.foreach.keywords.last}{translate key="common.commaListSeparator"}{/if}
					{/foreach}
				</span>
			</div>
		</div>
	</div>
{/if}