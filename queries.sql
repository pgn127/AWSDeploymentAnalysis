/*Build subdomain table from only those subdomains in the dns query results that are present in
the original subdomain list uniquewithrank.csv*/

/*INSERT INTO cloudsubdomains (rank,subdomain,ip,region) SELECT dnssubdomains.rank, dnssubdomains.subdomain,dnssubdomains.subdomainip, dnssubdomains.region FROM dnssubdomains WHERE dnssubdomains.subdomain in (SELECT top1msubdomains.subdomain from top1msubdomains);

*/



/*Delete from allqueriedalexasubdomains where allqueriedalexasubdomains.subdomain not in (SELECT top1msubdomains.subdomain from top1msubdomains); */



UPDATE cloudsubdomains SET rank = top1msubdomains.alexa_rank FROM top1msubdomains WHERE top1msubdomains.subdomain=cloudsubdomains.subdomain;
UPDATE allqueriedalexasubdomains SET rank = top1msubdomains.alexa_rank FROM top1msubdomains WHERE top1msubdomains.subdomain=allqueriedalexasubdomains.subdomain;


/*Delete entries in cloudsubdomains with rank=0 AKA this would be the case when the subdomain was not in the alexa subdomain list*/
Delete from cloudsubdomains where cloudsubdomains.rank=0;


select alexa_rank, domain, count(subdomain) as num_subdomains
from (select rank,domain from top1mdomains order by rank ASC limit 500) as domains, (select alexa_rank, subdomain from top1msubdomains order by rank ASC) as subs
where domains.rank=subs.alexa_rank
group by alexa_rank,domain
order by alexa_rank ASC limit 10;

select alexa_rank, domain, count(subdomain) as num_subdomains from (select rank,domain from top1mdomains order by rank ASC limit 500) as domains, (select alexa_rank, subdomain from top1msubdomains order by rank ASC) as subs where domains.rank=subs.alexa_rank group by alexa_rank,domain order by alexa_rank ASC limit 10;
