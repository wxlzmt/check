<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<%
	String method = request.getMethod();
	if (method.equalsIgnoreCase("POST")) { // post方式请求
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	String ctx = request.getContextPath();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	String now = sdf.format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" >
<title>测试页</title>
<!-- pageid="b1978406705d4c11b876e097b623de94" -->
<style type="text/css" >
*{
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.clearfix:after{visibility:hidden;display:block;font-size:0;content: " ";clear:both;height:0;}   
.clearfix{*zoom:1;}
@media screen and (min-width: 768px) {
	.container {
	    width: 750px;
	}
}
@media screen and (min-width: 992px) {
	.container {
	    width: 970px;
	}
}
@media screen and (min-width: 1200px) {
	.container {
	    width: 1170px;
	}
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
.table-bordered {
    border: 1px solid #ddd;
}
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
}
table {
    background-color: transparent;
}
table {
    border-spacing: 0;
    border-collapse: collapse;
}
.table-hover>tbody>tr:hover {
    background-color: #f5f5f5;
}
.h3, h3 {
    font-size: 24px;
}

.h1, .h2, .h3, h1, h2, h3 {
    margin-top: 20px;
    margin-bottom: 10px;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: inherit;
    font-weight: 500;
    line-height: 1.1;
    color: inherit;
}
.h4, h4 {
    font-size: 18px;
}

.h4, .h5, .h6, h4, h5, h6 {
    margin-top: 10px;
    margin-bottom: 10px;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: inherit;
    font-weight: 500;
    line-height: 1.1;
    color: inherit;
}
hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
}

hr {
    height: 0;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
}
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
    border: 1px solid #ddd;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
}

</style>
</head>

<body>
<div class="container clearfix">
<h3>HTTP请求时间 : <%=now %></h3>
<%
	List<String> requestParameterNameList = new ArrayList<String>();
	Enumeration<String> e = request.getParameterNames();
	while(e.hasMoreElements()){
		requestParameterNameList.add(e.nextElement());
	}
	Collections.sort(requestParameterNameList);
%>
<!-- request parameter 相关 ↓↓↓↓↓↓ -->
<%if(requestParameterNameList.size()>0){ %>
<hr/>
<h4>parameters</h4>
<table class="table table-bordered table-hover">
	<tr><th>键</th><th>值</th></tr>
<% for(int i=0;i<requestParameterNameList.size();i++){ 
		String key = requestParameterNameList.get(i);
		String [] values = request.getParameterValues(key);
%>
	<%if(values==null || values.length<2){ %>
	<tr><td><%=key %></td><td><%=request.getParameter(key) %></td></tr>
	<%}else{ %>
		<% for(int j=0;j<values.length;j++){ %>
	<tr><td><%=key %></td><td><%=values[i] %></td></tr>
		<% } %>
	<% } %>
<% } %>
</table>
<%} %>
<!-- request parameter 相关↑↑↑↑↑↑ -->
<%
	List<String> headerNameList = new ArrayList<String>();
	Enumeration<String> eh = request.getHeaderNames();
	while(eh.hasMoreElements()){
		headerNameList.add(eh.nextElement());
	}
	Collections.sort(headerNameList);
%>
<!-- request headers 相关 ↓↓↓↓↓↓ -->
<%if(headerNameList.size()>0){ %>
<hr/>
<h4>headers</h4>
<table class="table table-bordered table-hover">
	<tr><th>键</th><th>值</th></tr>
<% for(int i=0;i<headerNameList.size();i++){ 
		String key = headerNameList.get(i);
		String val = request.getHeader(key);
%>
	<tr><td><%=key %></td><td><%=val %></td></tr>
<% } %>
</table>
<%} %>
<!-- request headers 相关↑↑↑↑↑↑ -->
<hr/>
<h4>request</h4>
<table class="table table-bordered table-hover">
	<tr><th>键</th><th>值</th></tr>
	<tr><td>characterEncoding</td><td><%=request.getCharacterEncoding() %></td></tr>
	<tr><td>requestURI</td><td><%=request.getRequestURI() %></td></tr>
	<tr><td>requestURL</td><td><%=request.getRequestURL().toString() %></td></tr>
	<tr><td>queryString</td><td><%=request.getQueryString() %></td></tr>
	<tr><td>requestedSessionId</td><td><%=request.getRequestedSessionId() %></td></tr>
	<tr><td>method</td><td><%=request.getMethod() %></td></tr>
	<tr><td>scheme</td><td><%=request.getScheme() %></td></tr>
	<tr><td>serverName</td><td><%=request.getServerName() %></td></tr>
	<tr><td>serverPort</td><td><%=request.getServerPort() %></td></tr>
	<tr><td>servletPath</td><td><%=request.getServletPath() %></td></tr>
	<tr><td>contentLength</td><td><%=request.getContentLength() %></td></tr>
	<tr><td>contentType</td><td><%=request.getContentType() %></td></tr>
	<tr><td>contextPath</td><td><%=request.getContextPath() %></td></tr>
	<tr><td>localAddr</td><td><%=request.getLocalAddr() %></td></tr>
	<tr><td>localName</td><td><%=request.getLocalName() %></td></tr>
	<tr><td>localPort</td><td><%=request.getLocalPort() %></td></tr>
	<tr><td>locale</td><td><%=request.getLocale().toString() %></td></tr>
	<tr><td>pathInfo</td><td><%=request.getPathInfo() %></td></tr>
	<tr><td>pathTranslated</td><td><%=request.getPathTranslated() %></td></tr>
	<tr><td>protocol</td><td><%=request.getProtocol() %></td></tr>
	<tr><td>remoteAddr</td><td><%=request.getRemoteAddr() %></td></tr>
	<tr><td>remoteHost</td><td><%=request.getRemoteHost() %></td></tr>
	<tr><td>remotePort</td><td><%=request.getRemotePort() %></td></tr>
	<tr><td>remoteUser</td><td><%=request.getRemoteUser() %></td></tr>
	<tr><td>authType</td><td><%=request.getAuthType() %></td></tr>
	<tr><td>isRequestedSessionIdFromCookie</td><td><%=request.isRequestedSessionIdFromCookie() %></td></tr>
	<tr><td>isRequestedSessionIdFromURL</td><td><%=request.isRequestedSessionIdFromURL() %></td></tr>
	<tr><td>isRequestedSessionIdValid</td><td><%=request.isRequestedSessionIdValid() %></td></tr>
	<tr><td>isSecure</td><td><%=request.isSecure() %></td></tr>
	<tr><td>toString</td><td><%=request.toString() %></td></tr>
</table>
</div>
</body>
</html>

