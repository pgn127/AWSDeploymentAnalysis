# COSC 480 DS Project

The project guidelines can be found on the [course website](https://github.com/colgate-cosc480ds/lecture).

Please describe any VM setup required for your project here.

This could include commands to download data from online sources.  (Ideally, you should *not* commit raw data to your repo but instead provide instructions on how to obtain it.)

# Introduction

An increasing number of popular web services have been migrating towards hosting their web services through cloud-computing systems such as Amazon's EC2, Cloudfare, Windows Azure, and many more. For this research project, we will be traversing through a variety of datasets to compute an estimate as to how many popular domains use these cloud-computing systems to host their sites. We will be using the 'Alexa Top 1 Million Websites' dataset as test domains, along with Amazon's publically availible ip-ranges to map each domain to the specified Amazon IP range. From here, we will be able to map each domain to a specified region in which their services are hosted through. Through this research we will be abe to answer the following questions:

- What percentage of popular websites are hosting their services through the cloud?
- In the case of a server outage, which region will have the largest effect on these popular websites?
- Is there a specific trend for types of service (E-Commerce, blogging, etc) that belong to the cloud/a specific region in the cloud?

 
## Prerequisites:

- Python 3
- Pytricia (Can be found here: https://github.com/jsommers/pytricia)
- PostGreSQL
- Planet Lab API Access 
- dnsmap (https://code.google.com/archive/p/dnsmap/)
- Knock Wordlist (https://code.google.com/archive/p/knock/source)
	


# Getting Started
## Building The Datasets

For this project, we will be using the Alexa Top 1 Million Websites dataset from February 2013, as Amazon no longer releases this data. From this, we wish to further expand this dataset to find all existing subdomains with each domain, issuing a DNS query of type AXFR (Transfer entire zone file from the master name server to secondary name servers if allowed) on each domain iteratively using the bash script:

	- dig example.com axfr

Finally, since many websites do not allow zone transfer query, we further exapnd this dataset by using dnsmap to brute-force guess subdomains using the Knock wordlist. 

We run this large dataset through a simple python script, which will perform a reverse dns lookup on each domain and subdomain to map each domain name to public IP.

To map these domains and subdomains to Amazon EC2 instances, we will be using the tool Pytricia, developed by Joel Sommers, to calculate if each domains/subdomains IP falls within an Amazon IP range.
    

For all instances found, we will add that to a new dataset containing id, rank, domain, subdomain, Public IP address, Type(of cloud hosting), and region.  




 


