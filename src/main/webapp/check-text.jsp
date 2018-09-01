<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Date,java.util.ArrayList,java.util.List,java.util.Enumeration,java.util.Collections,java.io.PrintWriter" %>
<%  //准备工作
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
	response.setHeader("Content-Type","text/plain; charset=utf-8");
	response.setCharacterEncoding("UTF-8");
	PrintWriter pw = response.getWriter();
	StringBuilder sb = new StringBuilder();
	String sepLine = "\n---------------------\n";
	sb.append("Date Now : ").append(now);
	sb.append(sepLine);
%>
<%  //请求参数
	List<String> requestParameterNameList = new ArrayList<String>();
	Enumeration<String> e = request.getParameterNames();
	while(e.hasMoreElements()){
		requestParameterNameList.add(e.nextElement());
	}
	Collections.sort(requestParameterNameList);
	if(requestParameterNameList.size()>0){
		sb.append("Request Parameters:\n");
		for(int i=0;i<requestParameterNameList.size();i++){ 
			String key = requestParameterNameList.get(i);
			String [] values = request.getParameterValues(key);
			if(values==null || values.length<2){
				sb.append(key).append("=").append(request.getParameter(key)).append("\n");
			}else{
				for(int j=0;j<values.length;j++){
					sb.append(key).append("=").append(values[j]).append("\n");
				}
			}
		}
		sb.append(sepLine);
	}
%>
<%  //headers
	List<String> headerNameList = new ArrayList<String>();
	Enumeration<String> eh = request.getHeaderNames();
	while(eh.hasMoreElements()){
		headerNameList.add(eh.nextElement());
	}
	Collections.sort(headerNameList);
	if(headerNameList.size()>0){
		sb.append("Request Headers:\n");
		for(int i=0;i<headerNameList.size();i++){ 
			String key = headerNameList.get(i);
			String val = request.getHeader(key);
			sb.append(key).append(": ").append(val).append("\n");
		}
		sb.append(sepLine);
	}
%>
<%  //打印其它参数
	sb.append("Other Information:\n");
	sb.append("characterEncoding=").append(request.getCharacterEncoding()).append("\n");
	sb.append("requestURI=").append(request.getRequestURI()).append("\n");
	sb.append("requestURL=").append(request.getRequestURL().toString()).append("\n");
	sb.append("queryString=").append(request.getQueryString()).append("\n");
	sb.append("requestedSessionId=").append(request.getRequestedSessionId()).append("\n");
	sb.append("method=").append(request.getMethod()).append("\n");
	sb.append("scheme=").append(request.getScheme()).append("\n");
	sb.append("serverName=").append(request.getServerName()).append("\n");
	sb.append("serverPort=").append(request.getServerPort()).append("\n");
	sb.append("servletPath=").append(request.getServletPath()).append("\n");
	sb.append("contentLength=").append(request.getContentLength()).append("\n");
	sb.append("contentType=").append(request.getContentType()).append("\n");
	sb.append("contextPath=").append(request.getContextPath()).append("\n");
	sb.append("localAddr=").append(request.getLocalAddr()).append("\n");
	sb.append("localName=").append(request.getLocalName()).append("\n");
	sb.append("localPort=").append(request.getLocalPort()).append("\n");
	sb.append("locale=").append(request.getLocale().toString()).append("\n");
	sb.append("pathInfo=").append(request.getPathInfo()).append("\n");
	sb.append("pathTranslated=").append(request.getPathTranslated()).append("\n");
	sb.append("protocol=").append(request.getProtocol()).append("\n");
	sb.append("remoteAddr=").append(request.getRemoteAddr()).append("\n");
	sb.append("remoteHost=").append(request.getRemoteHost()).append("\n");
	sb.append("remotePort=").append(request.getRemotePort()).append("\n");
	sb.append("remoteUser=").append(request.getRemoteUser()).append("\n");
	sb.append("authType=").append(request.getAuthType()).append("\n");
	sb.append("isRequestedSessionIdFromCookie=").append(request.isRequestedSessionIdFromCookie()).append("\n");
	sb.append("isRequestedSessionIdFromURL=").append(request.isRequestedSessionIdFromURL()).append("\n");
	sb.append("isRequestedSessionIdValid=").append(request.isRequestedSessionIdValid()).append("\n");
	sb.append("isSecure=").append(request.isSecure()).append("\n");
	sb.append("toString=").append(request.toString()).append("\n");
%>
<%  //输出
	String result = sb.toString();
	pw.write(result);
	pw.flush();
	pw.close();
%>