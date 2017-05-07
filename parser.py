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

def build_pyt():
    '''build pyt dictionary from the published ips from amazon... so far 1099999
    53155465 more subdomains to test. have completed 1323641'''
    with open('ip-ranges.json','rt') as public_ips:
        jsondata = json.load(public_ips)

        for item in jsondata['prefixes']:
            pyt.insert(item['ip_prefix'], item['region'])  # insert into pyt

def crossref_subdomainip():
    dns_output_file = 'dnsresults1.txt'
    build_pyt()
    with open(dns_output_file,'rt') as dnslookups, open('subdomains.csv','w') as crossref_subdomains:
        reader = csv.DictReader(dnslookups,delimiter=' ', fieldnames=['subdomain','ip'])
        writer = csv.DictWriter(crossref_subdomains,['rank','subdomain','subdomainip','region'])
        writer.writeheader()

        count=0 #count the number of ips that are found wihtin an amazon public ip range
        for line in reader:
            subdomain = line['subdomain'][:-1]
            ip = line['ip']
            if ip in pyt: #if this ip is within an amazon ip prefix/range
                count+=1
                #what does pyt[ip] show
                #print(pyt[ip])
                writer.writerow({'rank':0,'subdomain':subdomain,'subdomainip':ip,'region':pyt[ip]})









