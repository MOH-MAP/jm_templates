<%@ include file="././init.jsp" %>

<portlet:actionURL name="mailSender" var="mailSender"></portlet:actionURL>

<liferay-ui:error key="error.mail-service-error" message="Not able to submit mail" />

<c:if test = "${not empty uname}">
    <c:out value = "${uname}"/>
</c:if>

<aui:form name="mailSender" id="mailSender" action="<%= mailSender.toString() %>">
     
       <aui:input type="text" name="Subject" placeholder="${pgName}">
              <aui:validator name="required"/>
               <aui:validator errorMessage="Only Alphanumeric and Special Characters are allowed." name="custom">
                function(val, fieldNode, ruleValue) {
                        var regex = new RegExp(/^[ A-Za-z0-9_@./#&+-]*$/);

                        return regex.test(val);
                }
        	  </aui:validator>
       </aui:input>

       <aui:input type="textarea" name="Description" placeholder="Description">
              <aui:validator name="required"/>
              <aui:validator errorMessage="Only Alphanumeric and Special Characters are allowed." name="custom">
                function(val, fieldNode, ruleValue) {
                        var regex = new RegExp(/^[ A-Za-z0-9_@./#&+-]*$/);

                        return regex.test(val);
                }
        	  </aui:validator>
       </aui:input>
       
       <aui:input type="text" name="Name" placeholder="Your Name">
             <aui:validator name="required"/>
             <aui:validator errorMessage="Only Alphanumeric and Special Characters are allowed." name="custom">
                function(val, fieldNode, ruleValue) {
                        var regex = new RegExp(/^[ A-Za-z_@./#&+-]*$/);

                        return regex.test(val);
                }
        	  </aui:validator>
       </aui:input>
      
       <aui:select name="region" label="Your Region">
    		<aui:option value="Asia">Asia</aui:option>
    		<aui:option value="Africa">Africa</aui:option>
    		<aui:option value="Australia">Australia</aui:option>
    		<aui:option value="Latin America">Latin America</aui:option>
    		<aui:option value="Middle East">Middle East</aui:option>
    		<aui:option value="North America">North America</aui:option>
		</aui:select>
		
		<aui:input type="text" name="Orgnization" placeholder="Your Orgnization Name">
              <aui:validator name="required"/>
              <aui:validator name="alphanum" />
       </aui:input>
      
        <aui:input type="text" name="emailAddress" placeholder="Your Email Address">
              <aui:validator name="email" />
              <aui:validator name="required"/>
       	</aui:input>
       	
       	<aui:input type="text" name="contactInfo" placeholder="Your Mobile Address">
              <aui:validator name="digits"></aui:validator>
              <aui:validator name="minLength">8</aui:validator>
              <aui:validator name="maxLength">10</aui:validator>
       	</aui:input>
      
       <aui:button type="submit" name="" value="Submit" />
</aui:form>


<script>
$( document ).ready(function() {
		$('#p_jm_get_in_touch_portlet_GetInTouchPortlet + .portlet-body .form-control').on('focus', function(){
			$(this).parents('.form-group').addClass('jminput--focus');
		});

		$('#p_jm_get_in_touch_portlet_GetInTouchPortlet + .portlet-body .form-control').on('blur', function(){
			$(this).parents('.form-group').removeClass('jminput--focus');
			if (!$(this).parents('.form-group').hasClass('has-error') && $(this).val()) {
				$(this).parents('.form-group').addClass('jminput--complete');
			} else {
				$(this).parents('.form-group').removeClass('jminput--complete');
			}
		});
		
		$('#p_jm_get_in_touch_portlet_GetInTouchPortlet + .portlet-body label').on('click', function(){
			$(this).parent('.form-group').find('.form-control').focus();
		});

		$('#p_jm_get_in_touch_portlet_GetInTouchPortlet + .portlet-body label').on('focus', function(){
			$(this).parent('.form-group').find('.form-control').focus();
		});

		$('#p_jm_get_in_touch_portlet_GetInTouchPortlet + .portlet-body .form-group input-select-wrapper').addClass('jminput--complete');
	});

</script>