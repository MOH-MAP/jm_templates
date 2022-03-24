<#--
Web content templates are used to lay out the fields defined in a web
content structure.



Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->
<div class="container">
<div class="jmrich--text--inner my-4">
<div class="p-5 my-4 rich--text--details">
<p class="jmrich-text">${Body.getData()}</p>
</div>
</div>
</div>
<style>
.jmrich--text--inner h5 {
font-size: 26px;
font-family: JMSansMedium;
letter-spacing: 0px;
color: #1E22AA;
opacity: 1;
}
.jmrich--text--inner p{
font-family: JMSansRegular;
font-size: 18px;
line-height: 25px;
letter-spacing: 0px;
color: #333333;
opacity: 1;
padding-bottom: 10px;
}
.jmrich--text--inner p a{
color: #1E22AA;
text-decoration: revert;
}
.jmrich--text--inner ul{
padding-bottom: 10px;
margin-left: 50px;
}
.jmrich--text--inner ul li{
padding: 10px 0px;
font-family: JMSansRegular;
font-size: 18px;
line-height: 25px;
letter-spacing: 0px;
color: #333333;
opacity: 1;
list-style: revert;
}
@media (max-width: 575.98px){
.jmrich--text--inner h5 {
font-size: 22px;
font-family: JMSansMedium;
letter-spacing: 0px;
color: #1E22AA;
opacity: 1;
}
.jmrich--text--inner p{
font-family: JMSansRegular;
font-size: 16px;
line-height: 20px;
letter-spacing: 0px;
color: #333333;
opacity: 1;
padding-bottom: 5px;
}
.jmrich--text--inner p a{
color: #1E22AA;
text-decoration: revert;
}
.jmrich--text--inner ul{
padding-bottom: 5px;
margin-left: 25px;
}
.jmrich--text--inner ul li{
padding: 5px 0px;
font-family: JMSansRegular;
font-size: 16px;
line-height: 20px;
letter-spacing: 0px;
color: #333333;
opacity: 1;

}
</style>