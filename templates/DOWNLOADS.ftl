<div class="download_container ">
<div class="download_inner_container download_card">
<div class="row">
<div class="col-md-9 download-left-side">
<h1><#if (Title.getData())??>${Title.getData()}</#if></h1>
<#if (File.getData())?? && File.getData() != "">
<a href="${File.getData()}" target="_blank"  class="download_list-link">
	<span class="download_list-item">${languageUtil.format(locale, "download-x", "File", false)}
	<span>${FileType.getData()}</span></span>
    <span class="download_link-icon"></span>
</a>
</#if>
</div>
<div class="col-md-3 download-right-side">
<#if (Image.getData())?? && Image.getData() != "">
<img class="download_right_img" alt="${Image.getAttribute("alt")}" data-fileentryid="${Image.getAttribute("fileEntryId")}" src="${Image.getData()}" />
</#if>
</div>
</div>
</div>
</div>

<style>
.download_container {
margin: 10px 150px;
}
.download_inner_container{
background:#FAFAFA;
padding: 20px 20px;
}
p.download_text_para {
font-size: 16px;
/* color: #333333; */
letter-spacing: 0px;
color: #333333;
opacity: 0.84;
}
span.download_list-item {
text-align: left;
letter-spacing: 0px;
color: #1E22AA;
opacity: 1;
font-size: 18px;
font-family: 'JMSansMedium';
}

.download_link-icon {
background: url(/documents/41563/41603/download-icon.svg/aedc95c0-1d9a-bc8b-c19d-36ccecb1c9b8?t=1642578062283) 0 0 no-repeat transparent;
display: block;
width: 24px;
height: 24px;
margin-left: 1rem;
margin-top: 0px;
float: right;
}
.download_list-item .download_list-link {
text-decoration: none;
color: #1E22AA;
font: 18px/22px JMSansMedium;
display: flex;
margin-left: 60px;
}
a.download_list-link {
position: absolute;
bottom: 0px;
color: #1E22AA;
}
.download-left-side h1 {
font-size:38px;
font-family: JMSansMedium;
letter-spacing: 0px;
color: #333333;
opacity: 1;
}
img.download_right_img {
padding-right: 35px;
height: 200px;
float:right;
}

@media (min-width: 540px) and (max-width:834px) {

.download_container {
margin: 10px 75px;
}
img.download_right_img {
padding-right: 0px;
height: 175px;
float:right;
}
}

@media(min-width: 320px) and (max-width: 539px) {
.download_container {
margin: 10px 20px;
}
.download_inner_container {
background: #FAFAFA;
padding: 15px 15px;
}
.download-left-side {
width: 70%;
position:absolute;
height:125px;
}

img.download_right_img {
padding-right: 0px;
float:right;
height: 120px;
}

.download-left-side h1 {
font-size: 20px;
font-family: JMSansMedium;
letter-spacing: 0px;
color: #333333;
opacity: 1;
}
p.download_text_para {
font-size: 14px;
padding-bottom: 0px;
padding-right: 40px;
}
span.download_list-item {
text-align: left;
letter-spacing: 0px;
color: #1E22AA;
opacity: 1;
font-size: 16px;
font-family: 'JMSansMedium';
}
.download_link-icon {
width: 20px;
height: 22px;
margin-left: 0.5rem;;
margin-top: 0px;
}

a.download_list-link {
position: absolute;
bottom: 0px;
color: #1E22AA;
}
}
</style>