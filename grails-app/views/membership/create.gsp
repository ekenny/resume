
<%@ page import="resume.Membership" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Membership</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Membership List</g:link></span>
        </div>
        <div class="body">
            <h2>Membership</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${membershipInstance}">
            <div class="errors">
                <g:renderErrors bean="${membershipInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <g:hiddenField name="person.id" value="${personId}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organization">Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:membershipInstance,field:'organization','errors')}">
                                    <input type="text" id="organization" name="organization" value="${fieldValue(bean:membershipInstance,field:'organization')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="memberSince">Member Since:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:membershipInstance,field:'memberSince','errors')}">
                                    <g:datePicker name="memberSince" value="${membershipInstance?.memberSince}" precision="minute" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr>                         
                            
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Save" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>