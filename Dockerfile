FROM python:3.9

# 设置工作目录为/app，这是容器内部的目录，后续的命令都会在这个目录下执行
WORKDIR /app

# 安装系统依赖，包括libgl1-mesa-glx用于解决libGL.so.1的问题
# 注意：这里使用的是Debian/Ubuntu的包管理命令，因为python:3.9镜像是基于Debian的
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/*

# 将当前目录下的文件复制到容器的/app目录下
COPY . /app

# 安装Python依赖
# 使用pip install -e . 安装一个项目在"editable"模式
RUN pip install --no-cache-dir -e .

# 暴露端口8000供外部访问，这个端口应该与你的应用程序使用的端口一致
EXPOSE 8000

# 定义容器启动时执行的命令
CMD ["python", "server.py"]
