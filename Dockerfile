# 基础镜像, 需要的环境就是JDK
FROM jdk:8

# 匿名卷，运行的时候可以使用 -v 参数挂载进来
# Spring Boot 使用的内嵌 Tomcat 容器默认使用/tmp作为工作目录
VOLUME /tmp

# 添加jar 文件到镜像中
ADD /docker/lib lib
# 添加jar 文件到镜像中
ADD /docker/app.jar app.jar

# 运行jar 文件
# 为了缩短 Tomcat 启动时间，添加一个系统属性指向 “/dev/urandom” 作为 Entropy Source
# java11 中-Djava.security.egd=file:/dev/./urandom 好像无效了
ENTRYPOINT [ "sh", "-c", "java -jar /app.jar" ]
