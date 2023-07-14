CREATE TABLE IF NOT EXISTS public.products 
(
    product_id integer PRIMARY KEY,
    product_name text NOT NULL,
    price money NOT NULL
);

CREATE TABLE IF NOT EXISTS public.shops
(
    shop_id integer PRIMARY KEY,
    shop_name text NOT NULL
);

CREATE TABLE IF NOT EXISTS public.plan
(
    product_id integer REFERENCES public.products(product_id),
    -- fk_publisher_id integer REFERENCES public.publisher(publisher_id) 
    shop_id integer REFERENCES public.shops(shop_id),
    plan_cnt integer NOT NULL,
    plan_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS public.shop_dns
(
    shop_id integer REFERENCES public.shops(shop_id),
    date DATE NOT NULL,
    product_id integer REFERENCES public.products(product_id),
    sales_cnt integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.shop_mvideo
(
    shop_id integer REFERENCES public.shops(shop_id),
    date DATE NOT NULL,
    product_id integer REFERENCES public.products(product_id),
    sales_cnt integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.shop_sitilink
(
    shop_id integer REFERENCES public.shops(shop_id),
    date DATE NOT NULL,
    product_id integer REFERENCES public.products(product_id),
    sales_cnt integer NOT NULL
);

