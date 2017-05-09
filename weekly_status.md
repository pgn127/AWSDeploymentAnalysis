# Weekly Status Reports

Each week, please spend 5-10 minutes writing a brief status report.  This does not need to be highly detailed. Some examples are provided below that give some indication of the level of detail.

*Copy the template below for each subsequent week.  Please put the most recent week at the **TOP** of the page.*

## Week 6
Report for 5/8/17

What did each project member to this week?

**Frankie:**
- Well, my laptop is officially dead. I do not believe it had to do with this project, but it is officially not turning on anymore. Luckily I use **THE CLOUD** to backup my files (Not EC2 though, HA!). The EDNS lookups are proving to produce identical copies of wht dig queries, which is actually expected, since Aaron only found that 3% used more than one region server.  We stopped the dig function after it actually killed my computer and stopped at around 4% of the possible queried, still giving us over 2.5 million entries. We will now translate the notebook into a powerpoint for our presentation and prepare for whatever question Saw may have for us. 

**Pam:**
- We stopped dig at about 4% done, shocking. It turns out that many subdomains on the list did not exist, and when this happens with dig, it keeps trying for 10 seconds before it times out....per entry. So this time really added up. Completing final visualizations and presentations for tomorrow. A bit hard to reach a conclusion on the data we have, as it at first does not seem like it has a trend. We will look further into this and try to figure out the math behind these numbers. For now, it seems as though we are wrapping up on time.

Provide a rough estimate of the division of labor:
Pam: 50%
Frankie: 50%

What are the team's goals for next week?
- Both must obtain some sleep, Frankie has to get a new laptop, Pam has to take a shower, both have to graduate. 

## Week 6
Report for 5/1/17

What did each project member to this week?


**Frankie:**
- After a couple of hours of being confused, it is confirmed that all Planet Lab nodes are in a failboot mode, and cannont be utilized for geographical dn queries. This is fine, as we can still use EDNS, but it will most likely take a longer period of time and will not be as accurate. My computer has crashed due to running out of memory 3 times now, and am trying to find a way around this. We decided to take a chunk of data that we have been digging for and use this as an example to start to build our databases off of, since we will most likely stop the digging process closer towards the due date. 

**Pam:**
- I learned how to maintain the digging command on both computers in certain situations, e.g., losing internet connection, computer shutting off etc. We pulled a sample set of data from what we have already found and are starting to build our database off this and building queries. 

Provide a rough estimate of the division of labor:
Pam: 50%
Frankie: 50%

What are the team's goals for next week?
- Complete visualizations and probably the project since it's due on Tuesday

## Week 5
Report for 4/24/17

What did each project member to this week?

**Frankie:**
- This week I began to run the dig command on my computer to resolve all DNS lookups to get associated IPs. This is seemingly going to take a very long time, as the dataset is 2 gigs and moving very slowly. Trying to figure out if dig is the correct utility to be using, as I am aware of others. I started to outline the project python notebook as well.

**Pam:**
- I also began running dig on my computer while also discussing different approaches with arron, as his goes very deep into the networking components of EC2, while we primarily want to focus on the data science behind it. I did the math for the dig utility and will take way too long to complete, so we are planning on running it as long as we can and using the data we ascertain from this. It should yield around 10% of the data in which Aaron used in his paper. We resorted the subdomain list so the top subdomains were first, as it is outlined that the top subdomains are the primary users for the clouds

Provide a rough estimate of the division of labor:
Pam: 60%
Frankie: 40%

What are the team's goals for next week?
- attempt to find a machine learning component for this project, as it does not have one at this time. We also hope to find a way to use as much data as possible instead of only using some. 

## Week 4
Report for 4/17/17

What did each project member to this week?

- We both discussed the potential of our previous idea, and found that after consulting with Professor Hay, the idea is nice, but a bit out of the scope of our class, as it deals with mongodb, and other outside information that would potentially hold us back from completion. We have switched our topic to find an accurate measure of how many popular web services use cloud-computing systems for hosting.

**Frankie:**
- This week we both had to work extremely hard to develop and collect data for a brand new idea. I set up the database that contains all of our pre-collected/unprocessed data in a PosGreSQL database using Lab 3 create.sql as a template. We found that through a patch released of the UNIX **dig** utility, which adds support for EDNS queries, which helped us implement a bash script which goes through each domain in the alexa top 1 million sites and finds all associated subdomains. Pam then built a python script which compares each ip address to all ip-ranges associated with Amazon (from amazon-ip-ranges .csv, converted from a json format, only paying attention to ip_ranges and ignoring ipv6_ranges).

**Pam:**
- This week we had to split up the work very evenly so that we would reach the deadlines for the mini-presentation and visualizations. This week I built the python script that matches an IP address to an IP range in the formate of IP, followed by an IP mask, using a tool developed by Professor Sommers called Pytricia. This links all of our subdomains to all instances of an Amazon cloud-computing system. 

Provide a rough estimate of the division of labor:
Pam: 59%
Frankie: 41%

What are the team's goals for next week?
- Develop and implement a machine-learning aspect to this project. As of now, we are looking to see if can predict any specific type of web service to use cloud-computing, but would like to go further. This project has been rather heavy on data aquisition and cleaning, so we have had to spend most of our time making sure we have clean and accurate data that we can use within a database. We are just glad that we finally have a working idea that has to do with networks and requires some sort of low level comprehension so we can use this project for later uses (resume, etc).

## Week 3
Report for 4/10/17

What did each project team member do this week?

- *We have been working on system set up and data storage. A significant portion of our time was spent trying to configure our computers to accomodate cve-search. We have run into trouble trying to configure mongodb and therefore needed to spend a good chunk of our time getting more familiar with terminal (modifying PATH -which we are still confused exactly what this is). Pam has been able to set up mongodb and populate it however it is not working on Frankie's system. Work has been evenly divided as all of the research has been done together but we described a more specific division below. 

- *Pam:
-explore the capabilities of tools we found last week. We cloned the cve-search repo from github which turned out to be significantly more complex and powerful than what we will require for this project. I worked to develop a list of only the necessary capaibilities we will use this tool for:
  -utilize the mongodb database built by the cve-search tool to store CVEs, CPEs, CWEs, CAPEC, and exploit db data 
  -set up mongodb (Still trying to run it on frankies system)


- *Frankie:
- still working on setting up mongodb - many conflicts
- create readme outlining system requirements for projects and set up
- aggregating a final list of resources that we will use

Provide a rough estimate of the division of labor:

- *Frankie: 50%*
- *Pam: 50%*


What are the team's goals for next week?
*Get both systems up and running! 
  -instead of using both cvedb and the redis database we would like to do an ETL so that we can aggregate only the necessary data into a new database where the tables are organized such that we can easily draw links/ connections between CVEs and exploits
  Currently there is multiple databases containing this information(redis database has 3 that pulls from the cvedb). 
  Assess the utility of the ranking system and the "Exploitability metrics" provided by the NVD. We would like to to have a data set by next week.
  
  
## Week 2

Report for the week of 3/20/17 to 3/27/17.

What did each project team member do this week?

- *Pam & Frankie: This week, we both met and discussed our options to move forward in the project. We, initially for the proposal, could not narrow down from the 5 options we presented. After meeting with Professor Hay, we took a specific interest in cyber security using the CVE database. We have come to a conclusion we will be using these databases to attempt to predict which cyber vulnerabilities will most likely become exploits. There are many ways we can approach this problem and are brainstorming on different approaches, but for now we will stick with database aquisition*

- *Frankie: This week, I looked further into the aquisition of essential data we will need and attempting to form it into databases; open vulnerability data. In this case, the most reliabile data would be aquired from the National Vulnerability Database (NVD). It would be easiest to download the database from cve.mitre.org, but since there are ~20 new vulnerabilities released daily, I thought it would be best to use data straight from the government site. A quick search verified that I did not have to reinvent the wheel, and we can simply fork off of the pre-existing project, 'cve-search' (https://github.com/cve-search/cve-search) which does a lot more than I expected. After searching the web for any other relevant databases, I came up the CAPEC database, which is used to identify and understand attacks/how vulnerabilities become exploits. To scrape this website, i also found another tool, that coinsidentially is an extention of 'cve-search' called 'cve-portal' (https://github.com/CIRCL/cve-portal). After doing both of these, it leaves many blanks, and a gigantic dataset that basically crashed my computer. Might need to do this in a VM that doesnt store files locally...*

- *Pam: After looking through all of the databases that we have available for this project, we needed to have a direction that we wanted to take it all. Even though aquisition is getting rather hairy, we still wish to perform a wide range of statisitical analysis on our findings. Our initial question is if we can somehow come up with a method that can basically predict if a public vulnerability will become an exploit. We found a large interest in the extremely high number of vulnerabilities published, yet some of these published vulnerabilities are given little to no attention by blackhat hackers, while others are abused very quickly to form some sort of exploit. Our focus should use machine learning to examine correlations in vulnerability data vs exploits created and see if there is some sort of 'type' of vulnerability that is more likeley to be exploited than others. 
Provide a rough estimate of the division of labor:

- *Frankie: 60%*
- *Pam: 40%*

What are the team's goals for next week?

*[Brief description]: Our main goal for next week is to figure out where we can effectively store all of this data so we can start parsing through it. Both of our machines currently do not have enough storage, and are about to resort to an external hard drive if needed. We also wish to obtain more data regarding exploits, rather than the massive collection of CVE's we currently have. Although CAPEC database does provide us with this, it may be in our better interest to scrape from exploit-db.com, as classifiers already exist within this site, and is the most up-to-date database for exploits.*


## Week 1

project proposal




