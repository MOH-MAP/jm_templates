<#assign namespace = randomNamespace />
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />

<div id="annual-report-slide-${namespace} jmproduct--hero-temp" class="annual-report-slide">
	<div class="container">
		<div class="row">
			<div class=" col-md-6" >
				<h1 class="sndproduct__heading">${Name.getData()}</h1>
				<p class="sndproduct__para">${Summary.getData()}</p>
			</div>
			<div class="col-md-6 sndpanel__cont">
				<a class="sndpanel__btn">${ReadMoreText.getData()}
				<span class="arrow__forward"></span></a>
			</div>
		</div>
	</div>
</div>

<style>
#annual-report-slide-${namespace} {
	background-image: url("${ImageLarge.getData()}");
}
</style>