# Weekly Status Reports

Each week, please spend 5-10 minutes writing a brief status report.  This does not need to be highly detailed. Some examples are provided below that give some indication of the level of detail.

*Copy the template below for each subsequent week.  Please put the most recent week at the **TOP** of the page.*

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




