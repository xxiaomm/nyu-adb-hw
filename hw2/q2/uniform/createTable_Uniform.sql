DROP TABLE IF EXISTS tradeUniform

CREATE TABLE tradeUniform (
    stocksymbol INT,
    time INT,
    quantity INT,
    price INT
);

LOAD DATA INFILE 'tradeUniform.csv' INTO TABLE trade fields terminated by ',';
