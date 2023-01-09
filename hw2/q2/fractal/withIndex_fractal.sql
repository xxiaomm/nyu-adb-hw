-- 6.06s
create index price_stock on trade(price, stocksymbol);

select distinct stocksymbol
from trade
where stocksymbol < 1000;