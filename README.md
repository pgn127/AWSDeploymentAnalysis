# Introduction

An increasing number of popular web services have been migrating towards hosting their web services through cloud-computing systems such as Amazon's EC2, Cloudfare, Windows Azure, and many more. For this research project, we will be traversing through a variety of datasets to compute an estimate as to how many popular domains use these cloud-computing systems to host their sites. We will be using the 'Alexa Top 1 Million Websites' dataset as test domains, along with Amazon's publically availible ip-ranges to map each domain to the specified Amazon IP range. From here, we will be able to map each domain to a specified region in which their services are hosted through. Through this research we will be abe to answer the following questions:

- What percentage of popular websites are hosting their services through the cloud?
- In the case of a server outage, which region will have the largest effect on these popular websites?
- Is there a specific trend for types of service (E-Commerce, blogging, etc) that belong to the cloud/a specific region in the cloud?

 
## Prerequisites:
- Vagrant
- pip
- ipython3 Kernel
- Python 3
- Pytricia (Can be found here: https://github.com/jsommers/pytricia)
- PostGreSQL
- **dig** with EDNS with client-subnet support (see patch instructions below) 
- dnsmap (https://code.google.com/archive/p/dnsmap/)
- Tableau

# Install Python 3 and the iPython3 kernel for Jupyter Notebook Support

	$ sudo apt-get install python3-pip
	$ python2 -m pip install ipykernel
	$ python2 -m ipykernel install --user
	$ python3 -m pip install ipykernel
	$ python3 -m ipykernel install --user
	
# Install dig patch

	$ wget ftp://ftp.isc.org/isc/bind9/9.9.3/bind-9.9.3.tar.gz
	$ tar xf bind-9.9.3.tar.gz
	$ cd bind-9.9.3
	$ wget http://wilmer.gaa.st/edns-client-subnet/bind-9.9.3-dig-edns-client-subnet-iana.diff
Patch the code, configure (without OpenSSL because we only want dig) and compile.

	$ patch -p0 < bind-9.9.3-dig-edns-client-subnet-iana.diff
	$ ./configure --without-openssl
	$ make
Now you will have dig placed in bin/dig. You can try it this way:

	$ ./bin/dig/dig @ns1.google.com www.google.es +client=157.88.0.0/16
	



# Getting Started
To view methodology and results, please see `project.ipynb`





 


