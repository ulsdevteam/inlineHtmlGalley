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
<div class="pkp_block block_inline_html_keywords">
    {* Keywords *}
    {if !empty($keywords[$currentLocale])}
        <div class="list-group-item keywords">
            <strong>{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
                {translate key="semicolon" label=$translatedKeywords}</strong>
            <div class="">
                <span class="value">
                    {foreach from=$keywords item=keyword}
                        {foreach name=keywords from=$keyword item=keywordItem}
                            {$keywordItem|escape}{if !$smarty.foreach.keywords.last}, {/if}
                        {/foreach}
                    {/foreach}
                </span>
            </div>
        </div>
    {/if}
</div>