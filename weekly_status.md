# Weekly Status Reports

Each week, please spend 5-10 minutes writing a brief status report.  This does not need to be highly detailed. Some examples are provided below that give some indication of the level of detail.

*Copy the template below for each subsequent week.  Please put the most recent week at the **TOP** of the page.*


## Week 1

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



