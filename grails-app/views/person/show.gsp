<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>ResuME Application</title>
</head>
<body>
  <div class="body">

    <g:if test="${flash.message}">
      <div class="message clear">${flash.message}</div>
    </g:if>
    
    <div id="leftnav">
        <ul>
          <li id="indCI" style="background-color:#94db5e;"><a href="" onclick="javascript:return toggleDiv('indCI','contactInfo');">Contact Info</a></li>
          <li id="indSk"><a href="" onclick="javascript:return toggleDiv('indSk', 'skills');">Skills </a></li>
          <li id="indXp"><a href="" onclick="javascript:return toggleDiv('indXp', 'experience');">Experience </a></li>
          <li id="indEd"><a href="" onclick="javascript:return toggleDiv('indEd', 'education');">Education </a></li>
          <li id="indRef"><a href="" onclick="javascript:return toggleDiv('indRef', 'references');">References</a></li>
          <li id="indCert"><a href="" onclick="javascript:return toggleDiv('indCert', 'certifications');">Certifications</a></li>
          <li id="indPub"><a href="" onclick="javascript:return toggleDiv('indPub', 'publications');">Publications</a></li>
          <li id="indLic"><a href="" onclick="javascript:return toggleDiv('indLic', 'licenses');">Licenses</a></li>
          <li id="indMem"><a href="" onclick="javascript:return toggleDiv('indMem', 'memberships');">Memberships</a></li>
          <li id="indAwd"><a href="" onclick="javascript:return toggleDiv('indAwd', 'awards');">Awards</a></li>
          <li id="indPat"><a href="" onclick="javascript:return toggleDiv('indPat', 'patents');">Patents</a></li>
          <li id="indInv"><a href="" onclick="javascript:return toggleDiv('indInv', 'involvement');">Community Involvement</a></li>
          <li id="indInt"><a href="" onclick="javascript:return toggleDiv('indInt', 'interests');">Interests/Sites</a></li>
       </ul>
    </div>

    <div class="dialog flL">
        <div id="contactInfo" class="section">
          <h3>Contact Information</h3>
          <div class="expsm">
            <span class="expsm-lt">
              <table><tbody>
                <tr><td ><label>Full Name:</label></td><td>${person.fullName}</td></tr>
                <tr><td><label>Email:</label></td><td> ${fieldValue(bean:person, field:'email')}</td></tr>
                <tr><td ><label>Phone Number:</label></td><td> ${fieldValue(bean:person, field:'phoneNumber')}</td></tr>
                </tbody>
              </table>
            </span>
              <span class="expsm-rt"  style="vertical-align:bottom;">
                 <g:link id="${person.id}" action="edit" controller="person"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
              </span>
            <div class="clear"></div>
          </div>
        </div>
  

          <a name="skillsa"></a>
          <div id="skills" class="section" style="display:none;">
            <h3>Skills</h3>
            <div  class="buttons">
              <g:link class="edit" action="editSkills" id="${person.id}">Skills</g:link><br/>
            </div>
            <div style="height:200px;">
              <ul style="list-style:none;">
                <g:each var="s" in="${skills}">
                  <li style="padding-bottom:5px;"><b>${s.name}</b> - ${s.description}</li>
                </g:each>
              </ul>
            </div>
          </div>


          <!-- Experience Section  -->
          <a name="experiencea"></a>
          <div id="experience" class="section" style="display:none;">
            <h3>Experience</h3>
            <div class="buttons">
              <g:link controller="experience" action="create" params="['person.id':person.id]">Add Experience</g:link>
            </div>

            <g:each in="${experiences}" status="i" var="experience">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="experience" action="edit"
                          id="${experience.id}">${fieldValue(bean:experience, field:'companyName')}
                  </g:link>

                  <p>${fieldValue(bean:experience, field:'titleLine')}</p>

                  <a href="" class="decN" id="details_${experience.id}" title="Show/Hide Details"
                     onclick="Effect.toggle('detail_${experience.id}','appear');invertTriangle($('details_${experience.id}'));return false;">&#x25B6;</a>

                </span>
                <span class="expsm-rt">
                  <g:link controller="experience" action="edit" id="${experience.id}" class="decN"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
                  <g:link controller="experience" action="delete" id="${experience.id}" class="decN"><img src="../images/delete-16.png" alt="delete" class="icon"/></g:link>
                </span>
                <span class="expsm-rt">
                  ${fieldValue(bean:experience, field:'formattedStartDate')}
                                    &nbsp; - &nbsp;
                  ${fieldValue(bean:experience, field:'formattedCompletionDate')}
                </span>
                
                <div class="clear"></div>
                <div id="detail_${experience.id}" class="expdet" style="display:none;">
                    <p>${fieldValue(bean:experience, field:'summary')}</p>
                    <ul>
                      <g:each in="${experience?.highlights}" var="highlight">
                        <li> ${highlight?.text}   </li>
                      </g:each>
                    </ul>

                </div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>

          </div>

          <!-- Education Tab  -->
          <a name="educationa"></a>
          <div id="education" class="section" style="display:none;">
            <h3>Education</h3>
            <div class="buttons">
              <g:link controller="education" action="create" params="['person.id':person.id]">Add Education</g:link>
            </div>
              <g:each in="${education}" status="i" var="education">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="education" action="edit"
                          id="${education?.id}">${education?.organization}
                  </g:link>
                </span>
                <span class="expsm-rt">
                  <g:formatDate format="MMM yyyy" date="${education?.completed}"/>
                </span>
                <span class="expsm-rt"  style="vertical-align:bottom;"></span>
                <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="education" action="edit" id="${education.id}"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
                </span>
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>
        </div>

        <a name="referencesa"></a>
        <div id="references" class="section dim" style="display:none;">
          <h3>References</h3>
          <p>Coming Soon...</p>
        </div>

         <!-- Certifications Section  -->
         <a name="certificationsa"></a>
          <div id="certifications" class="section" style="display:none;">
            <h3>Certifications</h3>
            <div class="buttons">
              <g:link controller="certification" action="create" params="['personId':person.id]">Add Certification</g:link>
            </div>

            <g:each in="${certs}" status="i" var="cert">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="certification" action="edit"
                          id="${cert.id}">${cert.name}
                  </g:link>

                </span>
                <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="certification" action="edit" id="${cert.id}"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
                  <g:link controller="certification" action="delete" id="${cert.id}"><img src="../images/delete-16.png" alt="delete" class="icon"/></g:link>
                </span>
                <span class="expsm-rt">
                  <g:formatDate format="MMM yyyy" date="${cert.certDate}"/>
                </span>
                
                
               
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>
          </div>

         <!-- Publications Section  -->
         <a name="publicationsa"></a>
          <div id="publications" class="section dim" style="display:none;">
            <h3>Publications</h3>
            <div>
              Coming Soon...
              <!-- <g:link controller="publication" action="create" params="['personId':person.id]">Add Publication</g:link> -->
            </div>
          </div>

          <!-- licenses Section  -->
          <a name="licensesa"></a>
          <div id="licenses" class="section" style="display:none;">
            <h3>Licenses</h3>
            <div class="buttons">
              <g:link controller="license" action="create" params="['personId':person.id]">Add License</g:link>
            </div>
            <g:each in="${licenses}" status="i" var="lic">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="license" action="edit"
                          id="${lic.id}">${lic.licenseName}
                  </g:link>

                </span>
                 <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="license" action="edit" id="${lic.id}"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
                  <g:link controller="license" action="delete" id="${lic.id}"><img src="../images/delete-16.png" alt="delete" class="icon"/></g:link>
                </span>
                <span class="expsm-rt">
                  <g:formatDate format="MMM yyyy" date="${lic.licensingDate}"/>
                </span>
                               
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>
          </div>

          <!-- Membership Section  -->
          <a name="membershipsa"></a>
          <div id="memberships" class="section" style="display:none;">
            <h3>Memberships</h3>
            <div class="buttons">
              <g:link controller="membership" action="create" params="['personId':person.id]">Add Membership</g:link>
            </div>
            <g:each in="${person?.memberships}" status="i" var="memb">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="membership" action="edit"
                          id="${memb.id}">${memb.organization}
                  </g:link>

                </span>
                <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="membership" action="edit" id="${memb.id}"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
                  <g:link controller="membership" action="delete" id="${memb.id}"><img src="../images/delete-16.png" alt="delete" class="icon"/></g:link>
                </span>
                <span class="expsm-rt">
                  <g:formatDate format="MMM yyyy" date="${memb.memberSince}"/>
                </span>
                
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>
          </div>

           <!-- Award Section  -->
           <a name="awardsa"></a>
          <div id="awards" class="section" style="display:none;">
            <h3>Awards</h3>
            <div class="buttons">
              <g:link controller="award" action="create" params="['personId':person.id]">Add Award</g:link>
            </div>
             <g:each in="${person?.awards}" status="i" var="award">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="award" action="edit"
                          id="${award.id}">
                    <g:if test="${award.nominatedOnly == true}">
                        Nominated for
                    </g:if>
                    <p>${award.awardName}</p> <p> ${award.awardingOrganization} </p>
                  </g:link>
                </span>
                <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="award" action="edit" id="${award.id}"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
                  <g:link controller="award" action="delete" id="${award.id}"><img src="../images/delete-16.png" alt="delete" class="icon"/></g:link>
                </span>
                <span class="expsm-rt">
                  <g:formatDate format="MMM yyyy" date="${award.dateAwarded}"/>
                </span>
                
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>
          </div>

            <!-- patent Section  -->
            <a name="patentsa"></a>
          <div id="patents" class="section" style="display:none;">
            <h3>Patents</h3>
            <div class="buttons">
              <g:link controller="patent" action="create" params="['personId':person.id]">Add Patent</g:link>
            </div>
            <g:each in="${person?.patents}" status="i" var="pat">
              <div class="expsm">
                <span class="expsm-lt">
                  <g:link controller="patent" action="edit"
                          id="${pat.id}">${pat.title} - ${pat.number}
                          <g:if test ="${pat.pending}"> (pending)</g:if>
                  </g:link>

                </span>
                <span class="expsm-rt"  style="vertical-align:bottom;">
                  <g:link controller="patent" action="edit" id="${pat.id}"><img src="../images/edit-16.png" alt="edit" class="icon"/></g:link>
                  <g:link controller="patent" action="delete" id="${pat.id}"><img src="../images/delete-16.png" alt="delete" class="icon"/></g:link>
                </span>
                <span class="expsm-rt">
                  <g:formatDate format="MMM yyyy" date="${pat.dateAwarded}"/>
                </span>
                
                <div class="clear"></div>
              </div>  <!-- closes div class="expsm"  -->
            </g:each>
            <div class="clear"></div>
          </div>

            <!-- involvement Section  -->
            <a name="involvementa"></a>
          <div id="involvement" class="section dim" style="display:none;">
            <h3>Community Involvement</h3>
            <p>
              Coming Soon...
            </p>
          </div>

           <!-- interest Section  -->
           <a name="interestsa"></a>
          <div id="interests" class="section dim" style="display:none;">
            <h3>Interests</h3>
            <p>
              Coming Soon...
            </p>
          </div>

      </div>
    </div>

    <script type="text/javascript">
      function invertTriangle(elm) {
      if (elm.innerHTML == "\u25B6")
      elm.innerHTML = "&#x25BC"
      else
      elm.innerHTML = "&#x25B6"
      }

      function toggleOverviewDetails() {
        Effect.toggle('overview_details','appear')
        invertTriangle($('overview_detail_link'))
        return false
      }

      function toggleQualsLink() {
        Effect.toggle('quals','appear')
        invertTriangle($('quals_header'))
        return false
      }

      function a() {}

      var activeSection

      // this was just to get something to show quickly, real implementation
      // should probably just change CSS class instead.
      var normal = "#fff"
      var highlighted = "#94db5e"

      function toggleDiv(theLink, theDiv) {
        if (typeof activeSection == "undefined"){
          activeSection = getSection("indCI", "contactInfo")
        }
        Effect.Fade(activeSection.dv, { queue: 'end', duration:0.15 })
        activeSection.li.style.backgroundColor = normal;
        activeSection.active = false;

        Effect.Appear(theDiv, { queue: 'end', duration:0.2 })
        activeSection = getSection(theLink, theDiv);
        activeSection.li.style.backgroundColor = highlighted;
        return false
      }

      function getSection(theLink, theDiv) {
          var section = new Object();
          section.name = theDiv;
          section.dv = document.getElementById(section.name);
          section.linkName = theLink;
          section.li = document.getElementById(section.linkName);
          return section;
      }

      
    </script>
</body>
</html>
