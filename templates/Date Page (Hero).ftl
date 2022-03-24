<section class="main__sec ">     
    <div class="datepagehero"> 
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1 class="datepagehero__heading"><#if (Title.getData())??>${Title.getData()}</#if></h1>
				</div>  
            </div>
		</div>
	</div>
	<div class="row">
		<div>
			<#assign webContentData = jsonFactoryUtil.createJSONObject(Event.getData())/>
			<@liferay_asset["asset-display"]
			className = webContentData.className
			classPK = getterUtil.getLong(webContentData.classPK, 0)
			/>
        </div>
    </div>
</section>

<style>

  .datepagehero h1{
    text-align: left;
    font-size: 52px;
    line-height: 60px;
    font-family: JMSansMedium;
    letter-spacing: 0px;
    color: #ffffff;
    text-shadow: 0px 0px 8px #000000;
    opacity: 1;
    margin-top: 95px;
    margin-bottom: 34px;
  }
  @media (min-width: 320px) and (max-width: 539px) {
    .datepagehero h1 {
        font-size: 32px;
        margin-bottom: 15px;
      }
  }
  @media (min-width: 540px) and (max-width: 834px) {
    .datepagehero h1 {
        font-size: 42px;
      }
  }
</style>