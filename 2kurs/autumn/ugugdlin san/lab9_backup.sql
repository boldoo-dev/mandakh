PGDMP         7    
            {            lab9    15.4    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16550    lab9    DATABASE        CREATE DATABASE lab9 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE lab9;
                postgres    false            �            1259    16558    branch    TABLE     D   CREATE TABLE public.branch (
    id text NOT NULL,
    name text
);
    DROP TABLE public.branch;
       public         heap    postgres    false            �            1259    16565    food    TABLE     S   CREATE TABLE public.food (
    id text NOT NULL,
    name text,
    une integer
);
    DROP TABLE public.food;
       public         heap    postgres    false            �            1259    16596    paid    TABLE     b   CREATE TABLE public.paid (
    id text NOT NULL,
    worker_id text NOT NULL,
    paid integer
);
    DROP TABLE public.paid;
       public         heap    postgres    false            �            1259    16572 	   tbl_order    TABLE     g   CREATE TABLE public.tbl_order (
    id text NOT NULL,
    food_id text NOT NULL,
    hemjee integer
);
    DROP TABLE public.tbl_order;
       public         heap    postgres    false            �            1259    16584    worker    TABLE     a   CREATE TABLE public.worker (
    id text NOT NULL,
    name text,
    branch_id text NOT NULL
);
    DROP TABLE public.worker;
       public         heap    postgres    false                      0    16558    branch 
   TABLE DATA           *   COPY public.branch (id, name) FROM stdin;
    public          postgres    false    214   e                 0    16565    food 
   TABLE DATA           -   COPY public.food (id, name, une) FROM stdin;
    public          postgres    false    215   �                 0    16596    paid 
   TABLE DATA           3   COPY public.paid (id, worker_id, paid) FROM stdin;
    public          postgres    false    218                    0    16572 	   tbl_order 
   TABLE DATA           8   COPY public.tbl_order (id, food_id, hemjee) FROM stdin;
    public          postgres    false    216   O                 0    16584    worker 
   TABLE DATA           5   COPY public.worker (id, name, branch_id) FROM stdin;
    public          postgres    false    217   �       u           2606    16564    branch branch_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.branch DROP CONSTRAINT branch_pkey;
       public            postgres    false    214            w           2606    16571    food food_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.food DROP CONSTRAINT food_pkey;
       public            postgres    false    215            }           2606    16602    paid paid_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.paid
    ADD CONSTRAINT paid_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.paid DROP CONSTRAINT paid_pkey;
       public            postgres    false    218            y           2606    16578    tbl_order tbl_order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tbl_order
    ADD CONSTRAINT tbl_order_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tbl_order DROP CONSTRAINT tbl_order_pkey;
       public            postgres    false    216            {           2606    16590    worker worker_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_pkey;
       public            postgres    false    217                       2606    16591    worker fk_branch    FK CONSTRAINT     r   ALTER TABLE ONLY public.worker
    ADD CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES public.branch(id);
 :   ALTER TABLE ONLY public.worker DROP CONSTRAINT fk_branch;
       public          postgres    false    214    217    3189            ~           2606    16579    tbl_order fk_food    FK CONSTRAINT     o   ALTER TABLE ONLY public.tbl_order
    ADD CONSTRAINT fk_food FOREIGN KEY (food_id) REFERENCES public.food(id);
 ;   ALTER TABLE ONLY public.tbl_order DROP CONSTRAINT fk_food;
       public          postgres    false    215    3191    216            �           2606    16603    paid fk_worker    FK CONSTRAINT     p   ALTER TABLE ONLY public.paid
    ADD CONSTRAINT fk_worker FOREIGN KEY (worker_id) REFERENCES public.worker(id);
 8   ALTER TABLE ONLY public.paid DROP CONSTRAINT fk_worker;
       public          postgres    false    3195    217    218               7   x�+6估�b�.츰S�P�bÅ���}@ֆ{���P�a*����� ��+c         R   x�K340�0�{/v\l�;.v\^ya7����W���!�e�/켰	�*�(&���"�:(��b���D� ��'�         1   x�32042402�700�,b# �2B��8MMQ���T��qqq �L         0   x�32042402�700�L3F\F1c�4 ��Y��ΐ+F��� ��c         F   x�+70�0�.6q���K�/��,6�*70ˀ�/l�,6�s^�ra�ņ�.컰$���� ,"l     