<#assign namespace = randomNamespace />

<style>
.banner-${namespace} {
    <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
	background-image: url("${ImageLarge.getData()!}");
    </#if>
	background-position: center;
	background-size: cover;
	background-position: center center;
	height: 363px;
}
@media(min-width: 320px) and (max-width: 539px){
  .banner-${namespace} {
    <#if (ImageSmall.getData())?? && ImageSmall.getData() != "">
	background-image: url("${ImageSmall.getData()!}");
    </#if>
    height: 463px;
  }
  }

</style>

<div class="banner banner-${namespace} ">
    <div class="centered container">
    	<p ><#if (Summary.getData())??>${Summary.getData()}</#if></p>
    	<h1 class="career__heading"><#if (Title.getData())??>${Title.getData()}</#if></h1>
		<form id="career-search-frm-${namespace}" action="${ResultsPage.getFriendlyUrl()}" autocomplete="off">
			<div class="career__input__sec">
					 <div class="dept__sec">
    			        <input id="q-${namespace}" name="q" class="career__input" type="text"
						placeholder="Enter job title, department or other keywords" />
    			     </div>
					    <div class="career__dropdown__sec">
						<div class="career__dropdown">
							<input type="text" placeholder="Location"
							class="textBox" readonly>
						    <div class="career__option">
						    <div> United States </div>
						     <div> United Kingdom </div>
							<div >Argentina</div>
							<div >Australia</div>
							<div >Azerbaijan</div>
							<div >Bahrain</div>
							<div >Belgium</div>
							<div >Brazil</div>
							<div >Canada</div>
							<div >China</div>
							<div >Finland</div>
							<div >France</div>
							<div >Germany</div>
							<div >HongKong</div>
							<div >India</div>
							<div >Indonesia</div>
							<div >Israel</div>
							<div >Italy</div>
							<div >Japan</div>
							<div>Kazakhstan </div>
					        <div>Macedonia </div>
					        <div>Malaysia </div>
					        <div>Mexico </div>
					        <div>Netherlands </div>
					        <div> Norway</div>
					        <div>Oman </div>
					        <div>Poland </div>
					        <div>Qatar </div>
					        <div>Russia </div>
					        <div>Singapore </div>
					        <div>South Africa </div>
					        <div>South Korea </div>
					         <div>Sweden </div>
					        <div>Switzerland </div>
					        <div>Thailand</div>
					        <div>Trinidad and Tobago </div>
					        <div>United Arab Emirates</div>

						</div>
						</div>
						</div>
						 <div class="button__sec">
						<button id="submit-${namespace}" class=" submit__btn">SUBMIT
						<span class="arrow__forward"></span>
						</button>
    			        </div>
						</div>
    	</form>
	</div>
</div>