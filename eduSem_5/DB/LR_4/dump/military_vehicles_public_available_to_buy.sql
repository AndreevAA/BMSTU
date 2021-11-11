create table available_to_buy
(
    available_to_buy_id        integer     not null,
    available_to_buy_good_type varchar(30) not null,
    available_to_buy_price     integer     not null,
    available_to_buy_good_id   integer     not null
);

alter table available_to_buy
    owner to postgres;

INSERT INTO public.available_to_buy (available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) VALUES (1, 'hull', 5680000, 19);
INSERT INTO public.available_to_buy (available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) VALUES (1, 'hull', 5680000, 19);
INSERT INTO public.available_to_buy (available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) VALUES (1, 'hull', 5680000, 19);
INSERT INTO public.available_to_buy (available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) VALUES (1, 'hull', 5680000, 19);
INSERT INTO public.available_to_buy (available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) VALUES (1, 'hull', 5680000, 19);
INSERT INTO public.available_to_buy (available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) VALUES (1, 'hull', 5680000, 19);
INSERT INTO public.available_to_buy (available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) VALUES (1, 'hull', 5680000, 19);