-- 9.1s
create index price_stock on trade(price, stocksymbol);

select distinct stocksymbol
from tradeUniform
where stocksymbol < 1000;
