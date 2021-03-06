<#assign namespace=randomNamespace />

<#assign imgPresent = ((ImageLarge.getData())?? && ImageLarge.getData() != "")>

<#if imgPresent >
    <#assign bgImage = ImageLarge.getData() />
</#if>

<script>
    $(document).ready(function () {
        $(".jm-rt-image-block").click(function () {
            if ($(this).hasClass("specifications--in")) {
                $(this).removeClass("specifications--in");
            } else {
                $(this).addClass("specifications--in");
            }
        });
    });
</script>

<div id="product-hero-${namespace}" class="product_hero">
    <div class="container">
        <div class="row">
            <div class="jm-richtext-item-text">
				<div class="jm-richtext-heading">
					<h1 class="product_hero__heading"><#if (Name.getData())??>${Name.getData()}</#if></h1>
					<div class="product_hero__para"><#if (Summary.getData())??>${Summary.getData()}</#if></div>
						<#if Link_Title?? && Link_Title.getData()?has_content>
							<#assign linkHref = "#" />
							<#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
								<#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
							<#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
								<#assign linkHref = Link_Title.Link_Media.getData() />
							<#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
								<#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
							<#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
								<#assign linkHref = Link_Title.Link_External.getData() />
							</#if>
							<div class="">
								<div class="">
								<a href="${linkHref}" class="panel__btn">${Link_Title.getData()} <span class="arrow__forward"></span></a>
								</div>
							</div>
						</#if>
            
					<#if AdditionalLinks_Title.getSiblings()?? && AdditionalLinks_Title.getSiblings()?has_content>
						<#assign href = '#' >
						<#assign title = 'Explore'>
						<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
							<#if cur_AdditionalLinks_Title?? && cur_AdditionalLinks_Title.getData()?has_content>
								<#assign title = cur_AdditionalLinks_Title.getData()>
								<#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
									<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
								<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? && cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
									<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
								<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
									<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
								<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
									<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
								<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target?? && cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
									<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
								</#if>
								<div class="panel__btn">
									<a href="${href}">${title}
									<span class="arrow__forward"></span></a>
								</div>
							</#if>
						</#list>
					</#if>
				</div>
			</div>
			
			<#if SpecificationTitle.getData()?has_content>
				<div class="jm-richtext-item-image">
					<div class="jm-rt-image-block">
						<div class="jm-text-slider">
							<div class="jm-rxtx-slider-btn-block">
								<div class="jm-button-block-rctx">
									<span>${SpecificationTitle.getData()}</span></span>
								</div>
								<div class="jm-product-info-container">
									${Specification.getData()}
								</div>
							</div>
						</div>
					</div>
				</div>
			</#if>			
        </div>
    </div>
</div>

<style>
    .jm-richtext-collapsed {
  display: flex;
  flex-wrap: wrap;
}
.jm-richtext-item-text {
  flex: 50%;
  padding: 2%;
  margin-top: 5%;
}
.jm-richtext-item-image {
  flex: 50%;
  padding: 2%;
}
.jm-richtext-heading > p {
  font-size: 38px;
  line-height: 46px;
  text-align: left;
  letter-spacing: 0px;
  color: #333333;
  opacity: 1;
  font-family: JMSansMedium;
}
.jm-richtext-para > p {
  font-size: 16px;
  line-height: 27px;
  text-align: left;
  letter-spacing: 0px;
  color: #333333;
  opacity: 0.84;
}
.jm-rt-image-block {
  background: url(${bgImage});
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  height: 464px;
  width: 100%;
  position: relative;
  overflow: hidden;
}
.jm-text-slider {
  background-color: #1e22aa;
  position: absolute;
  height: 100%;
  z-index: 2;
  top: 0;
  width: 100%;
  z-index: 2;
  left: 0%;
  right: 0;
  animation: sneakPeak 2.5s cubic-bezier(0.35, 0.75, 0.38, 1.37);
  left: calc(100% - 3.75rem);
}
.jm-product-info-container {
  color: #ffffff;
  padding: 2%;
}
.jm-product-info-container p {
  font-size: 16px;
  text-align: left;
  letter-spacing: 0px;
  color: #ffffff;
  opacity: 0.8;
  font-family: JMSansRegular;
}
.jm-product-info-container ol > li > menu {
  color: #ffffff;
}
.jm-button-block-rctx {
  background-color: #1e22aa;
}
.specifications--in .jm-button-block-rctx span {
  background-color: #1e22aa;
  color: #ffffff;
  display: inline-block;
  text-transform: uppercase;
  font-size: 18px;
  font-family: JMSansMedium;
  transform: rotate(90deg) translateY(1.625rem) translateX(9.9375rem);
}
.specifications--in .jm-button-block-rctx span:after {
  content: "";
  color: #ffffff;
  font-weight: bold;
  float: right;
  margin-left: 5px;
  background-image: url("http://localhost:8080/documents/20121/0/chevron-right-white.svg/a70d58b0-7d40-e723-7681-6d3cf8343242?t=1646987035028");
  background-repeat: no-repeat;
  background-size: 20px 20px;
  height: 20px;
  width: 20px;
  transform: rotate(272deg) translateY(-6.375rem) translateX(0.1rem);
}
/* after specification remove */
.jm-button-block-rctx span {
  background-color: #1e22aa;
  display: inline-block;
  text-transform: uppercase;
  font-size: 15px;
  font-family: JMSansMedium;
  transform: rotate(89deg) translateY(1.4rem) translateX(9.9375rem);
  text-align: left;
  letter-spacing: 0px;
  color: #ffffff;
  opacity: 0.8;
}
.jm-button-block-rctx span:after {
  content: "";
  color: #ffffff;
  font-weight: bold;
  float: right;
  margin-left: 5px;
  background-image: url("http://localhost:8080/documents/20121/0/chevron-right-white.svg/a70d58b0-7d40-e723-7681-6d3cf8343242?t=1646987035028");
  background-repeat: no-repeat;
  background-size: 20px 20px;
  height: 20px;
  width: 20px;
  transform: rotate(90deg) translateY(4.625rem) translateX(-1.3rem);
}
.jm-rxtx-slider-btn-block {
  display: flex;
}
.jm-button-block-rctx {
  display: flex;
  flex-direction: column;
  width: 18%;
  padding: 2%;
}
.specifications--in .product-info__specs {
  -webkit-transform: translateX(calc(-100% + 3.75rem));
  -ms-transform: translateX(calc(-100% + 3.75rem));
  transform: translateX(calc(-100% + 3.75rem));
}
.specifications--in .jm-text-slider {
  background-color: #1e22aa;
  position: absolute;
  height: 100%;
  z-index: 2;
  top: 0;
  width: 100%;
  z-index: 2;
  left: 0%;
  right: 0;
}
.jm-rt-ol-menulist {
  display: flex;
  flex-wrap: wrap;
  margin-left: 10px;
  font-size: 16px;
  text-align: left;
  letter-spacing: 0px;
  color: #ffffff;
  opacity: 0.8;
  font-family: JMSansRegular;
}
.jm-rt-ol-menulist > ul > li {
  padding: 2%;
  margin: 2%;
  list-style-type: decimal;
}
.jm-rt-ol-menulist > ul > li > a {
  color: #ffffff;
  text-decoration: none;
}
.jm-rt-list-container {
  list-style: none;
  margin: 0;
  padding: 0;
}
.jm-rt-li-item {
  background: transparent;
  padding: 5px;
  width: 105px;
  height: 25px;
  margin: 10px;
  line-height: 50px;
  color: white;
  font-size: 12px;
  text-align: left;
}
.rt-list-flex {
  padding: 0;
  margin: 0;
  list-style: none;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  flex-flow: column;
  -webkit-flex-flow: none;
  justify-content: start;
}

/********** media queries ************/

@media screen and (max-width: 768px) {
  .jm-richtext-collapsed {
    padding: 2%;
  }
  .jm-richtext-item-text {
    flex: 100%;
  }
  .jm-richtext-item-image {
    flex: 100%;
  }
  .jm-richtext-heading > p {
    font-size: 30px;
    line-height: 40px;
  }
  .jm-richtext-para > p {
    font-size: 14px;
    line-height: 20px;
    font-family: JMSansRegular;
  }
  .jm-product-info-container {
    color: #ffffff;
    padding: 2%;
    margin-top: 5%;
  }
  .jm-product-info-container p {
    font-size: 12px;
  }
  .jm-rt-ol-menulist {
    font-size: 12px;
    display: flex;
    flex-wrap: wrap;
    margin-left: 10px;
  }
  .jm-rt-ol-menulist > ul {
    list-style-type: desimal;
    /* display: inline-block; */
  }
  .jm-rt-ol-menulist > ul > li {
    padding: 2%;
    margin: 2%;
  }
  .jm-rt-ol-menulist > ul > li > a {
    color: #ffffff;
    text-decoration: none;
  }
  .jm-rt-list-container {
    list-style: none;
    margin: 0;
    padding: 0;
  }
  .jm-rt-li-item {
    background: transparent;
    padding: 5px;
    width: 105px;
    height: 25px;
    margin: 10px;
    line-height: 50px;
    color: white;
    font-size: 12px;
    text-align: left;
  }
  .rt-list-flex {
    padding: 0;
    margin: 0;
    list-style: none;

    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    flex-flow: column;
    -webkit-flex-flow: row wrap;
    justify-content: start;
  }
  .jm-button-block-rctx {
    width: 26%;
    padding: 2%;
  }
  .jm-button-block-rctx span {
    font-size: 16px;
  }
  .jm-button-block-rctx span:after {
    transform: rotate(90deg) translateY(6.625rem) translateX(0.1rem);
  }
  .specifications--in .jm-text-slider {
    /* left: calc(100% - 2.75rem); */
  }
  .specifications--in .jm-button-block-rctx {
    width: 26%;
    padding: 2%;
  }
  .specifications--in .jm-button-block-rctx span {
    font-size: 15px;
  }
  .jm-button-block-rctx span {
    background-color: #1e22aa;
    display: inline-block;
    text-transform: uppercase;
    font-size: 16px;
    font-family: JMSansMedium;
    transform: rotate(90deg) translateY(0.625rem) translateX(9.9375rem);
    text-align: left;
    letter-spacing: 0px;
    color: #ffffff;
    opacity: 0.8;
  }
}

@media screen and (min-width: 769px) and (max-width: 1100px) {
  .jm-richtext-item-text {
    flex: 100%;
  }
  .jm-richtext-item-image {
    flex: 100%;
  }
  .jm-button-block-rctx span {
    background-color: #1e22aa;
    display: inline-block;
    text-transform: uppercase;
    font-size: 16px;
    font-family: JMSansMedium;
    transform: rotate(89deg) translateY(2.625rem) translateX(12.9375rem);
    text-align: left;
    letter-spacing: 0px;
    color: #ffffff;
    opacity: 0.8;
  }
  .jm-button-block-rctx span:after {
    content: "";
    color: #ffffff;
    font-weight: bold;
    float: right;
    margin-left: 5px;
    background-image: url(./assets/chevron-right-white.svg);
    background-repeat: no-repeat;
    background-size: 20px 20px;
    height: 20px;
    width: 20px;
    transform: rotate(90deg) translateY(7.625rem) translateX(-0.0625rem);
  }
  .specifications--in .jm-button-block-rctx span {
    background-color: #1e22aa;
    color: #ffffff;
    display: inline-block;
    text-transform: uppercase;
    font-size: 20px;
    font-family: JMSansMedium;
    transform: rotate(90deg) translateY(1.625rem) translateX(13.9375rem);
  }
  .specifications--in .jm-button-block-rctx span:after {
    content: "";
    color: #ffffff;
    font-weight: bold;
    float: right;
    margin-left: 5px;
    background-image: url(./assets/chevron-right-white.svg);
    background-repeat: no-repeat;
    background-size: 20px 20px;
    height: 20px;
    width: 20px;
    transform: rotate(272deg) translateY(-7.375rem) translateX(-0.0625rem);
  }
}
</style>