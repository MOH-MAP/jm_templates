<#assign href = '#' >
<#assign title = 'Explore'>

<div class="list-block_container">
    <h1 class="list-block_title">${Name.getData()}</h1>
    <div class="row">
        <div class="list-block-css">
            <div class="product-align">
                <p class="product-css">${SummaryTitle.getData()}</p>
                <h3 class="product-heading">${SummaryText.getData()}</h3>
                <#if Link_Title.getData()?has_content>
				<#assign title = Link_Title.getData()>
					<#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()??>
						<#assign href = Link_Title.Link_Internal.getFriendlyUrl() >
					<#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
						<#assign href = Link_Title.Link_Mailto.getData() >
					<#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
						<#assign href = Link_Title.Link_Media.getData() >
					<#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
						<#assign href = Link_Title.Link_External.getData() >
					<#elseif Link_Title.Link_Target?? && Link_Title.Link_Target.getData()?has_content>
						<#assign href = Link_Title.Link_Target.getData() >
					</#if>
				</#if>
				<div class="btn__listblock">
				    <a class="list_inner_link" href="${href}">
						<span>${title}</span>
						<span class="list__link-icon"></span>
					</a>
				</div>
            </div>
        </div>
    </div>
</div>


<style>
span.list__link-icon {
    background: url(/o/jm-platinum-theme/images/new__jm__images/arrow__forward.svg) 0 0 no-repeat transparent;
    display: block;
    width: 24px;
    height: 24px;
    float: right;
    margin-left: 10px;
}

.btn__listblock {
    width: 30%;
    background: #1E22AA;
    padding: 30px 0px;
}

a.list_inner_link {
    background: #1E22AA;
    float: right;
    text-transform: uppercase;
    font-weight: 700;
    color: white;
    text-decoration: none;
    margin-top: -11px;
    padding-right: 10px;
}

h1.list-block_title {
    font-family: JMSansMedium;
    padding: 10px 0px 30px 0px;
    font-size: 34px;
    letter-spacing: 0px;
    color: #333333;
    opacity: 1;
}

.list-block-css {
background: #F2F2F2 0% 0% no-repeat padding-box;
}

.product-align {
    flex: 1 1 auto;
    min-height: 1px;
    padding-bottom: 1.25rem;
    padding-left: 1.25rem;
    padding-right: 1.25rem;
    padding-top: 1.25rem;
}

.product-css {
    letter-spacing: 0px;
    color: #333333;
    text-transform: capitalize;
    opacity: 1;
    font-size: 14px;
    line-height: 16px;
    font-family: 'JMSansRegular';
    text-align: left;
}

.product-heading {
    font-size: 25px;
    line-height: 1.2em;
    font-weight: 500;
    font-family: JMSansRegular;
    color: #333333;
    opacity: 1;
    margin-top: 10px;
    margin-bottom: 20px;
    margin-right: 20%;
}

.list-block_container {
    background: #fff;
    border-color: transparent;
    border-style: solid;
    border-width: 1px 1px 1px 1px;
    padding: 1rem 4rem;
    word-wrap: break-word;
}

.btn__listblock{
    width: 25%;
    background: #1E22AA;
    padding: 30px 0px;
}

a.list_inner_link {
    background: #1E22AA;
    float: right;
    text-transform: uppercase;
    font-weight: 700;
    color: white;
    text-decoration: none;
    margin-top: -11px;
    padding-right: 10px;
}

a.list_inner_link:hover {
    background: #1E22AA;
    float: right;
    text-transform: uppercase;
    font-weight: 700;
    color: white;
    text-decoration: none;
    margin-top: -11px;
    padding-right: 10px;
}

@media(min-width: 835px) and (max-width:1024px){
    .product-heading{
        margin-right: 0%;
    }
}

@media(min-width: 540px) and (max-width:834px){
    .list-block_container {
        padding: 0.5rem 2rem;
    }

    h1.list-block_title {
        font-size: 30px;
    }
    .product-heading {
        font-size: 23px;
        margin-top: 10px;
        margin-bottom: 20px;
        margin-right: 0%;
    }

    .product-css{
        font-size:13px;
        margin:0px
    }
    .product-align {
        flex: 1 1 auto;
        min-height: 1px;
        padding-bottom: 1rem;
        padding-left: 1rem;
        padding-right: 1rem;
        padding-top: 1rem;
    }
}

@media(min-width: 320px) and (max-width: 539px) {
    .list-block_container {
        padding: 0rem 1rem;
    }

    h1.list-block_title{
        padding: 10px 0px 10px 0px;
        font-size: 24px;
    }

    .product-align{
        flex: 1 1 auto;
        min-height: 1px;
        padding-bottom: 0.75rem;
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        padding-top: 0.75rem;
    }

    .product-css{
        font-size:13px;
        margin:0px;
    }

    .product-heading{
        font-size: 20px;
        margin-bottom: 0px;
        margin-top: 5px;
        margin-right: 20%;
    }

    .list-block-css {
        background: #F2F2F2 0% 0% no-repeat padding-box;
        border-bottom: #1E22AA 10px solid;
    }



@media (min-width: 992px) and (max-width: 1199.98px) {
    .btn__listblock{
    width: 30%;
    background: #1E22AA;
    padding: 30px 0px;
    }
}

@media (min-width: 768px) and (max-width: 991.98px) {

    .btn__listblock {
        width: 100%;
        background: #1E22AA;
        padding: 30px 0px;
    }
    }
}
</style>