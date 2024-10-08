PGDMP     6    8    
            {            lab13_14    15.4    15.4     &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    24661    lab13_14    DATABASE     �   CREATE DATABASE lab13_14 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE lab13_14;
                postgres    false            �            1259    24710    book    TABLE     -  CREATE TABLE public.book (
    bookcode character varying(20) NOT NULL,
    bookname character varying(255),
    author character varying(255),
    bindex character varying(255),
    page character varying(255),
    tcode character varying(255) NOT NULL,
    dtcode character varying(255) NOT NULL
);
    DROP TABLE public.book;
       public         heap    postgres    false            �            1259    24769    bookgive    TABLE     �   CREATE TABLE public.bookgive (
    bcode character varying NOT NULL,
    bname character varying,
    enterognoo character varying,
    retognoo character varying,
    libcode character varying NOT NULL,
    stcode character varying NOT NULL
);
    DROP TABLE public.bookgive;
       public         heap    postgres    false            �            1259    24678    dedtorol    TABLE     o   CREATE TABLE public.dedtorol (
    dtcode character varying(20) NOT NULL,
    dtname character varying(255)
);
    DROP TABLE public.dedtorol;
       public         heap    postgres    false            �            1259    24747 	   librarian    TABLE     �   CREATE TABLE public.librarian (
    lcode character varying NOT NULL,
    llast character varying(255),
    lname character varying(255),
    lphone character varying(255),
    address character varying(255)
);
    DROP TABLE public.librarian;
       public         heap    postgres    false            �            1259    24668    mergejil    TABLE     l   CREATE TABLE public.mergejil (
    mcode character varying(20) NOT NULL,
    mname character varying(55)
);
    DROP TABLE public.mergejil;
       public         heap    postgres    false            �            1259    24688    student    TABLE       CREATE TABLE public.student (
    stcode character varying(20) NOT NULL,
    stlast character varying(55),
    stname character varying(55),
    regdug character varying(55),
    mcode character varying(55) NOT NULL,
    phone character varying(55),
    ognoo character varying(55)
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    24683    torol    TABLE     j   CREATE TABLE public.torol (
    tcode character varying(20) NOT NULL,
    tname character varying(255)
);
    DROP TABLE public.torol;
       public         heap    postgres    false            !          0    24710    book 
   TABLE DATA           W   COPY public.book (bookcode, bookname, author, bindex, page, tcode, dtcode) FROM stdin;
    public          postgres    false    218   	"       #          0    24769    bookgive 
   TABLE DATA           W   COPY public.bookgive (bcode, bname, enterognoo, retognoo, libcode, stcode) FROM stdin;
    public          postgres    false    220   �"                 0    24678    dedtorol 
   TABLE DATA           2   COPY public.dedtorol (dtcode, dtname) FROM stdin;
    public          postgres    false    215   V#       "          0    24747 	   librarian 
   TABLE DATA           I   COPY public.librarian (lcode, llast, lname, lphone, address) FROM stdin;
    public          postgres    false    219   �#                 0    24668    mergejil 
   TABLE DATA           0   COPY public.mergejil (mcode, mname) FROM stdin;
    public          postgres    false    214   $                  0    24688    student 
   TABLE DATA           V   COPY public.student (stcode, stlast, stname, regdug, mcode, phone, ognoo) FROM stdin;
    public          postgres    false    217   [$                 0    24683    torol 
   TABLE DATA           -   COPY public.torol (tcode, tname) FROM stdin;
    public          postgres    false    216   %       �           2606    24716    book book_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (bookcode);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    218            �           2606    24775    bookgive bookgive_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.bookgive
    ADD CONSTRAINT bookgive_pkey PRIMARY KEY (bcode);
 @   ALTER TABLE ONLY public.bookgive DROP CONSTRAINT bookgive_pkey;
       public            postgres    false    220                       2606    24682    dedtorol dedtorol_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.dedtorol
    ADD CONSTRAINT dedtorol_pkey PRIMARY KEY (dtcode);
 @   ALTER TABLE ONLY public.dedtorol DROP CONSTRAINT dedtorol_pkey;
       public            postgres    false    215            �           2606    24755    librarian librarian_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.librarian
    ADD CONSTRAINT librarian_pkey PRIMARY KEY (lcode);
 B   ALTER TABLE ONLY public.librarian DROP CONSTRAINT librarian_pkey;
       public            postgres    false    219            }           2606    24672    mergejil mergejil_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.mergejil
    ADD CONSTRAINT mergejil_pkey PRIMARY KEY (mcode);
 @   ALTER TABLE ONLY public.mergejil DROP CONSTRAINT mergejil_pkey;
       public            postgres    false    214            �           2606    24692    student student_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (stcode);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            postgres    false    217            �           2606    24687    torol torol_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.torol
    ADD CONSTRAINT torol_pkey PRIMARY KEY (tcode);
 :   ALTER TABLE ONLY public.torol DROP CONSTRAINT torol_pkey;
       public            postgres    false    216            �           2606    24776    bookgive bookgive_libcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookgive
    ADD CONSTRAINT bookgive_libcode_fkey FOREIGN KEY (libcode) REFERENCES public.librarian(lcode);
 H   ALTER TABLE ONLY public.bookgive DROP CONSTRAINT bookgive_libcode_fkey;
       public          postgres    false    220    219    3207            �           2606    24781    bookgive bookgive_stcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookgive
    ADD CONSTRAINT bookgive_stcode_fkey FOREIGN KEY (stcode) REFERENCES public.student(stcode);
 G   ALTER TABLE ONLY public.bookgive DROP CONSTRAINT bookgive_stcode_fkey;
       public          postgres    false    217    3203    220            �           2606    24742    book fk_dtcode    FK CONSTRAINT     s   ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_dtcode FOREIGN KEY (dtcode) REFERENCES public.dedtorol(dtcode);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT fk_dtcode;
       public          postgres    false    3199    215    218            �           2606    24737    book fk_tcode    FK CONSTRAINT     m   ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_tcode FOREIGN KEY (tcode) REFERENCES public.torol(tcode);
 7   ALTER TABLE ONLY public.book DROP CONSTRAINT fk_tcode;
       public          postgres    false    3201    216    218            �           2606    24693    student student_mcode_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_mcode_fkey FOREIGN KEY (mcode) REFERENCES public.mergejil(mcode);
 D   ALTER TABLE ONLY public.student DROP CONSTRAINT student_mcode_fkey;
       public          postgres    false    217    3197    214            !   �   x�-�1�0����� ��tp�����*�+�E�&N&,p 0cz����Wpk����nLb�҄
VN->�]�N��ZW��7�ѡ���HT��kE��Ĉmn2�"�_�ҝ�/\�����pѰӱ�`k�EjMQ�蘓�J3T34�����ů��c�5�%�����܅B��$e�      #      x�.O�700�0�¾{.�^��p�������^N}C}#CNK�ш38��������591�������/LT�����[��9M`�M��9�Q��b�g`�k`��`h g�������� j6?j         >   x�KL�0���.���������9/̺������@����6_�d�r��qqq K��      "   [   x�s4�0�¾�/lἼHm����NNssSS���S��@��8/L��T��b�ņ{.l������������d:Pq� P�,         <   x�sL�0���u/̹��+�����K�R���.콰���;.�^콰�+F��� ZR~          �   x�]�1
�@��z�0f&�&�e������1�]���F�R�B��3z!7QA,|�iB��h��\qɕd�3)$��K����^8MHԎ �s�Ʊ1@P"i�6!�R&|����0�_1���׼s�Zמ�Ͻ9���7m��KƧ&�R�^=�$���E����t κ?��RJ� �s`�         d   x�KM漰�;.켰W���.6^�pa�΅�6^�ȕ��ya���Xv��V��}vs�s^�d����b�ž�M��A���T���+F��� �?%     