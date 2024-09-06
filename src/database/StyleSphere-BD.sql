PGDMP                      |            StyleSphere_BD    16.3    16.3 M    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25094    StyleSphere_BD    DATABASE     �   CREATE DATABASE "StyleSphere_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
     DROP DATABASE "StyleSphere_BD";
                postgres    false            �            1259    25095    cliente    TABLE     (  CREATE TABLE public.cliente (
    "idCliente" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    "correoElectronico" character varying(100) NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    celular character varying(50)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    25098    cliente_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cliente_idcliente_seq;
       public          postgres    false    215                       0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente."idCliente";
          public          postgres    false    216            �            1259    25099    detallePedido    TABLE     �   CREATE TABLE public."detallePedido" (
    "idDetallePedido" integer NOT NULL,
    "idProducto" integer NOT NULL,
    cantidad integer NOT NULL,
    "idPedido" integer NOT NULL
);
 #   DROP TABLE public."detallePedido";
       public         heap    postgres    false            �            1259    25102 !   detallepedido_iddetallepedido_seq    SEQUENCE     �   CREATE SEQUENCE public.detallepedido_iddetallepedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallepedido_iddetallepedido_seq;
       public          postgres    false    217                       0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.detallepedido_iddetallepedido_seq OWNED BY public."detallePedido"."idDetallePedido";
          public          postgres    false    218            �            1259    25103    favorito    TABLE     �   CREATE TABLE public.favorito (
    "idFavorito" integer NOT NULL,
    "idCliente" integer NOT NULL,
    "idProducto" integer NOT NULL
);
    DROP TABLE public.favorito;
       public         heap    postgres    false            �            1259    25106    favorito_idfavorito_seq    SEQUENCE     �   CREATE SEQUENCE public.favorito_idfavorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.favorito_idfavorito_seq;
       public          postgres    false    219                       0    0    favorito_idfavorito_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.favorito_idfavorito_seq OWNED BY public.favorito."idFavorito";
          public          postgres    false    220            �            1259    25107    pedido    TABLE     '  CREATE TABLE public.pedido (
    "idPedido" integer NOT NULL,
    completado boolean NOT NULL,
    "metodoDePago" boolean NOT NULL,
    "tarifaDeServicio" double precision NOT NULL,
    descuento integer NOT NULL,
    "precioFinal" double precision NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    25110    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    221                       0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido."idPedido";
          public          postgres    false    222            �            1259    25111    producto    TABLE     �  CREATE TABLE public.producto (
    "idProducto" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    precio double precision NOT NULL,
    talle character varying(15) NOT NULL,
    color character varying(50) NOT NULL,
    "cantidadStock" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idTipoProducto" integer NOT NULL,
    "cantidadVentas" integer NOT NULL,
    imagen character varying(200) NOT NULL
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    25114    productos_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.productos_idproducto_seq;
       public          postgres    false    223                       0    0    productos_idproducto_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.productos_idproducto_seq OWNED BY public.producto."idProducto";
          public          postgres    false    224            �            1259    25115    reseña    TABLE     �   CREATE TABLE public."reseña" (
    "idReseña" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idCliente" integer NOT NULL,
    comentario character varying(200) NOT NULL,
    valoracion integer NOT NULL
);
    DROP TABLE public."reseña";
       public         heap    postgres    false            �            1259    25118    reseña_idcomentario_seq    SEQUENCE     �   CREATE SEQUENCE public."reseña_idcomentario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."reseña_idcomentario_seq";
       public          postgres    false    225                       0    0    reseña_idcomentario_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public."reseña_idcomentario_seq" OWNED BY public."reseña"."idReseña";
          public          postgres    false    226            �            1259    25119    tarjeta    TABLE     4  CREATE TABLE public.tarjeta (
    "idTarjeta" integer NOT NULL,
    "nombreDelTitular" character varying(100) NOT NULL,
    "fechaInicioVencimiento" integer NOT NULL,
    "fechaTerminadoVencimiento" integer NOT NULL,
    "numeroDeTarjeta" character varying(100) NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.tarjeta;
       public         heap    postgres    false            �            1259    25122    tarjeta_idtarjeta_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_idtarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tarjeta_idtarjeta_seq;
       public          postgres    false    227                       0    0    tarjeta_idtarjeta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarjeta_idtarjeta_seq OWNED BY public.tarjeta."idTarjeta";
          public          postgres    false    228            �            1259    25123    tienda    TABLE     �  CREATE TABLE public.tienda (
    "idTienda" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(100) NOT NULL,
    "horarioApertura" character varying(50) NOT NULL,
    "horarioClausura" character varying(50) NOT NULL,
    "imagenTienda" character varying(500) NOT NULL,
    "cantidadVentas" numeric NOT NULL,
    marca character varying(50) NOT NULL
);
    DROP TABLE public.tienda;
       public         heap    postgres    false            �            1259    25128    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public          postgres    false    229                       0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda."idTienda";
          public          postgres    false    230            �            1259    25129    tipoproducto    TABLE     �   CREATE TABLE public.tipoproducto (
    "idTipoProducto" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    imagen character varying(200) NOT NULL,
    "cantidadVentas" numeric NOT NULL
);
     DROP TABLE public.tipoproducto;
       public         heap    postgres    false            �            1259    25134    tipoproducto_idTipoProducto_seq    SEQUENCE     �   CREATE SEQUENCE public."tipoproducto_idTipoProducto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."tipoproducto_idTipoProducto_seq";
       public          postgres    false    231                       0    0    tipoproducto_idTipoProducto_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."tipoproducto_idTipoProducto_seq" OWNED BY public.tipoproducto."idTipoProducto";
          public          postgres    false    232            B           2604    25135    cliente idCliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN "idCliente" SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 B   ALTER TABLE public.cliente ALTER COLUMN "idCliente" DROP DEFAULT;
       public          postgres    false    216    215            C           2604    25136    detallePedido idDetallePedido    DEFAULT     �   ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "idDetallePedido" SET DEFAULT nextval('public.detallepedido_iddetallepedido_seq'::regclass);
 P   ALTER TABLE public."detallePedido" ALTER COLUMN "idDetallePedido" DROP DEFAULT;
       public          postgres    false    218    217            D           2604    25137    favorito idFavorito    DEFAULT     |   ALTER TABLE ONLY public.favorito ALTER COLUMN "idFavorito" SET DEFAULT nextval('public.favorito_idfavorito_seq'::regclass);
 D   ALTER TABLE public.favorito ALTER COLUMN "idFavorito" DROP DEFAULT;
       public          postgres    false    220    219            E           2604    25138    pedido idPedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN "idPedido" SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 @   ALTER TABLE public.pedido ALTER COLUMN "idPedido" DROP DEFAULT;
       public          postgres    false    222    221            F           2604    25139    producto idProducto    DEFAULT     }   ALTER TABLE ONLY public.producto ALTER COLUMN "idProducto" SET DEFAULT nextval('public.productos_idproducto_seq'::regclass);
 D   ALTER TABLE public.producto ALTER COLUMN "idProducto" DROP DEFAULT;
       public          postgres    false    224    223            G           2604    25140    reseña idReseña    DEFAULT        ALTER TABLE ONLY public."reseña" ALTER COLUMN "idReseña" SET DEFAULT nextval('public."reseña_idcomentario_seq"'::regclass);
 D   ALTER TABLE public."reseña" ALTER COLUMN "idReseña" DROP DEFAULT;
       public          postgres    false    226    225            H           2604    25141    tarjeta idTarjeta    DEFAULT     x   ALTER TABLE ONLY public.tarjeta ALTER COLUMN "idTarjeta" SET DEFAULT nextval('public.tarjeta_idtarjeta_seq'::regclass);
 B   ALTER TABLE public.tarjeta ALTER COLUMN "idTarjeta" DROP DEFAULT;
       public          postgres    false    228    227            I           2604    25142    tienda idTienda    DEFAULT     t   ALTER TABLE ONLY public.tienda ALTER COLUMN "idTienda" SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 @   ALTER TABLE public.tienda ALTER COLUMN "idTienda" DROP DEFAULT;
       public          postgres    false    230    229            J           2604    25143    tipoproducto idTipoProducto    DEFAULT     �   ALTER TABLE ONLY public.tipoproducto ALTER COLUMN "idTipoProducto" SET DEFAULT nextval('public."tipoproducto_idTipoProducto_seq"'::regclass);
 L   ALTER TABLE public.tipoproducto ALTER COLUMN "idTipoProducto" DROP DEFAULT;
       public          postgres    false    232    231            �          0    25095    cliente 
   TABLE DATA           m   COPY public.cliente ("idCliente", nombre, apellido, "correoElectronico", "contraseña", celular) FROM stdin;
    public          postgres    false    215   �`       �          0    25099    detallePedido 
   TABLE DATA           `   COPY public."detallePedido" ("idDetallePedido", "idProducto", cantidad, "idPedido") FROM stdin;
    public          postgres    false    217   Ja       �          0    25103    favorito 
   TABLE DATA           K   COPY public.favorito ("idFavorito", "idCliente", "idProducto") FROM stdin;
    public          postgres    false    219   ga       �          0    25107    pedido 
   TABLE DATA           �   COPY public.pedido ("idPedido", completado, "metodoDePago", "tarifaDeServicio", descuento, "precioFinal", "idCliente") FROM stdin;
    public          postgres    false    221   �a       �          0    25111    producto 
   TABLE DATA           �   COPY public.producto ("idProducto", nombre, precio, talle, color, "cantidadStock", "idTienda", "idTipoProducto", "cantidadVentas", imagen) FROM stdin;
    public          postgres    false    223   �a                  0    25115    reseña 
   TABLE DATA           a   COPY public."reseña" ("idReseña", "idTienda", "idCliente", comentario, valoracion) FROM stdin;
    public          postgres    false    225   �h                 0    25119    tarjeta 
   TABLE DATA           �   COPY public.tarjeta ("idTarjeta", "nombreDelTitular", "fechaInicioVencimiento", "fechaTerminadoVencimiento", "numeroDeTarjeta", "idCliente") FROM stdin;
    public          postgres    false    227   �h                 0    25123    tienda 
   TABLE DATA           �   COPY public.tienda ("idTienda", nombre, direccion, "horarioApertura", "horarioClausura", "imagenTienda", "cantidadVentas", marca) FROM stdin;
    public          postgres    false    229   i                 0    25129    tipoproducto 
   TABLE DATA           Z   COPY public.tipoproducto ("idTipoProducto", nombre, imagen, "cantidadVentas") FROM stdin;
    public          postgres    false    231   �j                  0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 3, true);
          public          postgres    false    216                       0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 2, true);
          public          postgres    false    218                       0    0    favorito_idfavorito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.favorito_idfavorito_seq', 10, true);
          public          postgres    false    220                       0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 2, true);
          public          postgres    false    222                       0    0    productos_idproducto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_idproducto_seq', 36, true);
          public          postgres    false    224                       0    0    reseña_idcomentario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reseña_idcomentario_seq"', 1, false);
          public          postgres    false    226                       0    0    tarjeta_idtarjeta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tarjeta_idtarjeta_seq', 2, true);
          public          postgres    false    228                       0    0    tienda_idtienda_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 6, true);
          public          postgres    false    230                       0    0    tipoproducto_idTipoProducto_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."tipoproducto_idTipoProducto_seq"', 9, true);
          public          postgres    false    232            L           2606    25145    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY ("idCliente");
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    215            N           2606    25147     detallePedido detallepedido_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY ("idDetallePedido");
 L   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    217            P           2606    25149    favorito favorito_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_pkey PRIMARY KEY ("idFavorito");
 @   ALTER TABLE ONLY public.favorito DROP CONSTRAINT favorito_pkey;
       public            postgres    false    219            R           2606    25151    pedido pedido_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY ("idPedido");
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    221            T           2606    25153    producto productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT productos_pkey PRIMARY KEY ("idProducto");
 A   ALTER TABLE ONLY public.producto DROP CONSTRAINT productos_pkey;
       public            postgres    false    223            V           2606    25155    reseña reseña_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY ("idReseña");
 B   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_pkey";
       public            postgres    false    225            X           2606    25157    tarjeta tarjeta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY ("idTarjeta");
 >   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT tarjeta_pkey;
       public            postgres    false    227            Z           2606    25159    tienda tienda_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY ("idTienda");
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public            postgres    false    229            \           2606    25161    tipoproducto tipoproducto_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipoproducto
    ADD CONSTRAINT tipoproducto_pkey PRIMARY KEY ("idTipoProducto");
 H   ALTER TABLE ONLY public.tipoproducto DROP CONSTRAINT tipoproducto_pkey;
       public            postgres    false    231            ]           2606    25162 )   detallePedido detallePedido_idPedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_idPedido_fkey" FOREIGN KEY ("idPedido") REFERENCES public.pedido("idPedido") NOT VALID;
 W   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallePedido_idPedido_fkey";
       public          postgres    false    221    217    4690            ^           2606    25167 +   detallePedido detallePedido_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 Y   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallePedido_idProducto_fkey";
       public          postgres    false    217    4692    223            _           2606    25172     favorito favorito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idCliente_fkey";
       public          postgres    false    215    4684    219            `           2606    25177 !   favorito favorito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 M   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idProducto_fkey";
       public          postgres    false    4692    219    223            a           2606    25182    pedido pedido_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT "pedido_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT "pedido_idCliente_fkey";
       public          postgres    false    4684    221    215            b           2606    25187    producto producto_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTienda_fkey";
       public          postgres    false    4698    229    223            c           2606    25192 %   producto producto_idTipoProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTipoProducto_fkey" FOREIGN KEY ("idTipoProducto") REFERENCES public.tipoproducto("idTipoProducto") NOT VALID;
 Q   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTipoProducto_fkey";
       public          postgres    false    231    223    4700            d           2606    25197    reseña reseña_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idCliente_fkey";
       public          postgres    false    225    4684    215            e           2606    25202    reseña reseña_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idTienda_fkey";
       public          postgres    false    229    4698    225            f           2606    25207    tarjeta tarjeta_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT "tarjeta_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT "tarjeta_idCliente_fkey";
       public          postgres    false    227    215    4684            �   �   x�U��
�0�ϻ#��,=�j���J0?E����=���쌄��%dx��WHu%�?Ɇع�~	� %�d�ک+3�>F?�u�6HJ'�/i��[k!�11jxۜ����kn���%��e�R�����j:       �      x������ � �      �   *   x�3�4�44�2�4Q�Ɯ�&\� �9���k����� r�j      �      x������ � �      �   �  x��VMo�F=��N9���n��@���xl��$��D�ٔQ����a�V�%�Y,�	r�L�Rի��^e��O�g_�������/�I�GI.8z�M��$�;Tn����O�]'k_T6IS��y&-����i΅ѥa������rA���z��m�ɖ&eU��.3)9~�('��֙;~�Ry<��̕��x"��7.�����TGT����MQ=!J��;t���"k�H	�^k\ϧ��]ۗ��*��v���"�t�������r�-N�o��xY�bТ�f�m���"���
�wR�Ƶ!	����k6W4��	O!����O�)9$&S5)ct,�Qt�U�򈚘�@Q�EZH	yR�jx8��!��*��s?�ꇶ�	K�4	�4�tm1��O��cgq���6��k�1�1#Ld�N0��v;~Pu~�i�CXl
	S�)-,5e΅��#�J�I�1�����N�z��i?���K���
�`��1d�J�u����bo��y���SM�i��ϛ��K�����>Q���ɞӱvϕe�)�>w�O�֎Y�R%�3��
'��pMO�bM}ኼ�eN��T�&/�J��G��[����� M&%-^���+��W���M�/�|:�/����(�H��*�,F��� ���r%.�bHtr}quv7��9;�xs}{����A���m��j`Q`J��!f�i�����l��!��v�c�m��*��T+BD�ς/>.��w�.��������K|��zsx�����)D3�"r�RtU���s7�7�+�gd&NӃ�	(}4��q��0fMqm���
_ڱ�I ��!6���Cl=)�����f\[ddH(��X�c�w�@/n�|3�m�¯�[v����	N�2s%qasP����v������P�|S��7J4U
�����OG������٢���u���=�r�ɡSP�`��\;� ��ñ
Ц"�)�ԩ�:�t{��@�89NT��&N��u�>�~𳏠F�������[��k�-즭����_3����}��\[�����t�m�&? ��tY-���I����k��=��va��N���V���"�����k�5�6��ݡ��K!ݷ�W(�Q��2�R!�W0�Vm70�e�H�t.��������5>'�!q�Ϥ��e��:�S�M������p�E���� �Z��:\��;z�V��2�ߘm^��}]����f'�OX7��`��r�X�dK3�7���۱(���!16%�H���EA��%ӂ�j%��:�yΥQ�;/��o{�(�a]��PE�?��q|T�d!@����ϯ=�(�����.=L�2���U�R���4N�<u�0����V��Ra%�P�B7��l�٢�
�#*H4�xz� S��7���r[rջ�&��_�$w����j4E����i����V<�4P�L��ص+���nR'RxE�HN Ô�]U��?<LB�m��S��Ѝ��=��+m�x��m��I{�Sb:���\�e_�DKE��S"8�(������始�3�P�6���9M�������}GV�C��}-߬h� �����e`�p%��r���L���uV�}�|�pO/��+�(�%F��>�>P	�343\���n`a�i�c�&�+nj���;@�ЀXL��t�,u��^kiYJ5>O�ƪ4-s��%���z��f�BO+r��N�>�k~tt�ϴÎ             x������ � �         Z   x�3��M,*��Sp�J-,�L�QJLJ-�4�42�4165�5565�5�01�8��ph1�42�4212�5312�5751ҵ�01j����� zj         �  x�u�=�� Fct
] �I�6��`�um���%��X�
!����Y|13��`7��	�Z��}��cp��&�	ï���MK��Hy�_r^� o�C�~p9�1zXaTF��Q��-?��Ѫ��0a�q@s�C�HՃ�8�`7�J���2������{�[�<���6�6ЌC��3+�?�+E>a�Sr� 9c��m�d���q�^Yr1�99&��t��XȰ�KDS��,�^oL�<��T�=��!P5�l���>ゃC��BK�&?�a�6���5`A��%&�K��X�w���{0�0Q�\}W�:�{��4ƍ<Eԏi�eǛ�*��V������%ᲁj`����0M�dDk�0�Ab��W�O���[�\}fUU�'y��         �  x����j�@���������P����6�(�+�K���8��w�$��7�@+	�sߜY��B���q쇏;�m��<6ۢ�m���������mtՀ��_v�æ�%�[�*�:�\
���b�'�껲ꊶ��U���0��a�)�@I#8V��>�jW����1v�)���͆neI5���a5)A)��Δ`\�<�tm?\��υ!���6t����)�F� �(EDY!9��x%��Qe8RK�c����r�!��,��;��u���j���'G��D�:�Q���Ry��y6��Vhk��ǆ�B���q��^Vb���@��km�}.� �y���3!P%�aTK��~mʤpx��;׍n��n3�01g��_����L!�!���(����M�IRc�����*��b�&uF�%6\�\g�P5gl���o�Nq�&��%�.�-��PE,)yH �(h�%�o�֐� nk�u]�t�@	h��Mv���~�/��n@x�c:�4[�td���TDF4�0QW�y�������=��r��Q'����n�8�ү]���pP
�Ɨ���b5C���|�����~	o�g���otu{;_�����b5�~���a�A	e =ӕq1��g���_N�g�     