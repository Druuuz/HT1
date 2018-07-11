<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="app.Phonebook"%>
<%@ page import="app.Person"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Список людей</title>

</head>
<body>

<%
    // Phonebook phonebook = Phonebook.getInstance();
	String user_message = "";
	HashMap<String,String> jsp_parameters = new HashMap<String,String>();
	Phonebook phonebook = (Phonebook)request.getAttribute("phonebook");
	
	if (request.getAttribute("jsp_parameters") != null)
	{
		jsp_parameters = (HashMap<String,String>)request.getAttribute("jsp_parameters");
	}
	
	user_message = jsp_parameters.get("current_action_result_label");
%>

<table align="center" border="1" width="90%">
    
    <%
    if ((user_message != null)&&(!user_message.equals("")))
    {
    %>
    <tr>
     	<td colspan="6" align="center"><%=user_message%></td>
    </tr>
    <%
    }
    %>
    
    <tr>
        <td colspan="6" align="center"><p><a style="text-align: center" href="<%=request.getContextPath()%>/?action=add">Добавить запись</a></p></td>
    </tr>
    <tr>
        <td class="th" align="center"><b>Фамилия</b></td>
        <td class="th" align="center"><b>Имя</b></td>
        <td class="th" align="center"><b>Отчество</b></td>
        <td class="th" align="center"><b>Телефон(ы)</b></td>
        <td class="th" align="center">&nbsp;</td>
        <td class="th" align="center">&nbsp;</td>
    </tr>
    
        <%
        for (Person person : phonebook.getContents().values()) {
            
        %>
          <tr>
           <td><%=person.getSurname()%></td>
           <td><%=person.getName()%></td>
           <td><%=person.getMiddlename()%></td>
           <td>
            <%
             for(String phone : person.getPhones().values())
              {
            %>
             <%=phone%><br />
            <%
              }
            %>
           </td>
           <td><a href="<%=request.getContextPath()%>/?action=edit&id=<%=person.getId()%>">Редактировать</a></td>
           <td><a href="<%=request.getContextPath()%>/?action=delete&id=<%=person.getId()%>">Удалить</a></td>
          </tr>
        <%
          }
        %>
    
 </table>
<style type="text/css">
    p{
        width: 100%;
        text-align: center;
    }
    table {
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        font-size: 14px;
        border-radius: 10px;
        border-spacing: 0;
        text-align: center;
    }
    .th {
        background: #BCEBDD;
        color: white;
        text-shadow: 0 1px 1px #2D2020;
        padding: 10px 20px;
    }
    .th, td {
        border-style: solid;
        border-width: 0 1px 1px 0;
        border-color: white;
    }
    .th:first-child, td:first-child {
        text-align: left;
    }
    .th:first-child {
        border-top-left-radius: 10px;
    }
    .th:last-child {
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