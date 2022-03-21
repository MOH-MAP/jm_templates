<div class="hero">
      <div class="container">
       <div class="row">
            <div class=" article__cont">
              <h1 class="article__heading">${Name.getData()}</h1>
              <p class="article__para"><#if (SubTitle.getData())??>${SubTitle.getData()}</#if></p>
             <div> <#assign Date_Data = getterUtil.getString(Date.getData())>
             <#if validator.isNotNull(Date_Data)>
	         <#assign Date_DateObj = dateUtil.parseDate("yyyy-MM-dd", Date_Data, locale)>
             ${dateUtil.getDate(Date_DateObj, "dd MMM yyyy - HH:mm:ss", locale)}
             </#if></div>
               <#if Link_Title?? && Link_Title.getData()?has_content>
               <#assign linkHref = "#" />
                    <#if Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                        <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                        </#if>
                        <#if Link_Title.Link_Media.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_Media.getData() />
                        </#if>
                        <#if Link_Title.Link_Mailto.getData()?has_content>
                            <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                        </#if>    
                        <#if Link_Title.Link_External.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_External.getData() />
                        </#if>
                           <div>
                                <a class="article__btn" href="${linkHref}">${Link_Title.getData()}
                                <span class="arrow__forward"></span></a>
                          </div>
                </#if>
            </div>
        </div>
    </div>
        
    </div>

<style>
.hero {
  background-image: url("${ImageLarge.getData()}");
  background-position: center;
  background-size: cover;
  width: 100%;
  height: 457px;
  position: relative;
}
.article__para {
  text-align: left;
  font-size: 16px;
  line-height: 25px;
  font-family: JMSansMedium;
  letter-spacing: 0px;
  color: #ffffff;
  text-shadow: 0px 0px 8px #000000;
  opacity: 0.8;
}
.article__heading {
  text-align: left;
  font-size: 48px;
  line-height: 60px;
  font-family: JMSansMedium;
  letter-spacing: 0px;
  color: #ffffff;
  text-shadow: 0px 0px 8px #000000;
  opacity: 1;
  margin-top: 74px;
  margin-bottom: 21px;
}
.article__btn {
  display: flex;
  background-color: #1e22aa;
  color: #fff !important;
  width: 321px;
  border: none;
  outline: none;
  padding: 20px 10px 17px 24px;
  justify-content: flex-end;
  text-align: right;
  font-size: 18px;
  font-family: JMSansMedium;
  line-height: 22px;
  letter-spacing: 0px;
  text-transform: uppercase;
  margin-bottom: 30px;
  text-decoration: none !important;
  position: absolute;
  bottom: 80px;
}
.article__btn:hover {
  text-decoration: none;
  color: #fff;
}
.article__cont a {
  text-decoration: none;
  color: #fff;
  background-color: #1e22aa;
}
.article__cont a:hover {
  text-decoration: none !important;
  color: #fff;
  background-color: #1e22aa;
}
.arrow__forward {
  background: url(" arrow_forward-white.svg") 0 0 no-repeat transparent;
  display: block;
  width: 24px;
  height: 24px;
  margin-left: 8px;
  top: 50%;
  margin-top: -2px;
}
.article__cont {
  padding: 0 15px;
}
@media (min-width: 320px) and (max-width: 539px) {
  .article__cont {
    padding: 0 15px;
  }
  .article__btn {
    width: 328px;
    padding: 15px 10px 16px 0px;
    font-size: 16px;
    bottom: 40px;

  }
  .article__heading {
    font-size: 32px;
    margin-bottom: 24px;
  }
  .arrow__forward {
    background: url(" arrow_forward-white-20.svg") 0 0 no-repeat transparent;
    display: block;
    width: 24px;
    height: 24px;
    margin-left: 8px;
    top: 50%;
    margin-top: 0px;
  }
}
@media (min-width: 540px) and (max-width: 834px) {
  .article__heading {
    font-size: 44px;
  }
}
</style>