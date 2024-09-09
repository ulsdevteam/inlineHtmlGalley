{**
 * plugins/generic/inlineHtmlGalley/blockDownload.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley download block
 *
 *}

<div class="pkp_block block_inline_html_download">
	{if $primaryGalleys || $supplementaryGalleys}
		<div class="download">
			{if $primaryGalleys}
				{foreach from=$primaryGalleys item=galley}
					{include file="frontend/objects/galley_link.tpl" parent=$article purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
				{/foreach}
			{/if}
			{if $supplementaryGalleys}
				{foreach from=$supplementaryGalleys item=galley}
					{include file="frontend/objects/galley_link.tpl" parent=$article isSupplementary="1"}
				{/foreach}
			{/if}
		</div>
	{/if}
</div>