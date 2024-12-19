
{if $primaryGalleys || $supplementaryGalleys}
    <div class="pkp_block block_galleys">
        <div class="title">
            <span>{translate key="common.download"}</span>
        </div>
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
    </div>
{/if}