<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.FileWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Stored</title>
</head>
<body>
<%
  FileWriter fout = new FileWriter("folder/Data.txt");
  System.out.println("Printing the name parameter: " + request.getParameter("name") + "\n");
  fout.write("Name:	" + request.getParameter("name") + "\n");
  fout.write("Father's Name:	" + request.getParameter("fname") + "\n");
  fout.write("Mother's Name:	" + request.getParameter("mname") + "\n");
  fout.write("Gmail Account:	" + request.getParameter("gname") + "\n");
  fout.write("Password:	" + request.getParameter("pass"));
  fout.close();
%>
</body>
</html>
