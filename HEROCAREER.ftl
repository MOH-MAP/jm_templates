<#assign namespace = randomNamespace />

<style>
.banner-${namespace} {
    <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
		background-image: url("${ImageLarge.getData()!}");
    </#if>
}
@media(min-width: 320px) and (max-width: 539px){
  .banner-${namespace} {
    <#if (ImageSmall.getData())?? && ImageSmall.getData() != "">
		background-image: url("${ImageSmall.getData()!}");
    </#if>
  }
}
</style>

<div class="jmcareerhero__banner banner-${namespace} ">
    <div class="jmcareerhero__center container">
    	<p class="jmcareerhero__pretitle"><#if (Summary.getData())??>${Summary.getData()}</#if></p>
    	<h1 class="jmcareerhero__heading"><#if (Title.getData())??>${Title.getData()}</#if></h1>
		<form id="jmcareer-search-frm-${namespace}" action="${ResultsPage.getFriendlyUrl()}" autocomplete="off">
			<div class="jmcareer-input--sec">
					 <div class="jmdept--sec">
    			        <input id="q-${namespace}" name="q" class="jmcareer--input" type="text"
						placeholder="Enter job title, department or other keywords" />
    			     </div>
					    <div class="jmcareerhero__dropdown--sec">
						<div class="jmcareerhero__dropdown">
							<input type="text" placeholder="Location"
							class="textBox" readonly>
						    <div class="jmcareerhero__option">
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
						 <div class="jmcareerhero__btn--sec">
						<button id="submit-${namespace}" class="jmcareerhero__submit--btn">SUBMIT
						<span class="jmcareerhero__arrow"></span>
						</button>
    			        </div>
						</div>
    	</form>
	</div>
</div>