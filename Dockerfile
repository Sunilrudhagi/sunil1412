From nginx:latest
Copy index.html /usr/share nginx/html/index.html
Expose 80
CMD["nginx","-g","daemon off"]
