<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="app.Person"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Управление данными о человеке</title>
</head>
<body>

<%
	HashMap<String,String> jsp_parameters = new HashMap<String,String>();
	Person person = new Person();
	String error_message = "";
	String user_message = "";

	if (request.getAttribute("jsp_parameters") != null)
	{
		jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
	}

	if (request.getAttribute("person") != null)
	{
		person=(Person)request.getAttribute("person");
	}
	
	error_message = jsp_parameters.get("error_message");
	user_message = jsp_parameters.get("current_action_result_label");
%>

<form action="<%=request.getContextPath()%>/" method="post">
<input type="hidden" name="id" value="<%=person.getId()%>"/>
<table align="center" border="1" width="70%">
    <%
    if ((error_message != null)&&(!error_message.equals("")))
    {
    %>
    <tr>
     	<td colspan="2" align="center"><span style="color:red"><%=error_message%></span></td>
    </tr>
    <%
    }
    %>
    <%
        if ((user_message != null)&&(!user_message.equals("")))
        {
    %>
    <tr>
        <td colspan="2" align="center"><span style="color:black"><%=user_message%></span></td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="2" align="center">Информация о человеке</td>
    </tr>
    <tr>
        <td>Фамилия:</td>
        <td><input type="text" name="surname" value="<%=person.getSurname()%>"/></td>
    </tr>
    <tr>
        <td>Имя:</td>
		<td><input type="text" name="name" value="<%=person.getName()%>"/></td>        
    </tr>
    <tr>
        <td>Отчество:</td>
        <td><input type="text" name="middlename" value="<%=person.getMiddlename()%>"/></td>
    </tr>
    <tr>
        <%
            if (jsp_parameters.get("current_action").equals("edit")){
        %>
        <td>Телефоны:</td>
        <td>
         <div><%
          for(String phone : person.getPhones().values())
           { %>
             <%
                 String urlPhone = phone.replace("#","hash");
                 urlPhone = urlPhone.replace("+","plus");
             %>
             <ul>
                 <li style="width: 20%"><p><%=phone%></p></li>
                 <li><p><a href="<%=request.getContextPath() + "/?action=change&id=" + person.getId() + "&phone=" + urlPhone + "&person"%>" >Редактировать</a></p></li>
                 <li><p><a href="<%=request.getContextPath() + "/?action=deletePhone&id=" + person.getId() + "&phone=" + urlPhone %>" >Удалить</a></p></li>
             </ul>




           <%}

         %><a href="<%=request.getContextPath() + "/?action=addPhone&id=" + person.getId()%>" >Добавить</a></div>
        </td>
        <%
            }
        %>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <p style="width: 100%; text-align: center"><a href="<%=request.getContextPath()%>/" >Вернуться к списку</a></p>
            <p style="width: 100%; text-align: center"><input type="submit" name="<%=jsp_parameters.get("next_action")%>" value="<%=jsp_parameters.get("next_action_label")%>" /></p>
        </td>
    </tr> 
 </table>
 </form>
<
<style type="text/css">
    ul{
        width: 100%;
        overflow: hidden;
        list-style: none;
    }
    ul li{
        float:left;
        margin-right: 5px;
    }
    ul li:first-child{
        margin-right: 15px;
    }
    table {
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        font-size: 14px;
        border-radius: 10px;
        border-spacing: 0;
        text-align: center;
    }
    th {
        background: #BCEBDD;
        color: white;
        text-shadow: 0 1px 1px #2D2020;
        padding: 10px 20px;
    }
    th, td {
        border-style: solid;
        border-width: 0 1px 1px 0;
        border-color: white;
    }
    th:first-child, td:first-child {
        text-align: left;
    }
    th:first-child {
        border-top-left-radius: 10px;
    }
    th:last-child {
        border-top-right-radius: 10px;
        border-right: none;
    }
    td {
        padding: 10px 20px;
        background: #F8E391;
    }
    tr:last-child td:first-child {
        border-radius: 0 0 0 10px;
    }
    tr:last-child td:last-child {
        border-radius: 0 0 10px 0;
    }
    tr td:last-child {
        border-right: none;
    }
</style>
</body>
</html>