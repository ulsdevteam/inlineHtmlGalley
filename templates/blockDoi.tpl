{**
 * plugins/generic/inlineHtmlGalley/blockDoi.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley DOI block
 *
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 *
 *}
<div class="pkp_block block_inline_html_doi">
    <span class="title">{translate key="plugins.pubIds.doi.readerDisplayName"}</span>
    <div class="content">
    {* DOI (requires plugin) *}
    {foreach from=$pubIdPlugins item=pubIdPlugin}
        {if $pubIdPlugin->getPubIdType() != 'doi'}
            {continue}
        {/if}
        {assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
        {if $pubId}
            {assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
            <div class="doi">
                <span class="doi_value">
                    <a href="{$doiUrl}">
                        {* maching DOI's (with new and old format) *}
                        {$doiUrl|escape}
                    </a>
                </span>
            </div>
        {/if}
    {/foreach}
    </div>
</div>
