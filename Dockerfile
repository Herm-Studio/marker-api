# 使用官方Python 3.9镜像作为基础镜像
FROM python:3.9

# 设置工作目录为/app
WORKDIR /app

# 安装系统依赖，包括libgl1-mesa-glx和libglib2.0-0
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# 将当前目录下的文件复制到容器的/app目录下
COPY . /app

# 安装Python依赖
RUN pip install --no-cache-dir -e .

# 暴露端口8000供外部访问
EXPOSE 8000

# 定义容器启动时执行的命令
CMD ["python", "server.py"]
