SHELL=/bin/bash

UFABC=hostel.ufabc.edu.br
ASTERIX=192.168.0.10

get :	
	rsync --del --exclude=".git" -avuz  ~/Dropbox/public_html/ .	
put :
	rsync --del -Cavuz --exclude="*~" --exclude=".git" ./ ~/Dropbox/public_html

upload :
	rsync  --del -avuz  --exclude="*~" --exclude=".git" ./  -e ssh jair.donadelli@${UFABC}:~/public_html

sync :
	chmod -R 644 ./logica/*.*
	make put upload

download : 
	 rsync  -avuzb -e ssh jair.donadelli@${UFABC}:~/public_html/  .







