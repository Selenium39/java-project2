# java-project2
springmvc+jdbc+jsp+mysql做的在线投票系统<br/>
用到的技术以及难点:<br/><br/>
1.页面展示使用jsp，用到了jquery，bootstrap3，投票展示用JFreeChart绘制的柱状图，有些页面的效果源码来自源码之家(代码的复用，哈哈哈，侵权我也没钱赔)<br/>
2.控制层使用的是springmvc<br/>
3.数据库mysql，使用的原生jdbc连接<br/>
4.使用到了分页技术：①先写Page类②写PageUtil类③在url中使用？进行带参数的传递来控制分页，在控制器方法使用@RequestParam(或者不使用？，在控制器方法中使用@PathVariable)
<br/>
可以改进的地方(为什么不改？因为懒):<br/>
1.本来应该分为管理员和用户两种角色的，可以通过权限控制(shiro)区别开，但是我懒，于是写在一起了。<br/>
2.管理投票的update没有写，懒得想了。<br/>
3.有些页面可以通过<c:if></c:if>语句实现复用，如投票分页和查询投票数分页，添加投票与修改投票。<br/>


常见问题:<br/>
1.报错:Description Resource Path Location	 Type web.xml is missing and <failOnMissingWebXml> is set to true:<br/>
https://blog.csdn.net/shursulei/article/details/78820418<br/>
2.jsp页面点击按钮后页面进行了刷新:<br/>
https://blog.csdn.net/jrainbow/article/details/44978843(默认为submit了)<br/>
3.springmvc三种访问静态资源的方法:<br/>
https://blog.csdn.net/u012730299/article/details/51872704<br/>
4.插入数据库后中文出现了乱码:<br/>
检查了数据库的编码，jsp编码，eclipse编码都是utf-8，不知道哪里的编码有问题，但在web.xml中配置了CharacterEncodingFilter后问题解决<br/>
5.使用jquery循环处理删除按钮时，发现匿名函数内访问外部数组总是undefine:<br/>
https://stackoverflow.com/questions/50548399/the-lambda-function-how-to-visit-the-external-array/50548482?noredirect=1#comment88107831_50548482<br/>
5.报错:java.lang.UnsupportedClassVersionError: com/mysql/cj/jdbc/Driver : Unsupported major.minor version 5<br/>
jre版本太低(都jdk7了，还低我也是醉了),不支持mysql，将jre升到1.8解决<br/>
6.投票结果用柱形图显示，使用的工具是JFreeChart:<br/>
https://blog.csdn.net/liutong123987/article/details/78888333

