<%@ page import="java.util.HashMap" %>
<%@ page import="app.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core"
      xmlns:h="http://java.sun.com/jsf/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Изменение телефонного номера</title>
</head>
<body>

<%
    HashMap<String, String> jsp_parameters = new HashMap<String, String>();
    Person person = new Person();
    String error_message = "";

    if (request.getAttribute("jsp_parameters") != null) {
        jsp_parameters = (HashMap<String, String>) request.getAttribute("jsp_parameters");
    }

    if (request.getAttribute("person") != null) {
        person = (Person) request.getAttribute("person");
    }

    error_message = jsp_parameters.get("error_message");
%>

<form action="<%=request.getContextPath()%>/" method="post">
    <input type="hidden" name="id" value="<%=person.getId()%>"/>
    <input type="hidden" name="oldPhone" value="<%=jsp_parameters.get("phone")%>"/>
    <table align="center" border="1" width="70%">
        <%
            if ((error_message != null) && (!error_message.equals(""))) {
        %>
        <tr>
            <td colspan="2" align="center"><span style="color:red"><%=error_message%></span></td>
        </tr>
        <%
            }
        %>
        <tr>
            <td colspan="2" align="center">Информация о телефоне
                владельца: <%=person.getSurname() + " " + person.getName() + " " + person.getMiddlename() %>
            </td>
        </tr>
        <tr>
            <td>Телефон:</td>
            <%
                if (jsp_parameters.get("phone").equals("")) {

            %>
            <td><input type="text" name="newPhone" value=""/></td>
            <%
            } else {
            %>
            <td><input type="text" name="newPhone" value="<%=jsp_parameters.get("phone")%>"/></td>
            <%
                }

            %>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <p style="width: 100%; text-align: center"><input type="submit"
                                                                  name="<%=jsp_parameters.get("next_action")%>"
                                                                  value="<%=jsp_parameters.get("next_action_label")%>"/>
                </p>
                <p style="width: 100%; text-align: center"><a
                        href="<%=request.getContextPath() + "/?action=edit&id=" + person.getId()%>">Вернуться</a></p>
            </td>
        </tr>
    </table>
</form>
<
<style type="text/css">
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