# front
卓越小看板前段展示

# 开发环境

* IDE: Intellij IDEA 14
* Java: JDK 7 + Tomcat 7 or higher
* Build Tool: Maven 3.5
* Backend: Spring MVC + Spring + Mybatis
* Web: Bootstrap 3 + jQuery
* Database: MySQL 5.6

# 部署
* 先导入mysql数据库
* 然后使用maven手动打war包：mvn clean package
* 将war包放到tomcat的webapps
* 启动tomcat

# 注意pdf预览插件的使用
* java实现附件预览(openoffice+swftools+flexpaper)：http://blog.csdn.net/zmx729618/article/details/51828963