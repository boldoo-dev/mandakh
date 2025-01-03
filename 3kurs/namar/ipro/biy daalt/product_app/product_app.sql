PGDMP                       }            product_app    17.2    17.2 =    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            @           1262    16507    product_app    DATABASE     �   CREATE DATABASE product_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE product_app;
                     postgres    false            �            1255    16640    calculate_order_total_price()    FUNCTION     �   CREATE FUNCTION public.calculate_order_total_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.total_price := NEW.quantity * (SELECT price FROM products WHERE id = NEW.product_id);
    RETURN NEW;
END;
$$;
 4   DROP FUNCTION public.calculate_order_total_price();
       public               postgres    false            �            1255    16641    calculate_sale_total_price()    FUNCTION     �   CREATE FUNCTION public.calculate_sale_total_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.total_price := NEW.quantity * (SELECT price FROM products WHERE id = NEW.product_id);
    RETURN NEW;
END;
$$;
 3   DROP FUNCTION public.calculate_sale_total_price();
       public               postgres    false            �            1259    16584 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    16583    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public               postgres    false    224            A           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public               postgres    false    223            �            1259    16613    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    product_id integer,
    quantity integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_price numeric(10,2) DEFAULT 0 NOT NULL
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            �            1259    16612    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               postgres    false    228            B           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public               postgres    false    227            �            1259    16594    products    TABLE     '  CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    category_id integer,
    supplier_id integer,
    quantity integer DEFAULT 0 NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    16593    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public               postgres    false    226            C           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public               postgres    false    225            �            1259    16627    sales    TABLE     �   CREATE TABLE public.sales (
    id integer NOT NULL,
    product_id integer,
    quantity integer NOT NULL,
    sale_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_price numeric(10,2) DEFAULT 0 NOT NULL
);
    DROP TABLE public.sales;
       public         heap r       postgres    false            �            1259    16626    sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public               postgres    false    230            D           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public               postgres    false    229            �            1259    16574 	   suppliers    TABLE     �   CREATE TABLE public.suppliers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    contact_info text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.suppliers;
       public         heap r       postgres    false            �            1259    16573    suppliers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.suppliers_id_seq;
       public               postgres    false    222            E           0    0    suppliers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;
          public               postgres    false    221            �            1259    16515    t_token    TABLE     �   CREATE TABLE public.t_token (
    tokenid bigint NOT NULL,
    uid bigint NOT NULL,
    token character varying(255),
    tokentype character varying(10),
    tokenenddate timestamp with time zone,
    createddate timestamp with time zone
);
    DROP TABLE public.t_token;
       public         heap r       postgres    false            �            1259    16514    t_token_tokenid_seq    SEQUENCE     �   ALTER TABLE public.t_token ALTER COLUMN tokenid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_token_tokenid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000000000000
    CACHE 1
);
            public               postgres    false    218            �            1259    16521    t_user    TABLE     u  CREATE TABLE public.t_user (
    pid bigint NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    address character varying(200),
    phone character varying(20),
    email character varying(250),
    password character varying(255),
    is_verified boolean,
    last_login time with time zone,
    created_date timestamp with time zone
);
    DROP TABLE public.t_user;
       public         heap r       postgres    false            �            1259    16520    t_user_pid_seq    SEQUENCE     �   ALTER TABLE public.t_user ALTER COLUMN pid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_user_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    220            y           2604    16587    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            ~           2604    16616 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            {           2604    16597    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    16630    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    229    230            w           2604    16577    suppliers id    DEFAULT     l   ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);
 ;   ALTER TABLE public.suppliers ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            4          0    16584 
   categories 
   TABLE DATA           G   COPY public.categories (id, name, description, created_at) FROM stdin;
    public               postgres    false    224   �H       8          0    16613    orders 
   TABLE DATA           S   COPY public.orders (id, product_id, quantity, order_date, total_price) FROM stdin;
    public               postgres    false    228   dI       6          0    16594    products 
   TABLE DATA           c   COPY public.products (id, name, category_id, supplier_id, quantity, price, created_at) FROM stdin;
    public               postgres    false    226   �I       :          0    16627    sales 
   TABLE DATA           Q   COPY public.sales (id, product_id, quantity, sale_date, total_price) FROM stdin;
    public               postgres    false    230   "K       2          0    16574 	   suppliers 
   TABLE DATA           G   COPY public.suppliers (id, name, contact_info, created_at) FROM stdin;
    public               postgres    false    222   }K       .          0    16515    t_token 
   TABLE DATA           \   COPY public.t_token (tokenid, uid, token, tokentype, tokenenddate, createddate) FROM stdin;
    public               postgres    false    218   �K       0          0    16521    t_user 
   TABLE DATA           �   COPY public.t_user (pid, firstname, lastname, address, phone, email, password, is_verified, last_login, created_date) FROM stdin;
    public               postgres    false    220   L       F           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 4, true);
          public               postgres    false    223            G           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 3, true);
          public               postgres    false    227            H           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 20, true);
          public               postgres    false    225            I           0    0    sales_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sales_id_seq', 3, true);
          public               postgres    false    229            J           0    0    suppliers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);
          public               postgres    false    221            K           0    0    t_token_tokenid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.t_token_tokenid_seq', 10, true);
          public               postgres    false    217            L           0    0    t_user_pid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.t_user_pid_seq', 13, true);
          public               postgres    false    219            �           2606    16592    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    224            �           2606    16620    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    228            �           2606    16527    t_user person_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT person_pkey PRIMARY KEY (pid);
 <   ALTER TABLE ONLY public.t_user DROP CONSTRAINT person_pkey;
       public                 postgres    false    220            �           2606    16601    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    226            �           2606    16634    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public                 postgres    false    230            �           2606    16582    suppliers suppliers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public                 postgres    false    222            �           2606    16519    t_token t_token_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.t_token
    ADD CONSTRAINT t_token_pkey PRIMARY KEY (tokenid);
 >   ALTER TABLE ONLY public.t_token DROP CONSTRAINT t_token_pkey;
       public                 postgres    false    218            �           1259    16646    idx_orders_product_id    INDEX     N   CREATE INDEX idx_orders_product_id ON public.orders USING btree (product_id);
 )   DROP INDEX public.idx_orders_product_id;
       public                 postgres    false    228            �           1259    16644    idx_products_category_id    INDEX     T   CREATE INDEX idx_products_category_id ON public.products USING btree (category_id);
 ,   DROP INDEX public.idx_products_category_id;
       public                 postgres    false    226            �           1259    16645    idx_products_supplier_id    INDEX     T   CREATE INDEX idx_products_supplier_id ON public.products USING btree (supplier_id);
 ,   DROP INDEX public.idx_products_supplier_id;
       public                 postgres    false    226            �           1259    16647    idx_sales_product_id    INDEX     L   CREATE INDEX idx_sales_product_id ON public.sales USING btree (product_id);
 (   DROP INDEX public.idx_sales_product_id;
       public                 postgres    false    230            �           2620    16642 *   orders trigger_calculate_order_total_price    TRIGGER     �   CREATE TRIGGER trigger_calculate_order_total_price BEFORE INSERT OR UPDATE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.calculate_order_total_price();
 C   DROP TRIGGER trigger_calculate_order_total_price ON public.orders;
       public               postgres    false    228    231            �           2620    16643 (   sales trigger_calculate_sale_total_price    TRIGGER     �   CREATE TRIGGER trigger_calculate_sale_total_price BEFORE INSERT OR UPDATE ON public.sales FOR EACH ROW EXECUTE FUNCTION public.calculate_sale_total_price();
 A   DROP TRIGGER trigger_calculate_sale_total_price ON public.sales;
       public               postgres    false    230    232            �           2606    16621    orders orders_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_product_id_fkey;
       public               postgres    false    228    4751    226            �           2606    16602 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public               postgres    false    226    4747    224            �           2606    16607 "   products products_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_supplier_id_fkey;
       public               postgres    false    222    226    4745            �           2606    16635    sales sales_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_product_id_fkey;
       public               postgres    false    226    4751    230            4   �   x���A�0�u{
.@Ô�*��IXv�ܱ0!�R�v�"���$�eHኄ����9�v�[z�f���C�Ge�r�yYd*�+WhO^[�3G�O�V߭Gܑd��T�`�Mt2��)#_�xg!v��Z��,`�y�'ɴ�k���(ad�      8   J   x�M���0�7��aHڒY��R��������FoamZU�dj�Xk�Cpr��!�����:���n�      6   T  x�uR�MC1<��x��]���EPA. Q) �DP4��8�1A!=�;b�(�|x�H~���̘"蛮tS睾뢎u�0� f ��ȱ�d�#*�%F�r�At4 }6�F?m_�h�16� ��r�A_����ֲ�w��Z�Xj@r�9��#���v� �T�u��:�����@�>�Y,���f�8���V�˫�`W�$�c5\0��/I�9��N�q���·� gm�%$�$D�A��;P��������O�����^�W�K;��O^��ѝc<�lw�l��KA)�<��8{1�F?3��z���TB�7*X�w{g;;�����C1O%x� n�s?����      :   K   x�M���0�3��aȧd��?G���Ⱦ������B/a�4[�L�k��}�'������":�����      2   X   x�3�.-(��L-Rp�L��+IL.q(�
%�%��r���(�[�Y�q!t;a�N"����Cw2!�1z\\\  #5>      .      x������ � �      0      x������ � �     