<#assign namespace = randomNamespace />

<div class="event__container event--templ" id="event-${namespace}">
    <div class="row">
        <div class="col-md-12">
            <div class="event__card mb-3">
                <div class="row event__row">
                    <div class="col-md-6 event__align-left">
                        <#assign Date_Data=getterUtil.getString(Date.getData())>
                        <#if validator.isNotNull(Date_Data)>
                            <#assign Date_DateObj=dateUtil.parseDate("yyyy-MM-dd", Date_Data, locale)>
                                ${dateUtil.getDate(Date_DateObj, "dd MMM yyyy", locale)}
                        </#if>
                    </div>
                    <div class="col-md-6 event__align-right">
                    <button
                    class="addToCal open" data-ace='{"title":"Event 2","desc":"Event 2 description","location":"Location of Event 2","time":{"start":"March 27, 2016 12:00:00", "end":"March 27, 2016 14:00:00", "zone":"+05:30"}, "organizer":{"name":"Lord Abbett", "email": "email@gmail.com"}}'><span>Add To Calendar</span></button>
                        <div class="addToCalOptions">
                            <a href="#" data-type="ics">Outlook Calendar</a>
                            <a href="#" data-type="google">Google Calendar</a>
                            <a href="#" data-type="apple">Apple Calendar</a>
                            
                        </div>
                        
                    </div>
                </div>
                <div class="event__card-body">
                    <h2 class="event__card-heading">${Title.getData()}</h2>
                    <#if (PreTitle.getData())??>
                        <h5 class="event__card-title">${PreTitle.getData()}</h5>
                    </#if>
                    <h6 class="event__card-location">${Location.getData()}</h6>
                    <p class="event__card-text">${Body.getData()}</p>

                    <#assign linkHref = "#" />
    				<#assign linkTitle = "Read More" />
                    <#assign linkTarget = "" />
    				<#if EventUrl_Title?? && EventUrl_Title.getData()?has_content>
    					<#assign linkTitle = EventUrl_Title.getData()/>
    				</#if>
    
    				<#if EventUrl_Title.EventURL_Internal?? && EventUrl_Title.EventURL_Internal.getFriendlyUrl()?has_content>
    					<#assign linkHref = EventUrl_Title.EventURL_Internal.getFriendlyUrl() />
    				<#elseif EventUrl_Title.EventURL_Media?? && EventUrl_Title.EventURL_Media.getData()?has_content>
    					<#assign linkHref = EventUrl_Title.EventURL_Media.getData() />
    				<#elseif EventUrl_Title.EventURL_Mailto?? && EventUrl_Title.EventURL_Mailto.getData()?has_content>
    					<#assign linkHref = "mailto:" + EventUrl_Title.EventURL_Mailto.getData() />
    				<#elseif EventUrl_Title.EventURL_External?? && EventUrl_Title.EventURL_External.getData()?has_content>
    					<#assign linkHref = EventUrl_Title.EventURL_External.getData() />
    				</#if>
    
    				<#if linkHref?has_content>
    					<#if EventUrl_Title.EventURL_Target??>
    				        <#assign linkTarget = EventUrl_Title.EventURL_Target.getData()>
    				    </#if>
                        <a class="event__list-link" href="${linkHref}" target="${linkTarget}">
                            <span class="event__link-text">${linkTitle}</span>
                            <span class="event__link-icon"></span>
                        </a>
    				</#if>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$( ".addToCal" ).on( "click", function(){
    $( this ).toggleClass( "open" );
} );

$( ".addToCalOptions a" ).on( "click", function(){
    var $this = $( this ),
        data = $this.closest( ".container" ).find( "button" ).data( "ace" ),
        type = $this.data( "type" ),
        url = "";
    // console.log( data );
    console.log( type );
    switch( type ){
        case "google":
            url = getUrl_google( data );
            break;
        case "apple":
            url = getUrl_yahoo( data );
            break;
        case "ics":
            // Logic to download ics file.
            break;
        default:
            break;
    }
    console.log( url );
    window.open( url, '_blank' );
} );


function getUrl_google( data ) {
    var url = 'https://www.google.com/calendar/event?action=TEMPLATE';
    url += '&text=' + encodeURIComponent(data.title);
    url += '&details=' + encodeURIComponent(data.desc);
    url += '&location=' + encodeURIComponent(data.location);
    url += '&dates=' + encodeURIComponent(_getUTCTime(data.time.start, data.time.zone) + '/' + _getUTCTime(data.time.end, data.time.zone));  // time needs to be sent as UTC and let Google handle converting to local
    url += '&sprop=website:' + encodeURIComponent(data.url);
    url += '&sprop=name:' + encodeURIComponent(data.organizer.name);
    return url;
}
function getUrl_yahoo( data ) {
    var url = 'http://calendar.yahoo.com?v=60';
    url += '&TITLE=' + encodeURIComponent(data.title);
    url += '&DESC=' + encodeURIComponent(data.desc);
    url += '&URL=' + encodeURIComponent(data.url);
    url += '&in_loc=' + encodeURIComponent(data.location);
    url += '&ST=' + _getUTCTime(data.time.start, data.time.zone);
    url += '&DUR=' + _getDateDiff(data.time.start, data.time.end);
    return url;
}
function getUrl_hotmail( data ) {
    var url = 'https://bay02.calendar.live.com/calendar/calendar.aspx?rru=addevent';
    url += '&dtstart=' + _getUTCTime(data.time.start, data.time.zone);
    url += '&dtend=' + _getUTCTime(data.time.end, data.time.zone);
    url += '&summary=' + encodeURIComponent(data.title);
    url += '&location=' + encodeURIComponent(data.location);
    url += '&description=' + encodeURIComponent(data.desc);
    url += '&allday=' + "false";
    url += '&uid=' + "";
    return url;
}

function _getUTCTime( dateObj, zone ) {
    var newDateObj = _adjustToUTC(dateObj, zone);
    return _getDatePart(newDateObj.getFullYear(),4) + _getDatePart(newDateObj.getMonth()+1,2) + _getDatePart(newDateObj.getDate(),2) + 'T' + _getDatePart(newDateObj.getHours(),2) + _getDatePart(newDateObj.getMinutes(),2) + _getDatePart(newDateObj.getSeconds(),2) + 'Z';
}

function _getDatePart(part, digits){
    part = part.toString();
    while(part.length < digits) {
        part = '0' + part;
    }
    return part;
}

function _adjustToUTC(dateObj, zone){
    var dateOut = new Date(dateObj),
    hours, mins;

    if(isNaN(dateOut.getTime())) {
        return new Date();
    }

    // adjust to UTC
    hours = zone.substring(1,3);
    mins = zone.substring(4,6);
    if(zone.substring(0,1) === '-') {
        dateOut.setHours(dateOut.getHours() + (hours-0));
        dateOut.setMinutes(dateOut.getMinutes() + (mins-0));
    } else {
        dateOut.setHours(dateOut.getHours() - hours);
        dateOut.setMinutes(dateOut.getMinutes() - mins);
    }
    return dateOut;
}

function _getDateDiff(startDate, endDate) {
    var diff = Math.floor((endDate - startDate)/60000),
    hours = Math.floor(diff/60),
    mins = diff - (hours * 60);
    return this._getDatePart(hours,2) + this._getDatePart(mins,2);
}
</script>