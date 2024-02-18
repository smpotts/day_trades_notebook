create table if not exists public.trades(
    account_id integer,
    symbol varchar(16),
    side varchar(16),
    qty integer,
    timestamp timestamp
);

copy public.trades(account_id, symbol, side, qty, timestamp)
from '/docker-entrypoint-initdb.d/trades.csv'
delimiter ','
csv header;