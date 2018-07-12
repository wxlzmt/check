## check

检查服务器状态,测试HTTP请求服务器参数是否正常,以及返回结果是否正常.

---

#### 开发环境
eclipse,tomcat,jdk

#### 语言
java , jsp   

#### 使用

打成`war`包可以放到`tomcat`下直接用,不涉及配置项,不涉及数据库.    

也可以单独使用 [/src/main/webapp/check.jsp](https://github.com/wxlzmt/check/blob/master/src/main/webapp/check.jsp) ,放到已存在的jsp项目中做测试用.    
独立文件,不涉及其它css/js.

---

#### 附

关于 [/src/main/webapp/WEB-INF/web.xml](https://github.com/wxlzmt/check/blob/master/src/main/webapp/WEB-INF/web.xml) , 内置有一个`filter`,**已注释掉**.     
如果出现HTTP请求中文乱码,可尝试启用此`filter`做测试调整.

---

#### 注意
`tomcat` 在 `/conf/server.xml` 中  `Connector` 节点的 `URIEncoding` 属性 ,     
在 `tomcat7`以及以下版本默认值是:`ISO-8859-1` ,     
`tomcat8`以及以上版本默认值是:`UTF-8`.

`URIEncoding`属性值仅对 HTTP请求的URL参数生效, POST请求体参数不生效.

**官方文档**    
[https://tomcat.apache.org/tomcat-7.0-doc/config/http.html](https://tomcat.apache.org/tomcat-7.0-doc/config/http.html)    
[https://tomcat.apache.org/tomcat-8.0-doc/config/http.html](https://tomcat.apache.org/tomcat-8.0-doc/config/http.html)    
[https://tomcat.apache.org/tomcat-9.0-doc/config/http.html](https://tomcat.apache.org/tomcat-9.0-doc/config/http.html)    

---

end
