PGDMP  +                    |            lab6    16.2    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16396    lab6    DATABASE        CREATE DATABASE lab6 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE lab6;
                postgres    false            �            1259    16398    salbar    TABLE     Z   CREATE TABLE public.salbar (
    sid integer NOT NULL,
    sname character varying(50)
);
    DROP TABLE public.salbar;
       public         heap    postgres    false            �            1259    16397    salbar_sid_seq    SEQUENCE     �   CREATE SEQUENCE public.salbar_sid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.salbar_sid_seq;
       public          postgres    false    216            �           0    0    salbar_sid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.salbar_sid_seq OWNED BY public.salbar.sid;
          public          postgres    false    215            �            1259    16407    workers    TABLE     m   CREATE TABLE public.workers (
    wid integer NOT NULL,
    wname character varying(50),
    bid smallint
);
    DROP TABLE public.workers;
       public         heap    postgres    false            �            1259    16406    workers_wid_seq    SEQUENCE     �   CREATE SEQUENCE public.workers_wid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.workers_wid_seq;
       public          postgres    false    218            �           0    0    workers_wid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.workers_wid_seq OWNED BY public.workers.wid;
          public          postgres    false    217                       2604    16401 
   salbar sid    DEFAULT     h   ALTER TABLE ONLY public.salbar ALTER COLUMN sid SET DEFAULT nextval('public.salbar_sid_seq'::regclass);
 9   ALTER TABLE public.salbar ALTER COLUMN sid DROP DEFAULT;
       public          postgres    false    216    215    216                        2604    16410    workers wid    DEFAULT     j   ALTER TABLE ONLY public.workers ALTER COLUMN wid SET DEFAULT nextval('public.workers_wid_seq'::regclass);
 :   ALTER TABLE public.workers ALTER COLUMN wid DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    16398    salbar 
   TABLE DATA           ,   COPY public.salbar (sid, sname) FROM stdin;
    public          postgres    false    216   �       �          0    16407    workers 
   TABLE DATA           2   COPY public.workers (wid, wname, bid) FROM stdin;
    public          postgres    false    218   �       �           0    0    salbar_sid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.salbar_sid_seq', 2, true);
          public          postgres    false    215            �           0    0    workers_wid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.workers_wid_seq', 2, true);
          public          postgres    false    217            "           2606    16405    salbar salbar_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.salbar
    ADD CONSTRAINT salbar_pkey PRIMARY KEY (sid);
 <   ALTER TABLE ONLY public.salbar DROP CONSTRAINT salbar_pkey;
       public            postgres    false    216            $           2606    16412    workers workers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (wid);
 >   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_pkey;
       public            postgres    false    218            %           2606    16413    workers workers_bid_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_bid_fkey FOREIGN KEY (bid) REFERENCES public.salbar(sid);
 B   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_bid_fkey;
       public          postgres    false    216    218    4642            �   2   x�3�0��[/l��W�b#��}a#H�ˈ�¢�+/lB����� ���      �   2   x�' ��1	Давка	2
2	Одонхүү	1
\.


�T|     