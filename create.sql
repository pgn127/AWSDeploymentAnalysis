
DROP TABLE IF EXISTS top1msubdomains CASCADE;
DROP TABLE IF EXISTS top1mdomains CASCADE;
DROP TABLE IF EXISTS dnssubdomains CASCADE;

CREATE TABLE top1msubdomains (
    alexa_rank integer NOT NULL,
    subdomain text NOT NULL
    /*ip_address cidr*/
);

/*CREATE TABLE top1mdomains (
    rank integer NOT NULL UNIQUE,
    domain text NOT NULL
);*/

CREATE TABLE dnssubdomains (
  /*rank integer NOT NULL DEFAULT 0,*/
  rank text NOT NULL DEFAULT 0,
  subdomain text NOT NULL,
  subdomainip cidr NOT NULL,
  region text NOT NULL
);

COPY top1msubdomains FROM '/vagrant/projectfrankiepam/uniquewithrank.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ' ');

/*COPY top1mdomains FROM '/vagrant/projectfrankiepam/top-1mdomains.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');*/

COPY dnssubdomains FROM '/vagrant/projectfrankiepam/subdomains.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');


ALTER TABLE ONLY top1msubdomains
    ADD CONSTRAINT top1msub_pkey PRIMARY KEY (alexa_rank,subdomain);

/*ALTER TABLE ONLY top1msubdomains
    ADD CONSTRAINT top1msub_fkey FOREIGN KEY (alexa_rank) REFERENCES top1mdomains(rank);*/

/*ALTER TABLE ONLY top1mdomains
    ADD CONSTRAINT top1mdom_pkey PRIMARY KEY (rank);*/

ALTER TABLE dnssubdomains DROP COLUMN rank;
ALTER TABLE dnssubdomains ADD COLUMN rank integer NOT NULL DEFAULT 0;

UPDATE dnssubdomains
SET rank = top1msubdomains.alexa_rank
FROM top1msubdomains
WHERE top1msubdomains.subdomain=dnssubdomains.subdomain;