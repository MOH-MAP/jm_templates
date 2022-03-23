<div class="container">
    <h1 class="jmlist-of-links--heading">${Name.getData()}</h1>
    <ul>
    <#if Title.getSiblings()?has_content>
        <#list Title.getSiblings() as cur_Title>
    <li class="jmlist-of-item">${cur_Title.getData()}
            <a class="jmlist-of-link" href="${Title.Links.getFriendlyUrl()}">
                <p class="jmlist-of-text">Explore</p>
                <span class="jmlist-of-icon"></span>
            </a>
        </#list>
    </#if>
    
    </li>
    <ul>
    </div>