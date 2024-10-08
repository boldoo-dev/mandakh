PGDMP                         {            nom_    15.4    15.4     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    49428    nom_    DATABASE        CREATE DATABASE nom_ WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE nom_;
                postgres    false            �            1259    49429    Book    TABLE     )  CREATE TABLE public."Book" (
    bookcode character varying NOT NULL,
    bookname character varying,
    author character varying,
    tcode character varying,
    dtcode character varying,
    bindex character varying,
    page integer,
    bookprice character varying,
    bookcount integer
);
    DROP TABLE public."Book";
       public         heap    postgres    false            �            1259    49434    Bookgive    TABLE     �   CREATE TABLE public."Bookgive" (
    bookcode character varying NOT NULL,
    bookname character varying,
    enterognoo date,
    retognoo date,
    libcode character varying,
    stcode character varying
);
    DROP TABLE public."Bookgive";
       public         heap    postgres    false            �            1259    49439    DedTorol    TABLE     h   CREATE TABLE public."DedTorol" (
    dtcode character varying NOT NULL,
    dtname character varying
);
    DROP TABLE public."DedTorol";
       public         heap    postgres    false            �            1259    49444 	   Librarian    TABLE     �   CREATE TABLE public."Librarian" (
    libcode character varying NOT NULL,
    liblast character varying,
    libname character varying,
    phone character varying,
    address character varying
);
    DROP TABLE public."Librarian";
       public         heap    postgres    false            �            1259    49449    Mergejil    TABLE     f   CREATE TABLE public."Mergejil" (
    mcode character varying NOT NULL,
    mname character varying
);
    DROP TABLE public."Mergejil";
       public         heap    postgres    false            �            1259    49454    Student    TABLE     �   CREATE TABLE public."Student" (
    stcode character varying NOT NULL,
    stlast character varying,
    stname character varying,
    regdug character varying,
    mcode character varying,
    phone character varying,
    "Ognoo" date
);
    DROP TABLE public."Student";
       public         heap    postgres    false            �            1259    49459    Torol    TABLE     c   CREATE TABLE public."Torol" (
    tcode character varying NOT NULL,
    tname character varying
);
    DROP TABLE public."Torol";
       public         heap    postgres    false                      0    49429    Book 
   TABLE DATA           o   COPY public."Book" (bookcode, bookname, author, tcode, dtcode, bindex, page, bookprice, bookcount) FROM stdin;
    public          postgres    false    214   $                 0    49434    Bookgive 
   TABLE DATA           _   COPY public."Bookgive" (bookcode, bookname, enterognoo, retognoo, libcode, stcode) FROM stdin;
    public          postgres    false    215   &                  0    49439    DedTorol 
   TABLE DATA           4   COPY public."DedTorol" (dtcode, dtname) FROM stdin;
    public          postgres    false    216   �'       !          0    49444 	   Librarian 
   TABLE DATA           P   COPY public."Librarian" (libcode, liblast, libname, phone, address) FROM stdin;
    public          postgres    false    217   <(       "          0    49449    Mergejil 
   TABLE DATA           2   COPY public."Mergejil" (mcode, mname) FROM stdin;
    public          postgres    false    218   K)       #          0    49454    Student 
   TABLE DATA           Z   COPY public."Student" (stcode, stlast, stname, regdug, mcode, phone, "Ognoo") FROM stdin;
    public          postgres    false    219   �)       $          0    49459    Torol 
   TABLE DATA           /   COPY public."Torol" (tcode, tname) FROM stdin;
    public          postgres    false    220   m+       }           2606    49465    Book Book_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (bookcode);
 <   ALTER TABLE ONLY public."Book" DROP CONSTRAINT "Book_pkey";
       public            postgres    false    214                       2606    49467    Bookgive Bookgive_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Bookgive"
    ADD CONSTRAINT "Bookgive_pkey" PRIMARY KEY (bookcode);
 D   ALTER TABLE ONLY public."Bookgive" DROP CONSTRAINT "Bookgive_pkey";
       public            postgres    false    215            �           2606    49469    DedTorol DedTorol_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."DedTorol"
    ADD CONSTRAINT "DedTorol_pkey" PRIMARY KEY (dtcode);
 D   ALTER TABLE ONLY public."DedTorol" DROP CONSTRAINT "DedTorol_pkey";
       public            postgres    false    216            �           2606    49471    Librarian Librarian_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Librarian"
    ADD CONSTRAINT "Librarian_pkey" PRIMARY KEY (libcode);
 F   ALTER TABLE ONLY public."Librarian" DROP CONSTRAINT "Librarian_pkey";
       public            postgres    false    217            �           2606    49473    Mergejil Mergejil_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Mergejil"
    ADD CONSTRAINT "Mergejil_pkey" PRIMARY KEY (mcode);
 D   ALTER TABLE ONLY public."Mergejil" DROP CONSTRAINT "Mergejil_pkey";
       public            postgres    false    218            �           2606    49475    Student Student_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (stcode);
 B   ALTER TABLE ONLY public."Student" DROP CONSTRAINT "Student_pkey";
       public            postgres    false    219            �           2606    49477    Torol Torol_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."Torol"
    ADD CONSTRAINT "Torol_pkey" PRIMARY KEY (tcode);
 >   ALTER TABLE ONLY public."Torol" DROP CONSTRAINT "Torol_pkey";
       public            postgres    false    220            �           2606    49478    Book Book_dtcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_dtcode_fkey" FOREIGN KEY (dtcode) REFERENCES public."DedTorol"(dtcode) NOT VALID;
 C   ALTER TABLE ONLY public."Book" DROP CONSTRAINT "Book_dtcode_fkey";
       public          postgres    false    3201    214    216            �           2606    49483    Book Book_tcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_tcode_fkey" FOREIGN KEY (tcode) REFERENCES public."Torol"(tcode) NOT VALID;
 B   ALTER TABLE ONLY public."Book" DROP CONSTRAINT "Book_tcode_fkey";
       public          postgres    false    220    214    3209            �           2606    49488    Bookgive Bookgive_bookcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bookgive"
    ADD CONSTRAINT "Bookgive_bookcode_fkey" FOREIGN KEY (bookcode) REFERENCES public."Book"(bookcode);
 M   ALTER TABLE ONLY public."Bookgive" DROP CONSTRAINT "Bookgive_bookcode_fkey";
       public          postgres    false    214    3197    215            �           2606    49493    Bookgive Bookgive_libcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bookgive"
    ADD CONSTRAINT "Bookgive_libcode_fkey" FOREIGN KEY (libcode) REFERENCES public."Librarian"(libcode) NOT VALID;
 L   ALTER TABLE ONLY public."Bookgive" DROP CONSTRAINT "Bookgive_libcode_fkey";
       public          postgres    false    215    217    3203            �           2606    49498    Bookgive Bookgive_stcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bookgive"
    ADD CONSTRAINT "Bookgive_stcode_fkey" FOREIGN KEY (stcode) REFERENCES public."Student"(stcode) NOT VALID;
 K   ALTER TABLE ONLY public."Bookgive" DROP CONSTRAINT "Bookgive_stcode_fkey";
       public          postgres    false    215    219    3207            �           2606    49503    Student Student_mcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_mcode_fkey" FOREIGN KEY (mcode) REFERENCES public."Mergejil"(mcode);
 H   ALTER TABLE ONLY public."Student" DROP CONSTRAINT "Student_mcode_fkey";
       public          postgres    false    218    3205    219               �  x�m��n�@E�o�b~������K�X���q"*��B��J�"6D"�T�vՔ��6q��M�C�;�.,όޜ������@���=׼�W�L���+���oxe�I��ʼ�ْx�ٞq�=7c�������}ϧ����#�(� ˔������g�s^�ڜ��i��aRO���(R(��,��t�?���X���Z1]�5űvR�ف��0t�k���F��T,�-�,�K[���ZI��X�*�8!�>5cȁ2��w�]�	6����Ϛ$��e�NȇC?J�N�ãg=����Kɿ����o�Dry{�]�}iMQq��>��(T +G}\dϵ��zi�q-�1.�w�\����#*����|m��(i��.�9n����֏m�<������6CLH�!�=-��դţ�|���8]���&�����ث�)��^C<��(�* ��۽c��_:-bĞ���F�iG�	�r|         �  x�uR�N�@��_q?`�w�9Ii�HH�A�Ic"��"U���t$h$CH�a/_��َih�V�����z] %��8��	.pf��@hP�W�צ*�"V����M �5��@�!��I;�W8g@� �.q Z1cxͣ$!�O��{i�t/�$�W���|mw�]���P2��&F�7!��f7I4��;�߷���J{���}�����0��<P�!~���3\J��$~K�C��Մ2�1W�+�U�.�vz�
����NX�|&_diN�#i����h�M�&�Ҝ�Z��>���sJ�q"yPL���*��Q������ИP������PJC����`���}V��^�B�-��_��2�7��2MR���@��1�b#h�Z���m⭽n��:�U�V�A;_�Z����y���E          o   x�=M�	�0���Nd#�J��I�V�r �g��D>-�㾦Tp��l�q�+�0G�Qѣ����MĆ��Ϸl�U�����5v\b��T�
�te�� b�=�G@      !   �   x�mQ�JA<�|�~@w��u���ce�K1�ɀH�[6��~CM�!�#&��4�tUWWum	��a���@���':t����BT��.����7y��^P�!0;��G�%³mdʎ�ʷ��R�)��Ѽ���3�H��WҔu.{G���M�[��;�aB��~�_�ǉl�G�h�<qM�r�!�f|^�O`���"����Z*�R��Rv�Ð�?rщ��iT��$�Q�1�ҕ��&��J[^e�/�1��F��      "   X   x�K��0���u/L������/�P��z���n��r��/,�rL���sa!Wj6'���^�pa���K�/�W��,������� �-7�      #   �  x�m��jA��wQ���+i\�H�.�
�I�V�I:a�I� "5��0��3�Ѿ�ϝ�d.fٽ�~��Y�h�'����dSF$7eRFe"��'\�$�ʯ��X;t��rN)F����&���+���r)���vQ9��q��Æ��2o�Sz�io�����<T�G�}
^e|rF�O~�`�$��)�|@q�E���n��g�Y������b�ИW�3��~�U����[��r#kYv�)����P�H	��=��e+jС �VZm��G�Lo�􌒚%�v�\�9��6�+ ݟ���h��v�}ʡCxgOV��,7��1U.�4ҩ�u�l��+���܈=�r��<�=��=��')�#���U����nn��e��?�JT@��Bԭ����^�6      $   |   x�u�=
�P뷧�Od'iD���!�k[k!!�O�/���\�6|��̬6�+=;Ym��#�&����e�E�9�^�N�gI�Y���8jl�VW(��V�ۑr9\\�HD���$��DD�L�\R     