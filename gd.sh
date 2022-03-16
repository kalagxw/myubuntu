wget -N git.io/aria2.sh && chmod +x aria2.sh && ./aria2.sh && \
apt install sudo unzip -y && \
curl https://rclone.org/install.sh | sudo bash && \
cd /root/.aria2c/ && rm upload.sh aria2.conf script.conf \
&& wget https://raw.githubusercontent.com/kalagxw/myubuntu/main/script.conf \
&& wget https://raw.githubusercontent.com/kalagxw/myubuntu/main/upload.sh && chmod a+x upload.sh \
&& wget https://raw.githubusercontent.com/kalagxw/myubuntu/main/aria2.conf && cd ~ \
&& mkdir -p ~/.config/rclone && cd ~/.config/rclone && wget https://github.com/kalagxw/myubuntu/raw/main/rclone.zip && unzip *.zip && rm *.zip && cd ~
