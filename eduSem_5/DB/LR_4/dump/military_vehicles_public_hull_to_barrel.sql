create table hull_to_barrel
(
    hull_id      integer not null
        constraint hull_to_barrel_hull_id_fkey
            references hull,
    barrel_id    integer not null
        constraint hull_to_barrel_barrel_id_fkey
            references barrel,
    manufacturer text
);

alter table hull_to_barrel
    owner to postgres;

INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (1, 3, 'Qatar');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (2, 2, 'Russia');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (3, 5, 'Peru');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (1, 7, 'USA');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (1, 3, 'Qatar');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (2, 2, 'Russia');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (3, 5, 'Peru');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (1, 7, 'USA');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (1, 3, 'Qatar');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (2, 2, 'Russia');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (3, 5, 'Peru');
INSERT INTO public.hull_to_barrel (hull_id, barrel_id, manufacturer) VALUES (1, 7, 'USA');