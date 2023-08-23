#!/bin/bash
#install app servers
sudo apt update
sudo apt upgrade -y
sudo apr install -y ansible
# sudo apt install -y build-essential

# sudo apt install -y nginx
# sudo apt install -y default-jre git
# sudo apt install -y python3-pip
# python3 -m pip install pymongo
# pip3 install python-docker
# #add node 14 LTS
# sudo apt-get install -y curl
# curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
# sudo apt install -y nodejs
# sudo npm install -g pm2
# pm2 startup systemd
# #run the last line from output:
# sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
# sudo chown -R ubuntu:ubuntu /home/ubuntu/.pm2
# sudo npm install -g typescript@4.3.5
# sudo npm install -g @angular/cli
# sudo apt install -y mongodb-clients
# sudo mkdir -p /var/beacon/public_html
# sudo chown ubuntu:ubuntu /var/beacon/public_html
# mkdir -p /home/ubuntu/workspace
# sudo chown ubuntu:ubuntu /home/ubuntu/workspace
# sudo wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem -P /home/ubuntu/workspace
# touch /home/ubuntu/workspace/config.json
# #add config.js & rds-combined-ca-bundle.pem to this folder
# sudo mkdir -p /etc/nginx/ssl
# sudo touch /etc/nginx/sites-available/beaconcure_validation_app
# #copy beaconcure_validation_app.config
# #deploy from jenkins
# sudo rm /etc/nginx/sites-enabled/default
# sudo ln -s /etc/nginx/sites-available/beaconcure_validation_app /etc/nginx/sites-enabled
# sudo systemctl restart nginx
# echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEC2S15oIwezwqBfk+csfMqJAPF4UStiiF818KcH5RPfB6w42uMl0pmqeLdcy33hxS4FJwUlncluFTXYYj0oSeWfqpRw9Jkv8haeUDXCQo7jsb706Jb6/mzIox62G5S9nR9P7gi4EcnENF0zO+uuSINPf4REGnAq3l41EUNul6XP/8wo2F4asoEjvXapQUDBG75HCNUPtrPbFXqEpN5BYIwvL9AM4OomstUtykJSYd/a/cTHHZbH0L4SU0NfkY0OiVsmY4coOcZyhuZ+2AtaKhZPiHm1mrKcc5LGZRXcl3yKt4sYtfTyqfLH9PGdgGyU9Ke5OZ7eiwrtLIU7McyWAQUU3L3kmnDzSPCoSlsy5+CqcUYk0GN0jHnYIo1vm/aMJyIwfFb0nuH5MqML9Rg+J9G3X2n4e+8gs1SCQw7hhKKvxlB9nAetmftvteg24QQYxYxQADx49XhKN/ZacZ7m9ZZNWi67nfyKTR5uVLm6fwiFtipJ+qKE7+IbpYHfSj0xk= ubuntu@ip-172-35-31-67' >> /home/ubuntu/.ssh/authorized_keys
# sudo bash -c cat > /etc/nginx/sites-available/beaconcure_validation_app << 'EOF'
# limit_req_zone $binary_remote_addr zone=beaconcure:10m rate=15r/s;
# server {
#     limit_req zone=beaconcure burst=36 nodelay;
#         listen 80 default_server;
#         listen [::]:80 default_server;
#         server_name verify-pf-sb.beaconcure.com;
#         root /var/beacon/public_html;
#         # Load configuration files for the default server block.
#         include /etc/nginx/default.d/*.conf;
#         client_max_body_size 1500M;
#         server_tokens off;
#         add_header X-Content-Type-Options nosniff;
#     location / {
#       # First attempt to serve request as file, then as directory, then fall back to displaying a 404.
#       try_files $uri $uri/ /index.html =404;
#       add_header "Access-Control-Allow-Origin" "https://verify-pf-sb.beaconcure.com,http://verify-pf-sb.beaconcure.com";
#       add_header X-Frame-Options "DENY";
#       add_header X-XSS-Protection "1; mode=block";
#       add_header X-Content-Type-Options "nosniff";
#       expires 1d;
#       location ~* \.(js|css|png|jpg|jpeg|gif|svg|ico)$ {
#         expires 60d;
#       }				
#         }		
#         location /api {
#       proxy_set_header X-Real-IP $remote_addr;
#       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#       proxy_set_header Host $http_host;
#       proxy_set_header X-NginX-Proxy true;
#       proxy_read_timeout 300;
#       rewrite ^/api/?(.*) /$1 break;
#       proxy_pass http://127.0.0.1:8222;
#       proxy_redirect off;
#       proxy_hide_header 'access-control-allow-origin';
#       add_header "Access-Control-Allow-Origin" "https://verify-pf-sb.beaconcure.com,http://verify-pf-sb.beaconcure.com";
#       proxy_hide_header "cache-cntrol";
#       add_header "Cache-Control" "no-store";
#         }
#     location /report {
#       proxy_set_header X-Real-IP $remote_addr;
#       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#       proxy_set_header Host $http_host;
#       proxy_set_header X-NginX-Proxy true;
#       proxy_read_timeout 300;
#       rewrite ^/report/?(.*) /$1 break;
#       proxy_pass http://127.0.0.1:3000;
#       proxy_redirect off;
#       proxy_hide_header 'access-control-allow-origin';
#       add_header "Access-Control-Allow-Origin" "https://verify-pf-sb.beaconcure.com,http://verify-pf-sb.beaconcure.com";
#       proxy_hide_header "cache-cntrol";
#       add_header "Cache-Control" "no-store";
#         }
#     location /output {
#       proxy_set_header X-Real-IP $remote_addr;
#       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#       proxy_set_header Host $http_host;
#       proxy_set_header X-NginX-Proxy true;
#       proxy_read_timeout 300;
#       rewrite ^/output/?(.*) /$1 break;
#       proxy_pass http://127.0.0.1:3200;
#       proxy_redirect off;
#       proxy_hide_header 'access-control-allow-origin';
#       add_header "Access-Control-Allow-Origin" "https://verify-pf-sb.beaconcure.com,http://verify-pf-sb.beaconcure.com";
#       proxy_hide_header "cache-cntrol";
#       add_header "Cache-Control" "no-store";
#         }
#         # redirect server error pages to the static page /40x.html
#         error_page 404 /error.html;
#     error_page 403 /error.html;
#     location = /error.html {
#         }
#         # redirect server error pages to the static page /50x.html
#         error_page 500 502 503 504 /error.html;
# }

# EOF
# */