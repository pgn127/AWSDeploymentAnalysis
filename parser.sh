#!/bin/bash

# ------------------------------------
# SETUP
# Please do not modify this section.

# bash command-line arguments are accessible as $0 (the bash script), $1, etc.


input_file=$1
ulimit -v 1000000   # limit the virtual memory to 1000000 bytes = 1 MB
# ------------------------------------

# ------------------------------------
# STUDENT CODE
# Please replace this section with your solution.

# Example: This will parse the first 20 lines of $input_file and write the results
# to both STDOUT and to a file called example.csv.

echo -e "Here is an example of streaming data into a python function:\n\n"

# you can use \ break up a long sequence of unix pipes onto separate lines...
# just make sure that "\" is the last character on each line

#get the ranking and unique subdomains from alexa top1m list- thsi will be used to populate table
#awk -F'#' '!seen[$2]++ {print $1, $2}' ALL_subdomains_Alexa_top1m.csv > uniquewithrank.txt

#python3 -c 'import parser; parser.extract_subdomains()' > temp.txt
echo -e "About to start dns lookups with dig"

#dig -f tempuniq.txt +noall +answer | awk '$4=="A" {print $1, $5}' | tee dnsresults.txt
echo -e "Digging complete"
python3 -c 'import parser; parser.find_ec2_subdomains()' #creates subdomains.csv from cross referencing dns results

#python3 -c 'import parser; parser.buildsubdomainlist()'