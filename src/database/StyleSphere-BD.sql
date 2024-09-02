PGDMP  6                    |            StyleSphere_BD    16.2    16.0 M    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    StyleSphere_BD    DATABASE     �   CREATE DATABASE "StyleSphere_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
     DROP DATABASE "StyleSphere_BD";
                postgres    false            �            1259    16399    cliente    TABLE     (  CREATE TABLE public.cliente (
    "idCliente" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    "correoElectronico" character varying(100) NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    celular character varying(50)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16402    cliente_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cliente_idcliente_seq;
       public          postgres    false    215                       0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente."idCliente";
          public          postgres    false    216            �            1259    16403    detallePedido    TABLE     �   CREATE TABLE public."detallePedido" (
    "idDetallePedido" integer NOT NULL,
    "idProducto" integer NOT NULL,
    cantidad integer NOT NULL,
    "idPedido" integer NOT NULL
);
 #   DROP TABLE public."detallePedido";
       public         heap    postgres    false            �            1259    16406 !   detallepedido_iddetallepedido_seq    SEQUENCE     �   CREATE SEQUENCE public.detallepedido_iddetallepedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallepedido_iddetallepedido_seq;
       public          postgres    false    217                       0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.detallepedido_iddetallepedido_seq OWNED BY public."detallePedido"."idDetallePedido";
          public          postgres    false    218            �            1259    16407    favorito    TABLE     �   CREATE TABLE public.favorito (
    "idFavorito" integer NOT NULL,
    "idCliente" integer NOT NULL,
    "idProducto" integer NOT NULL
);
    DROP TABLE public.favorito;
       public         heap    postgres    false            �            1259    16410    favorito_idfavorito_seq    SEQUENCE     �   CREATE SEQUENCE public.favorito_idfavorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.favorito_idfavorito_seq;
       public          postgres    false    219                       0    0    favorito_idfavorito_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.favorito_idfavorito_seq OWNED BY public.favorito."idFavorito";
          public          postgres    false    220            �            1259    16411    pedido    TABLE     '  CREATE TABLE public.pedido (
    "idPedido" integer NOT NULL,
    completado boolean NOT NULL,
    "metodoDePago" boolean NOT NULL,
    "tarifaDeServicio" double precision NOT NULL,
    descuento integer NOT NULL,
    "precioFinal" double precision NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16414    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    221                       0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido."idPedido";
          public          postgres    false    222            �            1259    16415    producto    TABLE     �  CREATE TABLE public.producto (
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
       public         heap    postgres    false            �            1259    16418    productos_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.productos_idproducto_seq;
       public          postgres    false    223                       0    0    productos_idproducto_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.productos_idproducto_seq OWNED BY public.producto."idProducto";
          public          postgres    false    224            �            1259    16419    reseña    TABLE     �   CREATE TABLE public."reseña" (
    "idReseña" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idCliente" integer NOT NULL,
    comentario character varying(200) NOT NULL,
    valoracion integer NOT NULL
);
    DROP TABLE public."reseña";
       public         heap    postgres    false            �            1259    16422    reseña_idcomentario_seq    SEQUENCE     �   CREATE SEQUENCE public."reseña_idcomentario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."reseña_idcomentario_seq";
       public          postgres    false    225                       0    0    reseña_idcomentario_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public."reseña_idcomentario_seq" OWNED BY public."reseña"."idReseña";
          public          postgres    false    226            �            1259    16423    tarjeta    TABLE     4  CREATE TABLE public.tarjeta (
    "idTarjeta" integer NOT NULL,
    "nombreDelTitular" character varying(100) NOT NULL,
    "fechaInicioVencimiento" integer NOT NULL,
    "fechaTerminadoVencimiento" integer NOT NULL,
    "numeroDeTarjeta" character varying(100) NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.tarjeta;
       public         heap    postgres    false            �            1259    16426    tarjeta_idtarjeta_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_idtarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tarjeta_idtarjeta_seq;
       public          postgres    false    227                       0    0    tarjeta_idtarjeta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarjeta_idtarjeta_seq OWNED BY public.tarjeta."idTarjeta";
          public          postgres    false    228            �            1259    16427    tienda    TABLE     �  CREATE TABLE public.tienda (
    "idTienda" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(100) NOT NULL,
    "horarioApertura" character varying(50) NOT NULL,
    "horarioClausura" character varying(50) NOT NULL,
    imagen character varying(500) NOT NULL,
    "cantidadVentas" numeric NOT NULL,
    marca character varying(50) NOT NULL
);
    DROP TABLE public.tienda;
       public         heap    postgres    false            �            1259    16432    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public          postgres    false    229                       0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda."idTienda";
          public          postgres    false    230            �            1259    16433    tipoproducto    TABLE     �   CREATE TABLE public.tipoproducto (
    "idTipoProducto" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    imagen character varying(200) NOT NULL,
    "cantidadVentas" numeric NOT NULL
);
     DROP TABLE public.tipoproducto;
       public         heap    postgres    false            �            1259    16438    tipoproducto_idTipoProducto_seq    SEQUENCE     �   CREATE SEQUENCE public."tipoproducto_idTipoProducto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."tipoproducto_idTipoProducto_seq";
       public          postgres    false    231                       0    0    tipoproducto_idTipoProducto_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."tipoproducto_idTipoProducto_seq" OWNED BY public.tipoproducto."idTipoProducto";
          public          postgres    false    232            B           2604    16439    cliente idCliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN "idCliente" SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 B   ALTER TABLE public.cliente ALTER COLUMN "idCliente" DROP DEFAULT;
       public          postgres    false    216    215            C           2604    16440    detallePedido idDetallePedido    DEFAULT     �   ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "idDetallePedido" SET DEFAULT nextval('public.detallepedido_iddetallepedido_seq'::regclass);
 P   ALTER TABLE public."detallePedido" ALTER COLUMN "idDetallePedido" DROP DEFAULT;
       public          postgres    false    218    217            D           2604    16441    favorito idFavorito    DEFAULT     |   ALTER TABLE ONLY public.favorito ALTER COLUMN "idFavorito" SET DEFAULT nextval('public.favorito_idfavorito_seq'::regclass);
 D   ALTER TABLE public.favorito ALTER COLUMN "idFavorito" DROP DEFAULT;
       public          postgres    false    220    219            E           2604    16442    pedido idPedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN "idPedido" SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 @   ALTER TABLE public.pedido ALTER COLUMN "idPedido" DROP DEFAULT;
       public          postgres    false    222    221            F           2604    16443    producto idProducto    DEFAULT     }   ALTER TABLE ONLY public.producto ALTER COLUMN "idProducto" SET DEFAULT nextval('public.productos_idproducto_seq'::regclass);
 D   ALTER TABLE public.producto ALTER COLUMN "idProducto" DROP DEFAULT;
       public          postgres    false    224    223            G           2604    16444    reseña idReseña    DEFAULT        ALTER TABLE ONLY public."reseña" ALTER COLUMN "idReseña" SET DEFAULT nextval('public."reseña_idcomentario_seq"'::regclass);
 D   ALTER TABLE public."reseña" ALTER COLUMN "idReseña" DROP DEFAULT;
       public          postgres    false    226    225            H           2604    16445    tarjeta idTarjeta    DEFAULT     x   ALTER TABLE ONLY public.tarjeta ALTER COLUMN "idTarjeta" SET DEFAULT nextval('public.tarjeta_idtarjeta_seq'::regclass);
 B   ALTER TABLE public.tarjeta ALTER COLUMN "idTarjeta" DROP DEFAULT;
       public          postgres    false    228    227            I           2604    16446    tienda idTienda    DEFAULT     t   ALTER TABLE ONLY public.tienda ALTER COLUMN "idTienda" SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 @   ALTER TABLE public.tienda ALTER COLUMN "idTienda" DROP DEFAULT;
       public          postgres    false    230    229            J           2604    16447    tipoproducto idTipoProducto    DEFAULT     �   ALTER TABLE ONLY public.tipoproducto ALTER COLUMN "idTipoProducto" SET DEFAULT nextval('public."tipoproducto_idTipoProducto_seq"'::regclass);
 L   ALTER TABLE public.tipoproducto ALTER COLUMN "idTipoProducto" DROP DEFAULT;
       public          postgres    false    232    231            �          0    16399    cliente 
   TABLE DATA                 public          postgres    false    215   �\       �          0    16403    detallePedido 
   TABLE DATA                 public          postgres    false    217   e]       �          0    16407    favorito 
   TABLE DATA                 public          postgres    false    219   ]       �          0    16411    pedido 
   TABLE DATA                 public          postgres    false    221   �]       �          0    16415    producto 
   TABLE DATA                 public          postgres    false    223    ^                  0    16419    reseña 
   TABLE DATA                 public          postgres    false    225   �a                 0    16423    tarjeta 
   TABLE DATA                 public          postgres    false    227   b                 0    16427    tienda 
   TABLE DATA                 public          postgres    false    229   �b                 0    16433    tipoproducto 
   TABLE DATA                 public          postgres    false    231   xd                  0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 3, true);
          public          postgres    false    216                       0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 2, true);
          public          postgres    false    218                       0    0    favorito_idfavorito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.favorito_idfavorito_seq', 10, true);
          public          postgres    false    220                       0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 2, true);
          public          postgres    false    222                       0    0    productos_idproducto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_idproducto_seq', 22, true);
          public          postgres    false    224                       0    0    reseña_idcomentario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reseña_idcomentario_seq"', 1, false);
          public          postgres    false    226                       0    0    tarjeta_idtarjeta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tarjeta_idtarjeta_seq', 2, true);
          public          postgres    false    228                       0    0    tienda_idtienda_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 6, true);
          public          postgres    false    230                       0    0    tipoproducto_idTipoProducto_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."tipoproducto_idTipoProducto_seq"', 9, true);
          public          postgres    false    232            L           2606    16449    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY ("idCliente");
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    215            N           2606    16451     detallePedido detallepedido_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY ("idDetallePedido");
 L   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    217            P           2606    16453    favorito favorito_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_pkey PRIMARY KEY ("idFavorito");
 @   ALTER TABLE ONLY public.favorito DROP CONSTRAINT favorito_pkey;
       public            postgres    false    219            R           2606    16455    pedido pedido_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY ("idPedido");
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    221            T           2606    16457    producto productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT productos_pkey PRIMARY KEY ("idProducto");
 A   ALTER TABLE ONLY public.producto DROP CONSTRAINT productos_pkey;
       public            postgres    false    223            V           2606    16459    reseña reseña_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY ("idReseña");
 B   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_pkey";
       public            postgres    false    225            X           2606    16461    tarjeta tarjeta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY ("idTarjeta");
 >   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT tarjeta_pkey;
       public            postgres    false    227            Z           2606    16463    tienda tienda_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY ("idTienda");
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public            postgres    false    229            \           2606    16465    tipoproducto tipoproducto_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipoproducto
    ADD CONSTRAINT tipoproducto_pkey PRIMARY KEY ("idTipoProducto");
 H   ALTER TABLE ONLY public.tipoproducto DROP CONSTRAINT tipoproducto_pkey;
       public            postgres    false    231            ]           2606    16466 )   detallePedido detallePedido_idPedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_idPedido_fkey" FOREIGN KEY ("idPedido") REFERENCES public.pedido("idPedido") NOT VALID;
 W   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallePedido_idPedido_fkey";
       public          postgres    false    221    217    4690            ^           2606    16471 +   detallePedido detallePedido_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 Y   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallePedido_idProducto_fkey";
       public          postgres    false    217    4692    223            _           2606    16476     favorito favorito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idCliente_fkey";
       public          postgres    false    215    4684    219            `           2606    16481 !   favorito favorito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 M   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idProducto_fkey";
       public          postgres    false    4692    219    223            a           2606    16486    pedido pedido_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT "pedido_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT "pedido_idCliente_fkey";
       public          postgres    false    4684    221    215            b           2606    16491    producto producto_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTienda_fkey";
       public          postgres    false    4698    229    223            c           2606    16496 %   producto producto_idTipoProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTipoProducto_fkey" FOREIGN KEY ("idTipoProducto") REFERENCES public.tipoproducto("idTipoProducto") NOT VALID;
 Q   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTipoProducto_fkey";
       public          postgres    false    231    223    4700            d           2606    16501    reseña reseña_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idCliente_fkey";
       public          postgres    false    225    4684    215            e           2606    16506    reseña reseña_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idTienda_fkey";
       public          postgres    false    229    4698    225            f           2606    16511    tarjeta tarjeta_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT "tarjeta_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT "tarjeta_idCliente_fkey";
       public          postgres    false    227    215    4684            �   �   x����
�0��}�ܪ �i� x�C�X�?��4	Mi�з7IAz�ٙݏ͋*+k��	�<�J
=	p>�&��
n@xd�$uhU�Z18�N%qL�מIqӇ�jL����� �Q���oV��f���R�5���=��{��1Dۅ��#�ȟ��.]�֒wn��A/�L��'Ζ�d`�"늆R�	�'��d�      �   
   x���          �   W   x���v
Q���W((M��L�KK,�/�,�Ws�	uV�0�Q0"#Mk.O"���(���BG��܄H��͉Tnh 1��� k�C~      �   
   x���          �   �  x���Ko�F���ڹD��ծ��.��na%A�1/ʌ�2��E{gH�w\d�� ��;�̥n�VW��7w��\��)��]�F;4�/緟�V��^.ήK�����l���p!N����k�pY.P�&g���� �z�����6��+4�RIc2�	B�H+�J�
��5FjB!d�V[�~k�`�@^�%�eJ��C�K]fv��I��*�)�J!3��������W���뇛�(I�]�A�xVQ���XNb�0<�^	C�^'^�C�R]�CS�]?ɳ��ҭ~j�2���[��z@�n��;Ghw�?TD����V��zV�5�Sm����Yf�"9�yg��	�.7�R��T&W\j�ތ��.ƻb��Q��߾JaaX.B.$e�<Os��T�-(�u���	��4�fb�@8c��X�.�Ճ.�u�~���*�&P���xh����D]���[��R��I���nY8�����Ե�t��A���a��u��ڤ�lF�wM=�� �Y����4�P!�t
�����6��U,��{�'�J��Q��N�ᡶ�Bt�ea�LCiĹo�M0N0�VN	{wFq�-�ۜ�ޮR�d������Q1e4׵+��m\s�t-6��#�*�ZT23O�E�׾7@���ߪ��m���>�kg'�"羁羁|�o!���g���<���V�]��nO/O��nq�t�/P,Q��H^mNg�h���ȸ�[]����X�����b	_�(A<�+%Nj�8�1�\���W-s�\Y���*�=W�	����z�GU���l����P�S�E��8G���((��o��8;:�QC�k�������.�1�LBx~s�n;��N�O��I�Rg8	��f��b�Ւ�@���H�tC�M�c���%r�ܐ��@J��'A`�D�����o7���=�c����Ei�7~6?�3N���������O�Ƽ��=u��_���U`̎          
   x���             �   x���v
Q���W((M��L�+I,�J-ITs�	uV�0�QP�M,*��Sp�J-,�L�QJLJ-R�Q0�Q02ʛ�����X���Y@YCMk.O���h�)P����L����\����H����j ��4�         �  x���An� ��s
v�Jŀ��8]�����VM�Ev��LXw�ܦg��
���Vj���@�������>ߠ���#�f�m��З��۫k��|��{�M�[�[e���x�	<؇_���L{F/(M!���k�tA�QRC���e�3d$-��,%�S�*V��FH�kZ7�% �n"9��6�+�&B� ���WQՄ���DI&>�8�YY��u����8�=��_�]�����]�ė�{���d����?'��xZ�x<f^;�z��g��qĭ��m �88�Q��QL��T|�f������^�_$V�%L��hHP爘����~��l3��hY�= up��c�0��J5`3[���.'��)T���ַni�;'�Ot��{�W��ۀ�c��Q[m���9����a"� ]G�&��S�JɚN4y�Z�v�S�h�}�<_�H�^�~���         �  x���[o�@F��+xK+u���UUр��D����k/���k����	�R�!��1����Lϯ&������bPo��ȆmQ�:�|��qp;:��\>�O��y(Cr�1<޵m�|Ƹ�^i�c[��Y,�.�m��X��j�^G�7�j1��� ڽT���b�S@��zE)���r4}'��?����jXm��U:,ܴ1�`0�c�(ޗk�����B>H)�w�/�4p+3�	7�Xwc��a]u�J0�z�r�<qeNw}�������B�~#e�@�"����Io���K�2�	�%�o����m��R�- ��j�^�~�SM�6�TS��*eQ���Ry��y��r+��D��[q!{p˝(Kl=��Ć��\-������H�fgB�Jhè���z��,���
�.]պu�B��f�ab^�]���1�����<����|(V���c5�&��+���I�P��?�ϕ�ѓ�.f!/ަ�@��F��g�#^z���]� Bf�<#TK2�C�`8����p���l�
��¯]��]��Q��鼉m�� ���0/V�6uL�,�5L�9}%,��I�H�ށ3J!��m��`��Qپ�"��}H��Rȟ�`#��	m�sĥ_��!�°�)��Z�OF���|�F��xt��tyv3����|z6���Ӌ��d�f7?&����W��J('��:�œ�GG���     