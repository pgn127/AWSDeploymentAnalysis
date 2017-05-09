import re
import collections
import sys
import csv
import json
import pytricia
import ipaddress

pyt = pytricia.PyTricia()

def extract_subdomains():
    with open('uniquewithrank.csv','r') as ranked_subdomains, open('extractedsubdomains.txt','w') as subdomain_file:
        reader = csv.DictReader(ranked_subdomains, delimiter=' ',fieldnames=['alexa_rank','subdomain'])
        writer = csv.DictWriter(subdomain_file)

        for line in reader:

            subdomain_file.write(line['subdomain']+"\n")

            #print(line['subdomain'])

def buildsubdomainlist():
    with open('ALL_subdomains_Alexa_top1m.csv','rt') as alexa_subdomains, open('allsubranks.csv','w') as subdomain_file:
        reader = csv.DictReader(alexa_subdomains, delimiter='#',fieldnames=['alexa_rank','subdomain','ip_address'])
        writer = csv.DictWriter(subdomain_file,delimiter=',',fieldnames=['alexa_rank','subdomain'])
        writer.writeheader()

        for line in reader:
            writer.writerow({'alexa_rank':line['alexa_rank'],'subdomain':line['subdomain']})

            #print(line['subdomain'])

def build_pyt():
    '''build pyt dictionary from the published ips from amazon of ips in EC2... so far 1099999
    53155465 more subdomains to test. have completed 1323641'''
    with open('ip-ranges.json','rt') as public_ips:
        jsondata = json.load(public_ips)

        for item in jsondata['prefixes']:
            #if this ip range is for EC2 service add it to the dictionary
            if(item['service']=='EC2' or item['service']=='AMAZON'): #SHOUDL THIS ALSO INCLUDE ==AMAZON
                pyt.insert(item['ip_prefix'], item['region'])  # insert into pyt


def find_ec2_subdomains():
    '''find the subdomains that have an ip that falls within amazon public ip ranges for EC2'''
    #dns_output_file = 'finalqueries.txt'
    dns_output_file = 'uniqdigresults.txt'

    build_pyt()
    with open(dns_output_file,'rt') as dnslookups, open('ec2cloudsubdomains.csv','w') as crossref_subdomains:
        reader = csv.DictReader(dnslookups,delimiter=' ', fieldnames=['subdomain','ip'])
        writer = csv.DictWriter(crossref_subdomains,['rank','subdomain','subdomainip','region'])
        writer.writeheader()



        count=0 #count the number of ips that are found wihtin an amazon public ip range
        for line in reader:
            subdomain = line['subdomain'][:-1]
            ip = line['ip']
            #print(ip)
            if ip in pyt: #if this ip is within an amazon ip prefix/range
                #print(ip)
                count+=1
                writer.writerow({'rank':0,'subdomain':subdomain,'subdomainip':line['ip'],'region':pyt[ip]})

'''

def queried_subs():
    #write a file that contains a list of all subdomains that were queried using dig (bc we are not able to query them all)
    dns_output_file = 'dnsresults1.txt'

    with  open(dns_output_file,'rt') as dnslookups, open('allqueriedsubdomains.csv','w') as queries_subdomains:
        reader = csv.DictReader(dnslookups, delimiter=' ', fieldnames=['subdomain', 'ip'])
        # write a csv of just the names of the subdomains that were queried
        writer = csv.DictWriter(queried_subdomains, ['subdomain'])
        writer.writeheader()

        for line in reader:
            subdomain = line['subdomain'][:-1]
            writer.writerow({'subdomain': subdomain})


'''







