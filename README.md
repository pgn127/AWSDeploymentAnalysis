# COSC 480 DS Project

The project guidelines can be found on the [course website](https://github.com/colgate-cosc480ds/lecture).

Please describe any VM setup required for your project here.

This could include commands to download data from online sources.  (Ideally, you should *not* commit raw data to your repo but instead provide instructions on how to obtain it.)

## Getting Started
Make your own local directory which will hold all of the contents for this project (inluding all scrapers and databases.

Install homebrew command line:

    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
Next, you will need to clone the following repo into your current directory to populate you directory:

	git clone https://github.com/cve-search/cve-search
	git clone https://github.com/CIRCL/cve-portal
	
# CVE-Search
## Installation prerequisites:

Python 3:

    Brew install python3
    
Redis:

    Brew install redis

Mongodb:

	Brew update
	Brew install mongodb
	Mkdir -p /data/db # make sure you have /data/db and **NOT** data/db. It will put the database directory in the wrong place
	Sudo chown -R ‘id -un’ /data/db
If the last command does not work, use this one instead:

	sudo chmod 0755 /data/db && sudo chown $USER /data/db
	
Open a mongo session in on terminal with this command

	mongodb
  
Open another terminla window, run the same command, this will open a mongodb session.

If command not regonized, make sure Mongo binaries are installed by running:

	export PATH=<mongodb-install-directory>/bin:$PATH


Finally, cd into your cloned folder and then run the following command:

	sudo pip3 install -r requirements.txt
	
To populate the database, run the following:

 	./sbin/db_mgmt.py -p
	./sbin/db_mgmt_cpe_dictionary.py
	./sbin/db_updater.py -c

# CVE-Portal
## Installation prerequisites:

cd into the cve-portal repository and run the following command
	
	sudo pip3 install -r requirements.txt
Most should be installed, but double check to make sure these packages are also installed:

- python-mysqldb
- libmysqlclient-dev
- python-dev
- unzip
- python-virtualenv
- git
- libssl-dev

Switch to the directort and run

	./install.sh (install package and dependencies)

	cd config; cp config.cfg.sample config.cfg (copy the sample configuration)

*Change the configuration with your settings in config.cfg.*

Activate the Python virtual env 

	cd app; . ./virtenv/bin/activate

	python create.py (tables creation and populating db)

	./LAUNCH.sh (Run the flask server)

## Using mongodb from cve-search
run command 'mongod' in one terminal session
in the other, cd into the mongodb directory and run './bin/mongo' to start a session
the data is stored in cvedb so switch to that db


 


