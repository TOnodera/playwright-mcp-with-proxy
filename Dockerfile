FROM mcr.microsoft.com/playwright:v1.58.2-noble


RUN mkdir -p /artifacts /home/pwuser/browser-data /workspace \
  && chown -R ubuntu:ubuntu /artifacts /home/pwuser /workspace

USER ubuntu 
WORKDIR /workspace

# 念のため npm キャッシュ先をユーザー領域へ
ENV npm_config_cache=/home/ubuntu/.npm
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

CMD ["bash"]