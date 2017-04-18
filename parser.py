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
        reader = csv.DictReader(alexa_subdomains, delimiter='#')
        for line in reader:
            try:
                subdomain_file.write(line['subdomain']+"\n")
            except (BrokenPipeError, IOError):
                pass
        sys.stderr.close()

            #print(line['subdomain'])

def ipfunctin():
    with open('ALL_subdomains_Alexa_top1m.csv','rt') as alexa_subdomains, open('ip-ranges.json','rt') as public_ips, open('subdomains.txt','w') as subdomains:
        reader = csv.DictReader(alexa_subdomains,delimiter='#')

        jsondata = json.load(public_ips)

        for d in jsondata["prefixes"]:
            ip = d['ip_prefix']
            pyt.insert(ip,str(d['region']))

        count = 0
        for line in reader:
            if count<50:
                subdomains.write(line['subdomain']+"\n")
            count +=1
            #line = line.split("#")

            #ip = ipaddress.ip_address(line["ip_address"]) #convert the IP address to IPv4
            #print ip_address
            #if ip in pyt:
            # count+=1
            #print line['alexa_rank'], line['subdomain'],ip_address, "found in ", pyt[ip_address]
        print(count)

