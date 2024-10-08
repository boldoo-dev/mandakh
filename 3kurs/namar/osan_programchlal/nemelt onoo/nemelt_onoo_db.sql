PGDMP                      |            osan_z    16.2    16.0 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41227    osan_z    DATABASE     �   CREATE DATABASE osan_z WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE osan_z;
                postgres    false            �            1259    57663 	   t_comment    TABLE     �   CREATE TABLE public.t_comment (
    cid bigint NOT NULL,
    cname character varying(2500),
    pid bigint,
    mid bigint,
    rating smallint
);
    DROP TABLE public.t_comment;
       public         heap    postgres    false            �            1259    57662    t_comment_cid_seq    SEQUENCE     �   ALTER TABLE public.t_comment ALTER COLUMN cid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_comment_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    41237    t_movie    TABLE     �   CREATE TABLE public.t_movie (
    mid bigint NOT NULL,
    mtitle character varying(255),
    mtagline character varying(255),
    mreleased bigint
);
    DROP TABLE public.t_movie;
       public         heap    postgres    false            �            1259    41236    t_movie_mid_seq    SEQUENCE     �   ALTER TABLE public.t_movie ALTER COLUMN mid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_movie_mid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    41229    t_person    TABLE     ~   CREATE TABLE public.t_person (
    pid bigint NOT NULL,
    pname character varying(255),
    pborn character varying(255)
);
    DROP TABLE public.t_person;
       public         heap    postgres    false            �            1259    41261    t_person_movie    TABLE     q   CREATE TABLE public.t_person_movie (
    pmid bigint NOT NULL,
    mid bigint,
    pid bigint,
    rid bigint
);
 "   DROP TABLE public.t_person_movie;
       public         heap    postgres    false            �            1259    41260    t_person_movie_pmid_seq    SEQUENCE     �   ALTER TABLE public.t_person_movie ALTER COLUMN pmid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_person_movie_pmid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    41228    t_person_pid_seq    SEQUENCE     �   ALTER TABLE public.t_person ALTER COLUMN pid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_person_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    57644    t_person_to_person    TABLE     w   CREATE TABLE public.t_person_to_person (
    ppid bigint NOT NULL,
    p1id bigint,
    p2id bigint,
    rid bigint
);
 &   DROP TABLE public.t_person_to_person;
       public         heap    postgres    false            �            1259    57673    t_person_to_person_ppid_seq    SEQUENCE     �   ALTER TABLE public.t_person_to_person ALTER COLUMN ppid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_person_to_person_ppid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    41250    t_relationship    TABLE     b   CREATE TABLE public.t_relationship (
    rid bigint NOT NULL,
    rname character varying(255)
);
 "   DROP TABLE public.t_relationship;
       public         heap    postgres    false            �            1259    41249    t_relationship_rid_seq    SEQUENCE     �   ALTER TABLE public.t_relationship ALTER COLUMN rid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.t_relationship_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �          0    57663 	   t_comment 
   TABLE DATA           A   COPY public.t_comment (cid, cname, pid, mid, rating) FROM stdin;
    public          postgres    false    225   !1       �          0    41237    t_movie 
   TABLE DATA           C   COPY public.t_movie (mid, mtitle, mtagline, mreleased) FROM stdin;
    public          postgres    false    218   �1       �          0    41229    t_person 
   TABLE DATA           5   COPY public.t_person (pid, pname, pborn) FROM stdin;
    public          postgres    false    216   )3       �          0    41261    t_person_movie 
   TABLE DATA           =   COPY public.t_person_movie (pmid, mid, pid, rid) FROM stdin;
    public          postgres    false    222   4       �          0    57644    t_person_to_person 
   TABLE DATA           C   COPY public.t_person_to_person (ppid, p1id, p2id, rid) FROM stdin;
    public          postgres    false    223   k4       �          0    41250    t_relationship 
   TABLE DATA           4   COPY public.t_relationship (rid, rname) FROM stdin;
    public          postgres    false    220   �4       �           0    0    t_comment_cid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.t_comment_cid_seq', 4, true);
          public          postgres    false    224            �           0    0    t_movie_mid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.t_movie_mid_seq', 10, true);
          public          postgres    false    217            �           0    0    t_person_movie_pmid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.t_person_movie_pmid_seq', 30, true);
          public          postgres    false    221            �           0    0    t_person_pid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.t_person_pid_seq', 12, true);
          public          postgres    false    215            �           0    0    t_person_to_person_ppid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.t_person_to_person_ppid_seq', 1, true);
          public          postgres    false    226            �           0    0    t_relationship_rid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.t_relationship_rid_seq', 7, true);
          public          postgres    false    219            >           2606    57675    t_comment t_comment_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.t_comment
    ADD CONSTRAINT t_comment_pkey PRIMARY KEY (cid);
 B   ALTER TABLE ONLY public.t_comment DROP CONSTRAINT t_comment_pkey;
       public            postgres    false    225            6           2606    41243    t_movie t_movie_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.t_movie
    ADD CONSTRAINT t_movie_pkey PRIMARY KEY (mid);
 >   ALTER TABLE ONLY public.t_movie DROP CONSTRAINT t_movie_pkey;
       public            postgres    false    218            :           2606    41265 "   t_person_movie t_person_movie_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.t_person_movie
    ADD CONSTRAINT t_person_movie_pkey PRIMARY KEY (pmid);
 L   ALTER TABLE ONLY public.t_person_movie DROP CONSTRAINT t_person_movie_pkey;
       public            postgres    false    222            4           2606    41235    t_person t_person_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.t_person
    ADD CONSTRAINT t_person_pkey PRIMARY KEY (pid);
 @   ALTER TABLE ONLY public.t_person DROP CONSTRAINT t_person_pkey;
       public            postgres    false    216            <           2606    57677 *   t_person_to_person t_person_to_person_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.t_person_to_person
    ADD CONSTRAINT t_person_to_person_pkey PRIMARY KEY (ppid);
 T   ALTER TABLE ONLY public.t_person_to_person DROP CONSTRAINT t_person_to_person_pkey;
       public            postgres    false    223            8           2606    41254 "   t_relationship t_relationship_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.t_relationship
    ADD CONSTRAINT t_relationship_pkey PRIMARY KEY (rid);
 L   ALTER TABLE ONLY public.t_relationship DROP CONSTRAINT t_relationship_pkey;
       public            postgres    false    220            E           2606    57685    t_comment t_comment_mid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_comment
    ADD CONSTRAINT t_comment_mid_fkey FOREIGN KEY (mid) REFERENCES public.t_movie(mid) NOT VALID;
 F   ALTER TABLE ONLY public.t_comment DROP CONSTRAINT t_comment_mid_fkey;
       public          postgres    false    4662    225    218            F           2606    57668    t_comment t_comment_pid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.t_comment
    ADD CONSTRAINT t_comment_pid_fkey FOREIGN KEY (pid) REFERENCES public.t_person(pid);
 F   ALTER TABLE ONLY public.t_comment DROP CONSTRAINT t_comment_pid_fkey;
       public          postgres    false    216    4660    225            ?           2606    41266 &   t_person_movie t_person_movie_mid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_person_movie
    ADD CONSTRAINT t_person_movie_mid_fkey FOREIGN KEY (mid) REFERENCES public.t_movie(mid);
 P   ALTER TABLE ONLY public.t_person_movie DROP CONSTRAINT t_person_movie_mid_fkey;
       public          postgres    false    4662    222    218            @           2606    41271 &   t_person_movie t_person_movie_pid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_person_movie
    ADD CONSTRAINT t_person_movie_pid_fkey FOREIGN KEY (pid) REFERENCES public.t_person(pid);
 P   ALTER TABLE ONLY public.t_person_movie DROP CONSTRAINT t_person_movie_pid_fkey;
       public          postgres    false    222    216    4660            A           2606    41276 &   t_person_movie t_person_movie_rid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_person_movie
    ADD CONSTRAINT t_person_movie_rid_fkey FOREIGN KEY (rid) REFERENCES public.t_relationship(rid);
 P   ALTER TABLE ONLY public.t_person_movie DROP CONSTRAINT t_person_movie_rid_fkey;
       public          postgres    false    4664    220    222            B           2606    57647 /   t_person_to_person t_person_to_person_p1id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_person_to_person
    ADD CONSTRAINT t_person_to_person_p1id_fkey FOREIGN KEY (p1id) REFERENCES public.t_person(pid);
 Y   ALTER TABLE ONLY public.t_person_to_person DROP CONSTRAINT t_person_to_person_p1id_fkey;
       public          postgres    false    216    4660    223            C           2606    57652 /   t_person_to_person t_person_to_person_p2id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_person_to_person
    ADD CONSTRAINT t_person_to_person_p2id_fkey FOREIGN KEY (p2id) REFERENCES public.t_person(pid);
 Y   ALTER TABLE ONLY public.t_person_to_person DROP CONSTRAINT t_person_to_person_p2id_fkey;
       public          postgres    false    216    4660    223            D           2606    57657 .   t_person_to_person t_person_to_person_rid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_person_to_person
    ADD CONSTRAINT t_person_to_person_rid_fkey FOREIGN KEY (rid) REFERENCES public.t_relationship(rid);
 X   ALTER TABLE ONLY public.t_person_to_person DROP CONSTRAINT t_person_to_person_rid_fkey;
       public          postgres    false    4664    223    220            �   �   x�U���@D�v["H�f���h�E��FKRØ��E@O���x
�f�'����:x��O�R��JK�9��3O�ٞ�ftv�_x[���J���eČ�0��=l���+�HE�K�i��@y@�#��:ܲ#%^j�4�]��O'x�      �   T  x��Q�n1<'_���UGZT聪��C�l�l�J�<��ޅSO�Y�g<3�W�	���y�T�9p���t��~��np���1S�^o��jC�X�/^�`$��,�����R�	bb)��=A��!��"A��@d�lh'�Y}�a�A kJ�E�Z�lL��ٜ�,kK>�^�䬧L�g���y��1�jŵ�]�(�U�����0�}��kL�^���i��H}sݑ�%'�Y���-�D�0�����V��Lb��6��#�EM����M.����L ,%����!߯Mն��`�G
�S=So�g�uY5m�e��=�YX��\UX|�z�i��V��      �   �   x�U��jA���)�-��zYJu�*E)x���I��Q������G8�����&ډ�%�[�5V�����3�L����F��4-ְ3���"5���D�BK�S
*p���t1:߽^�4��!xyzS�X�E_a5Z�LK���B���ѷ������
�KnR��{ī/�t�~����$����(S~)G����J,      �   W   x���� �w<L�C�t��?Gm��Nv�� �ె��k��)䈊��6��e��=��cl�]mI'�"�����zě���Y�      �      x�3�4�4�4����� �      �   J   x�3��q�2��w	uvu�2�r�t2M8�C\]�=��L9]<�\A<.3N7��`.s8+F��� ���     