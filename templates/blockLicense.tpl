{**
 * plugins/generic/inlineHtmlGalley/blockLicense.tpl
 *
 * Copyright (c) University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Inline HTML Galley License block
 *
 *}

{if $licenseTerms || $licenseUrl}
	<div class="pkp_block block_inline_html_license">
		<span class="title">
			{translate key="submission.license"}
		</span>
		<div class="panel panel-default copyright">
			<div class="panel-body">
				{if $licenseUrl}
					{if $ccLicenseBadge}
						{$ccLicenseBadge}
					{else}
						<a href="{$licenseUrl|escape}" class="copyright">
							{if $copyrightHolder}
								{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$copyrightYear}
							{else}
								{translate key="submission.license"}
							{/if}
						</a>
					{/if}
				{/if}
				{$licenseTerms}
			</div>
		</div>
	</div>
{/if}