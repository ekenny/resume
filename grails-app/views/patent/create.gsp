
<%@ page import="resume.Patent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Patent</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Patent List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Patent</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${patentInstance}">
            <div class="errors">
                <g:renderErrors bean="${patentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="number">Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'number','errors')}">
                                    <input type="text" id="number" name="number" value="${fieldValue(bean:patentInstance,field:'number')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:patentInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAwarded">Date Awarded:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'dateAwarded','errors')}">
                                    <g:datePicker name="dateAwarded" value="${patentInstance?.dateAwarded}" precision="minute" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shortDescription">Short Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'shortDescription','errors')}">
                                    <input type="text" id="shortDescription" name="shortDescription" value="${fieldValue(bean:patentInstance,field:'shortDescription')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="idustryField">Idustry Field:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'idustryField','errors')}">
                                    <input type="text" id="idustryField" name="idustryField" value="${fieldValue(bean:patentInstance,field:'idustryField')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="patentHolders">Patent Holders:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'patentHolders','errors')}">
                                    <input type="text" id="patentHolders" name="patentHolders" value="${fieldValue(bean:patentInstance,field:'patentHolders')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pending">Pending:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'pending','errors')}">
                                    <g:checkBox name="pending" value="${patentInstance?.pending}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${resume.Person.list()}" name="person.id" value="${patentInstance?.person?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>