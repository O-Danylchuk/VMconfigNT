packets=("tcptracerout" "nethogs")

for packet in ${packets[@]}; do
        if dpkg -l | grep -q $packet; then
		echo "Package $packet already installed"
	else
		sudo apt-get install $packet -y	
       		if dpkg -l | grep -q $packet; then
	       		echo "Package $packet installed successfully"
       		fi
	fi
done


if test -d /usr/bin/believer; then
	touch /usr/bin/believer/config.pl 
else
	echo "Directory does not exist. Creating..."
	sudo mkdir -p /usr/bin/believer/src
	sudo touch /usr/bin/believer/src/config.pl
fi


if test -e simpleService.sh
	sudo chmod +x simpleService.sh
	mv simpleService.sh /etc/
else
	sudo touch /etc/simpleService.sh
	sudo chmod +x /etc/simpleService.sh
fi


if test -e simpleService.service
	sudo mv simpleService.service /etc/systemd/system/simpleService.service
else 
	echo "file simpleService.service not found. Exiting..."
	exit(1)
fi
