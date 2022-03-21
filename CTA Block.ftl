<div class="container">
	<div class="cta-block_inner">
		<div class="cta_inner_body">
			<header>
				<h3 class="cta_inner_header">${Title.getData()}</h3>
			</header>
			<p class="cta_inner_text">${SubTitle.getData()}</p>
			<#if AdditionalLinks_Title.getSiblings()?has_content>
				<#assign href = '#' >
                <#assign title = 'Explore'>
				<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
					<#if cur_AdditionalLinks_Title?? && cur_AdditionalLinks_Title.getData()?has_content>
						<#assign title = cur_AdditionalLinks_Title.getData()>
						<#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? && cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && bcur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target?? && cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
						</#if>
					</#if>
					<div class="btn__cta">
						<a class="cta_inner_link" href="${href}">
							<span>${title}</span>
							<span class="cta__link-icon"></span>
						</a>
					</div>
				</#list>
            </#if>
		</div>
	</div>
</div>

<style>
.cta__link-icon {
background: url('/o/jm-platinum-theme/images/new__jm__images/arrow__forward.svg') 0 0 no-repeat transparent;
display: block;
width: 24px;
height: 24px;
float: right;
margin-left: 10px;
}
.btn__cta{
width: 25%;
background: #1E22AA;
padding: 30px 0px;
}
h3.cta_inner_header {
font-size: 3.25rem;
line-height: 4.25rem;
font-family: 'JMSansMedium';
opacity: 1;
}
p.cta_inner_text {
font-size: 1.125rem;
line-height: 1.75rem;
font-family: 'JMSansRegular';
opacity: 1;
margin: 25px 0px 30px 0px;
}
a.cta_inner_link {
background: #1E22AA;
float: right;
text-transform: uppercase;
font-weight: 700;
color: white;
text-decoration: none;
margin-top: -11px;
padding-right: 10px;
}
a.cta_inner_link:hover {
background: #1E22AA;
float: right;
text-transform: uppercase;
font-weight: 700;
color: white;
text-decoration: none;
margin-top: -11px;
padding-right: 10px;
}
@media (min-width: 992px) and (max-width: 1199.98px) {
.btn__cta{
width: 30%;
background: #1E22AA;
padding: 30px 0px;
}




}
@media (min-width: 768px) and (max-width: 991.98px) {
.btn__cta {
width: 100%;
background: #1E22AA;
padding: 30px 0px;
}
}
@media (min-width: 576px) and (max-width: 767.98px) {
h3.cta_inner_header {
font-size: 2.5rem;
line-height: 2.625rem;
font-family: 'JMSansMedium';
opacity: 1;
}
p.cta_inner_text {
font-size: 1.5rem;
line-height: 1.625rem;
font-family: 'JMSansRegular';
opacity: 1;
margin: 25px 0px 30px 0px;
}
a.cta_inner_link {
background: #1E22AA;
float: right;
text-transform: uppercase;
font-weight: 700;
color: white;
text-decoration: none;
margin-top: -11px;
padding-right: 10px;
}
a.cta_inner_link:hover {
background: #1E22AA;
float: right;
text-transform: uppercase;
font-weight: 700;
color: white;
text-decoration: none;
margin-top: -11px;
padding-right: 10px;
}
.btn__cta {
width: 100%;
background: #1E22AA;
padding: 30px 0px;
}
}
@media (max-width: 575.98px) {
h3.cta_inner_header {
font-size: 2rem;
line-height: 2.625rem;
font-family: 'JMSansMedium';
opacity: 1;
}
p.cta_inner_text {
font-size: 1rem;
line-height: 1.625rem;
font-family: 'JMSansRegular';
opacity: 1;
margin: 15px 0px 20px 0px;
}
a.cta_inner_link {
background: #1E22AA;
float: right;
text-transform: uppercase;
font-weight: 700;
color: white;
text-decoration: none;
margin-top: -11px;
padding-right: 10px;
}
a.cta_inner_link:hover {
background: #1E22AA;
float: right;
text-transform: uppercase;
font-weight: 700;
color: white;
text-decoration: none;
margin-top: -11px;
padding-right: 10px;
}
.btn__cta {
width: 100%;
background: #1E22AA;
padding: 30px 0px;
}
}
</style>