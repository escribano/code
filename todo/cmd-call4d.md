108  make install
109  ls
110  cd ..
111  ls
112  cd ffmpeg-HEAD-72261fa/
113  ls
114  cd ../x264-snapshot-20120525-2245-stable/
115  ls
116  ls output/
117  cd ..
118  cd lame-3.99.4 && ./configure --prefix=/usr/local && make install && cd ..         && cd faac-1.28 && ./configure --prefix=/usr/local --without-mp4v2 && make install && cd ..         && cd yasm-1.2.0 && ./configure --prefix=/usr/local && make install && cd ..         && cd libvpx-v1.0.0 && ./configure --prefix=/usr/local --enable-vp8 && make install && cd ..         && cd xvidcore/build/generic && ./configure --prefix=/usr/local && make && make install && cd ../../..         && cd x264* && ./configure --prefix=/usr/local --enable-static --enable-shared && make install && cd ..         && cd ffmpeg-HEAD-* &&         ./configure             --enable-libfaac             --enable-libmp3lame             --enable-libtheora             --enable-libvorbis             --enable-libx264             --enable-libvpx             --enable-libxvid             --enable-nonfree             --enable-gpl             --enable-version3 &&         make install
119  cd /usr/lib
120  ln -s /usr/local/lib/libx264.* .
121  ln -s /usr/local/lib/libmp3lame.* .
122  ln -s /usr/local/lib/libfaac.* .
123  ssh 10.28.139.135
124  cd /opt
125  aptitude update
126  aptitude install git nginx
127  git clone git://git.habisp.inf.br/code/sp/calling.git spcalling
128  cd spcalling/
129  git log
130  aptitude install monit
131  vi /etc/monit/monitrc 
132  vi /etc/default/monit 
133  update-rc.d monit remove
134  echo "mo:2345:respawn:/usr/sbin/monit -Ic /etc/monit/monitrc" >>/etc/inittab
135  telinit q
136  wget http://nodejs.org/dist/v0.6.18/node-v0.6.18.tar.gz
137  mv node-v0.6.18.tar.gz ~
138  cd ~
139  tar xvfz node-v0.6.18.tar.gz 
140  cd node-v0.6.18
141  ./configure --prefix=/usr/local
142  apaptitude install build-essential python openssl libssl-dev curl
143  aptitude install build-essential python openssl libssl-dev curl
144  ./configure --prefix=/usr/local
145  make && make install 2>&1 > nodecomp.log
146  (make && make install) 2>&1 > nodecomp.log &
147  tail -f nodecomp.log 
148  ssh 10.28.139.135
149  nohup rsync -avh --log-file=/tmp/datatransfer.log --progress 10.28.139.135:/mnt/backup/2012-05-26_08-00 /mnt/ephemeral0/restore >/tmp/datatransferprogress.log
150  nohup rsync -avh --log-file=/tmp/datatransfer.log --progress 10.28.139.135:/mnt/backup/2012-05-26_08-00 /mnt/ephemeral0/restore >/tmp/datatransferprogress.log
151  ps aux | grep rsync
152  nohup rsync -avh --log-file=/tmp/datatransfer.log --progress 10.28.139.135:/mnt/backup/2012-05-26_08-00 /mnt/ephemeral0/restore >/tmp/datatransferprogress.log
153  ssh 10.28.139.135
154  nohup rsync -avh --log-file=/tmp/datatransfer.log --progress 10.28.139.135:/mnt/backup/calling/2012-05-26_08-00 /mnt/ephemeral0/restore >/tmp/datatransferprogress.log
155  bg %1
156  tail -f /tmp/datatransferprogress.log
157  curl http://npmjs.org/install.sh | sh
158  npm config set registry http://registry.npmjs.org/
159  mkdir ~/mongodb-installer
160  cd ~/mongodb-installer
161  wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.0.5.tgz
162  tar xzf mongodb-linux-x86_64-2.0.5.tgz 
163  mv mongodb-linux-x86_64-2.0.5/bin/* /usr/local/bin/
164  mkdir -p /var/lib/mongodb
165  vi /usr/local/etc/mongodb.conf
166  vi /usr/local/etc/mongodb.conf
167  mongod -f /usr/local/etc/mongodb.conf
168  bg %2
169  mongo
170  kill %2
171  rm -Rf ~/mongodb-installer
172  cp /opt/spcalling/docs/install/resources/mongod.initd.sh /etc/init.d/mongod
173  chmod +x /etc/init.d/mongod
174  cp /opt/spcalling/docs/install/resources/mongod.logrotate.conf /etc/logrotate.d
175  cp /opt/spcalling/docs/install/resources/mongod.monit.conf /etc/monit/conf.d
176  kill `pidof monit`
177  mongo
178  aptitude install tcl8.5
179  cd ~
180  wget http://redis.googlecode.com/files/redis-2.4.14.tar.gz
181  tar xvfz redis-2.4.14.tar.gz 
182  cd redis-2.4.14
183  make && make test && make install
184  cd utils
185  ./install_server.sh
186  redis-cli
187  vi /etc/redis/6379.conf
188  cp /opt/spcalling/docs/install/resources/redis.logrotate.conf /etc/logrotate.d
189  cp /opt/spcalling/docs/install/resources/redis.monit.conf /etc/monit/conf.d
190  kill `pidof monit`
191  /etc/init.d/redis_6379 restart
192  redis-cli
193  aptitude install imagemagick
194  aptitude install build-essential libfaad-dev pkg-config libvorbis-dev libtheora-dev vorbis-tools
195  mkdir ~/ffmpeg-build && cd ~/ffmpeg-build
196  screen -s ffmpeg
197  screen -ls
198  cd /opt/spcalling
199  npm install --verbose
200  cp config.template.cson config.cson
201  cp config.template.json config.json
202  cp config.template.yaml config.yaml
203  vi config.json 
204  vi config.yaml 
205  mkdir -p /mnt/ephemeral0/tmp_uploads
206  vi config.yaml 
207  exit
208  screen 0ls
209  screen -ls
210  exit
211  %1
212  vi config.cson 
213  /opt/spcalling/bin/call --reconfig -e production
214  cd /opt/spcalling/bin
215  cp spcallingd.template spcallingd
216  chmod +x spcallingd
217  cd /opt/spcalling
218  ./bin/config-assets -f -e production -u ALL -d www.saopaulocalling.org -p http
219  /etc/nginx/nginx.conf
220  vi /etc/nginx/nginx.conf
221  cp /opt/spcalling/docs/install/resources/spcalling.nginx.conf /etc/nginx/sites-available
222  vi /etc/nginx/sites-available/spcalling.nginx.conf
223  ln -s /etc/nginx/sites-available/spcalling.nginx.conf /etc/nginx/sites-enabled/spcalling
224  vi /etc/nginx/mime.types 
225  /etc/init.d/nginx restart
226  cp /opt/spcalling/docs/install/resources/spcalling.logrotate.conf /etc/logrotate.d
227  cp /opt/spcalling/docs/install/resources/spcalling.monit.conf /etc/monit/conf.d
228  kill `pidof monit`
229  mongorestore -d calling /mnt/ephemeral0/restore/2012-05-26_08-00/mongodb/calling
230  mongo calling
231  cp -Rv /mnt/ephemeral0/restore/2012-05-26_08-00/data/data/* /mnt/calling/data
232  mkdir /mnt/calling/data
233  cp -Rv /mnt/ephemeral0/restore/2012-05-26_08-00/data/data/* /mnt/calling/data
234  ls -l /mnt/calling/data/upload/
235  cd /opt/spcalling/bin
236  cp backup.template.sh backup.sh
237  chmod +x backup.sh
238  ls -l
239  vi backup.sh 
240  crontab -e
241  cd ..
242  vi config.yaml 
243  /opt/spcalling/bin/call --reconfig -e production
244  /bin/call -e production --verbose
245  ./bin/call -e production --verbose
246  /etc/init.d/nginx stop
247  ./bin/call -e production --verbose
248  bg %1
249  curl http://localhost:3000/ws/item-migrate/is_original
250  curl http://localhost:3000/ws/item-migrate/publish_status
251  curl http://localhost:3000/ws/item-migrate/update_materialized_path
252  curl http://localhost:3000/ws/events/create
253  curl http://localhost:3000/ws/fixes/tag-0.1.1
254  %1
255  ps aux | grep node
256  ./bin/spcallingd start
257  ps aux | grep node
258  tail -f var/error.log 
259  pkill node
260  cd ~
261  wget http://nodejs.org/dist/v0.6.2/node-v0.6.2.tar.gz
262  tar xvfz node-v0.6.2.tar.gz 
263  cd node-v0.6.2
264  ./configure --prefix=/usr/local
265  cd ../node-v0.6.18
266  make uninstall
267  cd ../node-v0.6.2
268  ./configure --prefix=/usr/local
269  make && make install
270  curl http://npmjs.org/install.sh | sh
271  npm config set registry http://registry.npmjs.org/
272  cd /opt/spcalling/
273  rm -r node_modules/
274  npm install --verbose
275  ps aux | grep node
276  ./bin/spcallingd start
277  tail -f var/error.log 
278  echo>var/error.log 
279  tail -f var/error.log 
280  ./bin/spcallingd restart
281  tail -f var/error.log 
282  tail -f var/access.log 
283  /etc/init.d/nginx start
284  git pull
285  less apps/app1/assets/assets.production.cson 
286  vi config.cson 
287  ./bin/spcallingd restart
288  tail -f var/error.log 
289  vi config.cson 
290  ./bin/spcallingd restart
291  sudo -i /opt/spcalling/bin/clear-temp-posts-job 2>&1 >> /opt/spcalling/var/clear-temp-posts.log
292  tail var/clear-temp-posts.log 
293  NODE_ENV=production sudo -i /opt/spcalling/bin/clear-temp-posts-job 2>&1 >> /opt/spcalling/var/clear-temp-posts.log
294  tail var/clear-temp-posts.log 
295  NODE_ENV=production /opt/spcalling/bin/clear-temp-posts-job
296  NODE_ENV=production /opt/spcalling/bin/clear-temp-posts-job
297  TEST=1 echo $TEST
298  mongo calling
299  ps aux | grep ffmpeg
300  htop
301  aptitude install htop
302  htop
303  htop
304  htop
305  git pull
306  ps aux | grep ffmpeg
307  htop
308  /etc/init.d/nginx stop
309  htop
310  ./bin/spcallingd restart
311  /etc/init.d/nginx start
312  exit
313  history