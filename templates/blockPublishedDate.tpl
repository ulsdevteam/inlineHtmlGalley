{**
 * plugins/generic/inlineHtmlGalley/blockPublishedDate.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley Published Date block
 *
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 *
 *}
{* Published date *}
{if $article->getDatePublished()}
    <div class="pkp_block block_inline_html_published_date">
        <div class="published_date">
            <span class="published_date_label">
                {translate key="submissions.published"}
            </span>
            <span class="published_date_value">
                {$article->getDatePublished()|date_format:$dateFormatLong}
            </span>
        </div>
    </div>
{/if}