 46  logout
 47  locale
 48  locales
 49  locale --help
 50  locale -a
 51  nmap -p 389 ldap1b.habisp.inf.br
 52  nmap -p 389 ldap1b.habisp.inf.br
 53  aptitude update && aptitude upgrade
 54  aptitude install ldap-utils
 55  aptitude install nscd
 56  aptitude install libpam-ldap 
 57  dpkg-reconfigure libpam-ldap
 58  aptitude install libnss-ldap
 59  dpkg-reconfigure libnss-ldap
 60  nano /etc/nsswitch.conf
 61  nano /etc/pam.d/common-session
 62  /etc/init.d/nscd restart
 63  getent passwd ademir
 64  visudo
 65  nano /etc/ssh/sshd_config
 66  /etc/init.d/ssh restart
 67  echo "localhost" > /etc/hostname
 68  hostname -F /etc/hostname
 69  echo '127.0.0.1       localhost.localdomain           localhost' > /etc/hosts
 70  logout
 71  logout
 72  nano /etc/pam.d/common-password
 73  /etc/init.d/nscd restart
 74  exit
 75  ls /home/ademir.escribano/
 76  rmdir /home/ademir.escribano/
 77  rm -R /home/ademir.escribano/
 78  history
 79  logout
 80  echo "call3d" > /etc/hostname
 81  hostname -F /etc/hostname
 82  echo '127.0.0.1       call3d.saopaulocalling.internal          call3d' >> /etc/hosts
 83  nano /etc/ssh/sshd_config
 84  /etc/init.d/ssh restart
 85  logout
 86  aptitude update && aptitude upgrade
 87  aptitude install xfsprogs unzip subversion git screen
 88  git --version
 89  chmod +s /usr/bin/screen
 90  chmod 755 /var/run/screen
 91  logout
 92  fdisk -l
 93  mkfs.xfs /dev/sdk
 94  echo "/dev/sdk /mnt/calling xfs noatime 0 0" | sudo tee -a /etc/fstab
 95  mkdir -p /mnt/calling
 96  mount /mnt/calling
 97  mkfs.xfs /dev/sdl
 98  echo "/dev/sdl /mnt/backup xfs noatime 0 0" | sudo tee -a /etc/fstab
 99  mkdir -p /mnt/backup
100  mount /mnt/backup
101  mkfs.xfs /dev/sdm
102  echo "/dev/sdm /mnt/mongo xfs noatime 0 0" | sudo tee -a /etc/fstab
103  mkdir -p /mnt/mongodb
104  mount /mnt/mongodb
105  nano /etc/fstab
106  mount /mnt/mongodb
107  df -h
108  df -h
109  ls /mnt/backup
110  ls /mnt/backup/calling
111  ls /mnt/backup/calling/2012-05-14_00-00/
112  ls /mnt/backup/calling/2012-05-14_00-00/mongodb/
113  ls /mnt/backup/calling/2012-05-14_00-00/mongodb/calling/
114  ls /mnt/backup/calling/2012-05-14_00-00/mongodb/calling/items.bson 
115  du -h /mnt/backup/calling/2012-05-14_00-00/mongodb/calling/
116  df -hs
117  df -h
118  du -h /
119  du -hs /
120  du -hsx /
121  du -hsxS /
122  df
123  du -ah /mnt/calling
124  du -ahs /mnt/calling
125  du -sh /mnt/calling
126  du -sh /mnt/calling/*
127  du -shx /mnt/calling/*
128  du -hsxS /*
129  du -hsx /*
130  du -hsxc /*
131  df
132  df -h
133  du -hsxc /*
134  du -hsxc /usr/*
135  du -hsxc /usr/local*
136  du -hsxc /usr/share*
137  du -hsxc /*
138  du -hsxc /var/*
139  du -hsxc /var/cache*
140  df -h
141  du -hsxc /mnt/backup/*
142  du -hsxc /mnt/backup/caling/*
143  du -hsxc /mnt/backup/calling/*
144  du -hsxc /mnt/backup/calling/2012-05-17_00-00/*
145  du -hsxc /mnt/backup/calling/2012-05-17_00-00/data/*
146  du -hsxc /mnt/backup/calling/2012-05-17_00-00/data/data*
147  du -hsxc /mnt/backup/calling/2012-05-17_00-00/data/data/*
148  du -hscx /mnt/calling/*
149  du -hscx /mnt/calling/data/*
150  du -hscx /mnt/calling/data/original/*
151  du -hscx /mnt/calling/data/upload/*
152  du -hscx /mnt/calling/data/video/*
153  df -h
154  ls -alh /mnt/calling
155  ls -alh /mnt/calling/data
156  ls -alh /mnt/calling/data/upload/
157  pwd
158  cwd
159  ls -alh /mnt/calling/data/upload/tmp
160  ls /tmp
161  ls -alh /tmp
162  df
163  ls tmpfs
164  ls /tmpfs
165  ls /lib/init/rw
166  df -h
167  ls /mnt/backup
168  ls /mnt/backup/calling
169  ls /mnt/backup/calling/2012-05-24_00-00/
170  du -hsx /mnt/backup/calling/2012-05-24_00-00/*
171  mkdir -p /mnt/ephemeral1/calling/backup
172  ls /mnt/ephemeral1
173  ls /mnt/ephemeral1/calling
174  ifconfig
175  /opt/spcalling/bin/spcallingd stop
176  ps aux | grep node
177  history | grep spcallingd
178  crontab -e
179  cd /opt/spcalling/
180  tail var/error.log
181  tail var/error.log
182  tail var/error.log-201205
183  tail var/error.log-20120520 
184  less var/error.log-20120520 
185  ls var/
186  zcat var/error.log-20120517.gz 
187  pkill node
188  /opt/spcalling/bin/backup.sh &
189  tail -f /opt/spcalling/var/backup-2012-05-26_08-00.log 
190  exit
191  tail -f /opt/spcalling/var/backup-2012-05-26_08-00.log 
192  du -hs /mnt/backup/calling/2012-05-26_08-00/
193  cd /opt/spcalling/
194  vi config.yaml 
195  vi config.cson 
196  vi /etc/nginx/sites-available/spcalling.nginx.conf 
197  /etc/init.d/nginx restart
198  cd /opt/spcalling/
199  vi config.cson 
200  ./bin/config-assets -f -e production -u ALL -d call3d.saopaulocalling.org -p http
201  rm -r app/public/vendor/0.1.0/
202  rm app/assets/assets.production.cson 
203  NODE_ENV=production ./bin/config-assets
204  free
205  exit