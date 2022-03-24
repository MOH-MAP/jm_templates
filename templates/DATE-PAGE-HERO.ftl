<section class="main__sec ">     
    <div class="hero"> 
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
        <#assign
	webContentData = jsonFactoryUtil.createJSONObject(Event.getData())
/>
<@liferay_asset["asset-display"]
className = webContentData.className
classPK = getterUtil.getLong(webContentData.classPK, 0)
/>
        </div>
        </div>
</section>
<style>
*{
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}

.hero{
    background-image: url('background.svg');
    background-position: center;
	  background-size: cover;
    width: 100%;
    height: 430px;
    position: relative;
  }
  .datepagehero__heading{
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
    .datepagehero__heading {
        font-size: 32px;
        margin-bottom: 15px;
      }
  }
  @media (min-width: 540px) and (max-width: 834px) {
    .datepagehero__heading {
        font-size: 42px;
      }
  }
</style>