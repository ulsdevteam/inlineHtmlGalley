{**
 * plugins/generic/inlineHtmlGalley/blockAuthors.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley Authors sidebar block
 *
 * @uses $boolAuthorInfo bool to check whether at least one author has additional info
 *}
{* authors list *}
{if $article->getAuthors()}
	<div class="pkp_block block_inline_html_authors">
		<span class="title">
			{translate key="submission.authors"}
		</span>
		<div class="content">
			<div class="authors_info">
				<ul class="entry_authors_list">
					{strip}
						{foreach from=$article->getAuthors() item=author key=authorNumber}
							<li class="entry_author_block{if $authorNumber > 4} limit-for-mobiles{elseif $authorNumber === 4} fifth-author{/if}">
								{if $author->getOrcid()}
									<a class="orcid-image-url" href="{$author->getOrcid()}">{$orcidIcon}</a>
								{/if}
								<span class="name_wrapper">
									{$author->getFullName()|escape}
								</span>
								{if $authorNumber+1 !== $article->getAuthors()|@count}
									<span class="author-delimiter">, </span>
								{/if}
							</li>
						{/foreach}
						{if $article->getAuthors()|@count > 4}
							<span class="collapse-authors" id="show-all-authors"><ion-icon name="add-circle"></ion-icon></span>
							<span class="collapse-authors hide" id="hide-authors"><ion-icon name="remove-circle"></ion-icon></ion-icon></span>
						{/if}
					{/strip}
				</ul>
			</div>
			<div class="additional-authors-info">
				{if $boolAuthorInfo}
					<a class="more-authors-info-button" id="collapseButton" data-toggle="collapse" href="#authorInfoCollapse" role="button" aria-expanded="false" aria-controls="authorInfoCollapse">
						<ion-icon name="add" class="ion_icon" id="more-authors-data-symbol"></ion-icon>
						<ion-icon name="remove" class="ion_icon hide" id="less-authors-data-symbol"></ion-icon>
						<span class="ion-icon-text">{translate key="plugins.themes.classic.more-info"}</span>
					</a>
				{/if}
				<div class="collapse" id="authorInfoCollapse">
					{foreach from=$article->getAuthors() item=author key=number}
						<div class="additional-author-block">
							{if $author->getLocalizedAffiliation() || $author->getLocalizedBiography()}
								<span class="additional-author-name">{$author->getFullName()|escape}</span>
							{/if}
							{if $author->getLocalizedAffiliation()}
								<br/>
								<span class="additional-author-affiliation">{$author->getLocalizedAffiliation()|escape}</span>
							{/if}
							{if $author->getLocalizedBiography()}
								<br/>
								<a class="more_button" data-toggle="modal" data-target="#modalAuthorBio-{$number}">
									{translate key="plugins.themes.classic.biography"}
								</a>
								{* author's biography *}
								<div class="modal fade" id="modalAuthorBio-{$number}" tabindex="-1" role="dialog" aria-labelledby="modalAuthorBioTitle" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="modalAuthorBioTitle">{translate key="submission.authorBiography"}</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												{$author->getLocalizedBiography()|strip_unsafe_html}
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary" data-dismiss="modal">{translate key="plugins.themes.classic.close"}</button>
											</div>
										</div>
									</div>
								</div>
							{/if}
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
{/if}
