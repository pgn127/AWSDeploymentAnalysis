import re
import collections
import sys
import csv
import json
import pytricia
import ipaddress



pyt = pytricia.PyTricia()

def extract_subdomains():
    with open('ALL_subdomains_Alexa_top1m.csv','rt') as alexa_subdomains, sys.stdout as subdomain_file:
        #open('temp.txt','w')
        reader = csv.DictReader(alexa_subdomains, delimiter='#')
        for line in reader:
            try:
                subdomain_file.write(line['subdomain']+"\n")
            except (BrokenPipeError, IOError):
                pass
        sys.stderr.close()

            #print(line['subdomain'])

def build_pyt():
    '''build pyt dictionary from the published ips from amazon... so far 1099999
    53155465 more subdomains to test. have completed 1323641'''
    with open('ip-ranges.json','rt') as public_ips:
        jsondata = json.load(public_ips)

        for item in jsondata['prefixes']:
            pyt.insert(item['ip_prefix'], item['region'])  # insert into pyt

def crossref_subdomainip(dns_output_file):
    build_pyt()
    with open(dns_output_file,'r') as dnslookups, open('subdomains.txt','w') as crossref_subdomains:
        reader = csv.DictReader(dnslookups,delimiter=' ')
        writer = csv.DictWriter(crossref_subdomains,['rank','subdomain','subdomainip'])
        writer.writeheader()

        count=0 #count the number of ips that are found wihtin an amazon public ip range
        for line in reader:
            if line[3]== 'CNAME': #ignore queries that were redirected to cname
                continue
            subdomain = line[0]
            ip = line[1]
            if ip in pyt: #if this ip is within an amazon ip range
                count+=1
                #what does pyt[ip] show
                writer.writerow({'rank':'todo','subdomain':subdomain,'subdomainip':ip})









