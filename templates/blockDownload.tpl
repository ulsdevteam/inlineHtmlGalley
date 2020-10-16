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
	<h2 class="title">{translate key="article.nonpdf.title"}</h2>
	<div class="content">
		<span class="downloadLinkContainer">
			<a class="obj_galley_link file" href="{url page="article" op="download" path=$submissionId|to_array:$galleyId}">
				{translate key="common.download"}
			</a>
		</span>
	</div>
</div>

