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
{* Keywords *}
{if !empty($keywords[$currentLocale])}
    <div class="pkp_block block_inline_html_keywords">
        <span class="title">
            {translate key="article.subject"}
        </span>
        <div class="content">
            <div class="keywords">
                {foreach from=$keywords item=keyword}
                    {foreach name=keywords from=$keyword item=keywordItem}
                        {$keywordItem|escape}{if !$smarty.foreach.keywords.last}, {/if}
                    {/foreach}
                {/foreach}
            </div>
        </div>
    </div>
{/if}
