
DROP TABLE IF EXISTS top1msubdomains CASCADE;

DROP TABLE IF EXISTS allqueriedalexasubdomains CASCADE;
DROP TABLE IF EXISTS top1mdomains CASCADE;
DROP TABLE IF EXISTS cloudsubdomains CASCADE;



CREATE TABLE IF NOT EXISTS top1msubdomains (
    alexa_rank integer NOT NULL,
    subdomain text NOT NULL

);

CREATE TABLE top1mdomains (
    rank integer NOT NULL UNIQUE,
    domain text NOT NULL
);

/*
CREATE TABLE dnssubdomains (
  /*rank integer NOT NULL DEFAULT 0,*/
  rank integer NOT NULL,
  subdomain text NOT NULL,
  subdomainip cidr NOT NULL,
  region text NOT NULL
);
*/

CREATE TABLE cloudsubdomains (
    rank integer NOT NULL DEFAULT 0,
    subdomain text NOT NULL,
    ip text NOT NULL,
    region text NOT NULL
);


CREATE TABLE allqueriedalexasubdomains (
    subdomain text NOT NULL
);

COPY top1msubdomains FROM '/vagrant/projectfrankiepam/uniquewithrank.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ' ');

COPY top1mdomains FROM '/vagrant/projectfrankiepam/top-1mdomains.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY cloudsubdomains FROM '/vagrant/projectfrankiepam/ec2cloudsubdomains.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY allqueriedalexasubdomains FROM '/vagrant/projectfrankiepam/ALLqueriedalexasubdomains.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ' ');

ALTER TABLE allqueriedalexasubdomains ADD COLUMN rank integer NOT NULL DEFAULT 0;

ALTER TABLE ONLY top1msubdomains
    ADD CONSTRAINT top1msub_pkey PRIMARY KEY (alexa_rank,subdomain);

/*
ALTER TABLE ONLY allqueriedalexasubdomains
    ADD CONSTRAINT queriedsub_pkey PRIMARY KEY (rank,subdomain);*/


/*ALTER TABLE ONLY top1msubdomains
    ADD CONSTRAINT top1msub_fkey FOREIGN KEY (alexa_rank) REFERENCES top1mdomains(rank);*/

/*ALTER TABLE ONLY top1mdomains
    ADD CONSTRAINT top1mdom_pkey PRIMARY KEY (rank);*/

/*ALTER TABLE dnssubdomains DROP COLUMN rank;
ALTER TABLE dnssubdomains ADD COLUMN rank integer NOT NULL DEFAULT 0; */




/*Build subdomain table from only those subdomains in the dns query results that are present in
the original subdomain list uniquewithrank.csv

INSERT INTO cloudsubdomains
(rank,subdomain,ip,region)
SELECT dnssubdomains.rank, dnssubdomains.subdomain,dnssubdomains.subdomainip, dnssubdomains.region
FROM dnssubdomains
WHERE dnssubdomains.subdomain in (SELECT top1msubdomains.subdomain from top1msubdomains);


UPDATE cloudsubdomains
SET rank = top1msubdomains.alexa_rank
FROM top1msubdomains
WHERE top1msubdomains.subdomain=cloudsubdomains.subdomain; */

/*
UPDATE dnssubdomains
SET rank = top1msubdomains.alexa_rank
FROM top1msubdomains
WHERE top1msubdomains.subdomain=dnssubdomains.subdomain;*/