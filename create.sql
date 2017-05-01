
DROP TABLE IF EXISTS top1msubdomains CASCADE;
DROP TABLE IF EXISTS top1mdomains CASCADE;
DROP TABLE IF EXISTS dnsresults CASCADE;

CREATE TABLE top1msubdomains (
    alexa_rank integer NOT NULL,
    subdomain text NOT NULL
);

CREATE TABLE top1mdomains (
    rank integer NOT NULL UNIQUE,
    domain text NOT NULL
);

CREATE TABLE dnsresults (
    subdomain text NOT NULL,
    ip text NOT NULL
);

COPY top1msubdomains FROM '/vagrant/projectfrankiepam/uniquewithrank.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ' ');

COPY top1mdomains FROM '/vagrant/projectfrankiepam/top-1mdomains.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY dnsresults FROM '/vagrant/projectfrankiepam/dnsresults1.txt' WITH
(FORMAT text, DELIMITER ' ');

ALTER TABLE ONLY top1msubdomains
    ADD CONSTRAINT top1msub_pkey PRIMARY KEY (alexa_rank,subdomain);

ALTER TABLE ONLY top1msubdomains
    ADD CONSTRAINT top1msub_fkey FOREIGN KEY (alexa_rank) REFERENCES top1mdomains(rank);

ALTER TABLE ONLY top1mdomains
    ADD CONSTRAINT top1mdom_pkey PRIMARY KEY (rank);

ALTER TABLE ONLY dnsresults
    ADD CONSTRAINT dnsresults_pkey PRIMARY KEY (subdomain, ip);

ALTER TABLE ONLY dnsresults
    ADD CONSTRAINT dnsresults_fkey FOREIGN KEY (subdomain) REFERENCES top1msubdomains(subdomain);
