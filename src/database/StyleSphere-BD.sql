PGDMP          	            |            StyleSphere_BD    16.2    16.0 M    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    StyleSphere_BD    DATABASE     �   CREATE DATABASE "StyleSphere_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
     DROP DATABASE "StyleSphere_BD";
                postgres    false            �            1259    16399    TipoProducto    TABLE     �   CREATE TABLE public."TipoProducto" (
    "idTipoProducto" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    imagen character varying(500) NOT NULL
);
 "   DROP TABLE public."TipoProducto";
       public         heap    postgres    false            �            1259    16404    TipoProducto_idTipoProducto_seq    SEQUENCE     �   CREATE SEQUENCE public."TipoProducto_idTipoProducto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."TipoProducto_idTipoProducto_seq";
       public          postgres    false    215                       0    0    TipoProducto_idTipoProducto_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."TipoProducto_idTipoProducto_seq" OWNED BY public."TipoProducto"."idTipoProducto";
          public          postgres    false    216            �            1259    16405    cliente    TABLE     (  CREATE TABLE public.cliente (
    "idCliente" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    "correoElectronico" character varying(100) NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    celular character varying(50)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16408    cliente_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cliente_idcliente_seq;
       public          postgres    false    217                       0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente."idCliente";
          public          postgres    false    218            �            1259    16409    detallePedido    TABLE     �   CREATE TABLE public."detallePedido" (
    "idDetallePedido" integer NOT NULL,
    "idProducto" integer NOT NULL,
    cantidad integer NOT NULL,
    "idPedido" integer NOT NULL
);
 #   DROP TABLE public."detallePedido";
       public         heap    postgres    false            �            1259    16412 !   detallepedido_iddetallepedido_seq    SEQUENCE     �   CREATE SEQUENCE public.detallepedido_iddetallepedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallepedido_iddetallepedido_seq;
       public          postgres    false    219                       0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.detallepedido_iddetallepedido_seq OWNED BY public."detallePedido"."idDetallePedido";
          public          postgres    false    220            �            1259    16413    favorito    TABLE     �   CREATE TABLE public.favorito (
    "idFavorito" integer NOT NULL,
    "idCliente" integer NOT NULL,
    "idProducto" integer NOT NULL
);
    DROP TABLE public.favorito;
       public         heap    postgres    false            �            1259    16416    favorito_idfavorito_seq    SEQUENCE     �   CREATE SEQUENCE public.favorito_idfavorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.favorito_idfavorito_seq;
       public          postgres    false    221                       0    0    favorito_idfavorito_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.favorito_idfavorito_seq OWNED BY public.favorito."idFavorito";
          public          postgres    false    222            �            1259    16417    pedido    TABLE     '  CREATE TABLE public.pedido (
    "idPedido" integer NOT NULL,
    completado boolean NOT NULL,
    "metodoDePago" boolean NOT NULL,
    "tarifaDeServicio" double precision NOT NULL,
    descuento integer NOT NULL,
    "precioFinal" double precision NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16420    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    223                       0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido."idPedido";
          public          postgres    false    224            �            1259    16421    producto    TABLE     W  CREATE TABLE public.producto (
    "idProducto" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    precio double precision NOT NULL,
    talle character varying(15) NOT NULL,
    color character varying(50) NOT NULL,
    "cantidadStock" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idTipoProducto" integer NOT NULL
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    16424    productos_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.productos_idproducto_seq;
       public          postgres    false    225                       0    0    productos_idproducto_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.productos_idproducto_seq OWNED BY public.producto."idProducto";
          public          postgres    false    226            �            1259    16425    reseña    TABLE     �   CREATE TABLE public."reseña" (
    "idReseña" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idCliente" integer NOT NULL,
    comentario character varying(200) NOT NULL,
    valoracion integer NOT NULL
);
    DROP TABLE public."reseña";
       public         heap    postgres    false            �            1259    16428    reseña_idcomentario_seq    SEQUENCE     �   CREATE SEQUENCE public."reseña_idcomentario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."reseña_idcomentario_seq";
       public          postgres    false    227                       0    0    reseña_idcomentario_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public."reseña_idcomentario_seq" OWNED BY public."reseña"."idReseña";
          public          postgres    false    228            �            1259    16429    tarjeta    TABLE     4  CREATE TABLE public.tarjeta (
    "idTarjeta" integer NOT NULL,
    "nombreDelTitular" character varying(100) NOT NULL,
    "fechaInicioVencimiento" integer NOT NULL,
    "fechaTerminadoVencimiento" integer NOT NULL,
    "numeroDeTarjeta" character varying(100) NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.tarjeta;
       public         heap    postgres    false            �            1259    16432    tarjeta_idtarjeta_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_idtarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tarjeta_idtarjeta_seq;
       public          postgres    false    229                       0    0    tarjeta_idtarjeta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarjeta_idtarjeta_seq OWNED BY public.tarjeta."idTarjeta";
          public          postgres    false    230            �            1259    16433    tienda    TABLE     2  CREATE TABLE public.tienda (
    "idTienda" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(100) NOT NULL,
    "horarioApertura" character varying(50) NOT NULL,
    "horarioClausura" character varying(50) NOT NULL,
    imagen character varying(500) NOT NULL
);
    DROP TABLE public.tienda;
       public         heap    postgres    false            �            1259    16438    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public          postgres    false    231                       0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda."idTienda";
          public          postgres    false    232            B           2604    16439    TipoProducto idTipoProducto    DEFAULT     �   ALTER TABLE ONLY public."TipoProducto" ALTER COLUMN "idTipoProducto" SET DEFAULT nextval('public."TipoProducto_idTipoProducto_seq"'::regclass);
 N   ALTER TABLE public."TipoProducto" ALTER COLUMN "idTipoProducto" DROP DEFAULT;
       public          postgres    false    216    215            C           2604    16440    cliente idCliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN "idCliente" SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 B   ALTER TABLE public.cliente ALTER COLUMN "idCliente" DROP DEFAULT;
       public          postgres    false    218    217            D           2604    16441    detallePedido idDetallePedido    DEFAULT     �   ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "idDetallePedido" SET DEFAULT nextval('public.detallepedido_iddetallepedido_seq'::regclass);
 P   ALTER TABLE public."detallePedido" ALTER COLUMN "idDetallePedido" DROP DEFAULT;
       public          postgres    false    220    219            E           2604    16442    favorito idFavorito    DEFAULT     |   ALTER TABLE ONLY public.favorito ALTER COLUMN "idFavorito" SET DEFAULT nextval('public.favorito_idfavorito_seq'::regclass);
 D   ALTER TABLE public.favorito ALTER COLUMN "idFavorito" DROP DEFAULT;
       public          postgres    false    222    221            F           2604    16443    pedido idPedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN "idPedido" SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 @   ALTER TABLE public.pedido ALTER COLUMN "idPedido" DROP DEFAULT;
       public          postgres    false    224    223            G           2604    16444    producto idProducto    DEFAULT     }   ALTER TABLE ONLY public.producto ALTER COLUMN "idProducto" SET DEFAULT nextval('public.productos_idproducto_seq'::regclass);
 D   ALTER TABLE public.producto ALTER COLUMN "idProducto" DROP DEFAULT;
       public          postgres    false    226    225            H           2604    16445    reseña idReseña    DEFAULT        ALTER TABLE ONLY public."reseña" ALTER COLUMN "idReseña" SET DEFAULT nextval('public."reseña_idcomentario_seq"'::regclass);
 D   ALTER TABLE public."reseña" ALTER COLUMN "idReseña" DROP DEFAULT;
       public          postgres    false    228    227            I           2604    16446    tarjeta idTarjeta    DEFAULT     x   ALTER TABLE ONLY public.tarjeta ALTER COLUMN "idTarjeta" SET DEFAULT nextval('public.tarjeta_idtarjeta_seq'::regclass);
 B   ALTER TABLE public.tarjeta ALTER COLUMN "idTarjeta" DROP DEFAULT;
       public          postgres    false    230    229            J           2604    16447    tienda idTienda    DEFAULT     t   ALTER TABLE ONLY public.tienda ALTER COLUMN "idTienda" SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 @   ALTER TABLE public.tienda ALTER COLUMN "idTienda" DROP DEFAULT;
       public          postgres    false    232    231            �          0    16399    TipoProducto 
   TABLE DATA           J   COPY public."TipoProducto" ("idTipoProducto", nombre, imagen) FROM stdin;
    public          postgres    false    215   �_       �          0    16405    cliente 
   TABLE DATA           m   COPY public.cliente ("idCliente", nombre, apellido, "correoElectronico", "contraseña", celular) FROM stdin;
    public          postgres    false    217   �`       �          0    16409    detallePedido 
   TABLE DATA           `   COPY public."detallePedido" ("idDetallePedido", "idProducto", cantidad, "idPedido") FROM stdin;
    public          postgres    false    219   �a       �          0    16413    favorito 
   TABLE DATA           K   COPY public.favorito ("idFavorito", "idCliente", "idProducto") FROM stdin;
    public          postgres    false    221   �a       �          0    16417    pedido 
   TABLE DATA           �   COPY public.pedido ("idPedido", completado, "metodoDePago", "tarifaDeServicio", descuento, "precioFinal", "idCliente") FROM stdin;
    public          postgres    false    223   �a                  0    16421    producto 
   TABLE DATA           }   COPY public.producto ("idProducto", nombre, precio, talle, color, "cantidadStock", "idTienda", "idTipoProducto") FROM stdin;
    public          postgres    false    225   #b                 0    16425    reseña 
   TABLE DATA           a   COPY public."reseña" ("idReseña", "idTienda", "idCliente", comentario, valoracion) FROM stdin;
    public          postgres    false    227   @b                 0    16429    tarjeta 
   TABLE DATA           �   COPY public.tarjeta ("idTarjeta", "nombreDelTitular", "fechaInicioVencimiento", "fechaTerminadoVencimiento", "numeroDeTarjeta", "idCliente") FROM stdin;
    public          postgres    false    229   ]b                 0    16433    tienda 
   TABLE DATA           m   COPY public.tienda ("idTienda", nombre, direccion, "horarioApertura", "horarioClausura", imagen) FROM stdin;
    public          postgres    false    231   �b                  0    0    TipoProducto_idTipoProducto_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."TipoProducto_idTipoProducto_seq"', 2, true);
          public          postgres    false    216                       0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 3, true);
          public          postgres    false    218                       0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 2, true);
          public          postgres    false    220                       0    0    favorito_idfavorito_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.favorito_idfavorito_seq', 5, true);
          public          postgres    false    222                       0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 2, true);
          public          postgres    false    224                       0    0    productos_idproducto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_idproducto_seq', 1, false);
          public          postgres    false    226                       0    0    reseña_idcomentario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reseña_idcomentario_seq"', 1, false);
          public          postgres    false    228                       0    0    tarjeta_idtarjeta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tarjeta_idtarjeta_seq', 2, true);
          public          postgres    false    230                       0    0    tienda_idtienda_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 1, false);
          public          postgres    false    232            L           2606    16449    TipoProducto TipoProducto_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."TipoProducto"
    ADD CONSTRAINT "TipoProducto_pkey" PRIMARY KEY ("idTipoProducto");
 L   ALTER TABLE ONLY public."TipoProducto" DROP CONSTRAINT "TipoProducto_pkey";
       public            postgres    false    215            N           2606    16451    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY ("idCliente");
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    217            P           2606    16453     detallePedido detallepedido_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY ("idDetallePedido");
 L   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    219            R           2606    16455    favorito favorito_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_pkey PRIMARY KEY ("idFavorito");
 @   ALTER TABLE ONLY public.favorito DROP CONSTRAINT favorito_pkey;
       public            postgres    false    221            T           2606    16457    pedido pedido_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY ("idPedido");
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    223            V           2606    16459    producto productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT productos_pkey PRIMARY KEY ("idProducto");
 A   ALTER TABLE ONLY public.producto DROP CONSTRAINT productos_pkey;
       public            postgres    false    225            X           2606    16461    reseña reseña_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY ("idReseña");
 B   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_pkey";
       public            postgres    false    227            Z           2606    16463    tarjeta tarjeta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY ("idTarjeta");
 >   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT tarjeta_pkey;
       public            postgres    false    229            \           2606    16465    tienda tienda_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY ("idTienda");
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public            postgres    false    231            ]           2606    16466 )   detallePedido detallePedido_idPedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_idPedido_fkey" FOREIGN KEY ("idPedido") REFERENCES public.pedido("idPedido") NOT VALID;
 W   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallePedido_idPedido_fkey";
       public          postgres    false    4692    223    219            ^           2606    16471 +   detallePedido detallePedido_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 Y   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallePedido_idProducto_fkey";
       public          postgres    false    219    225    4694            _           2606    16476     favorito favorito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idCliente_fkey";
       public          postgres    false    221    217    4686            `           2606    16481 !   favorito favorito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 M   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idProducto_fkey";
       public          postgres    false    225    221    4694            a           2606    16486    pedido pedido_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT "pedido_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT "pedido_idCliente_fkey";
       public          postgres    false    4686    217    223            b           2606    16491    producto producto_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTienda_fkey";
       public          postgres    false    231    225    4700            c           2606    16496 %   producto producto_idTipoProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTipoProducto_fkey" FOREIGN KEY ("idTipoProducto") REFERENCES public."TipoProducto"("idTipoProducto") NOT VALID;
 Q   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTipoProducto_fkey";
       public          postgres    false    4684    225    215            d           2606    16501    reseña reseña_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idCliente_fkey";
       public          postgres    false    227    4686    217            e           2606    16506    reseña reseña_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idTienda_fkey";
       public          postgres    false    4700    231    227            f           2606    16511    tarjeta tarjeta_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT "tarjeta_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT "tarjeta_idCliente_fkey";
       public          postgres    false    217    4686    229            �   4  x��P]k�@|6�ü%�&�K�(�#X��Z+
�r�$'I6����{Jii�˲3�3�Ά�\�NZU����ڶ��$�6��W��NQ"LM�E�u�� �͋�ꬲ��{%xQMK2M���fY�,���,�H��jv�u�f�Y,/��k��l����Y���o�{�ya�������ӄ+�E���	� ��n��zf�#�&�����8-l'�"v����O����2���t��	��IP�eP��H~�P)�B�T}���E�
%���h���S-�p�����]�^~Ybwп���@����o�a�ZϨ�      �   �   x�U��
�0�ϻ#��,=�j���J0?E����=���쌄��%dx��WHu%�?Ɇع�~	� %�d�ک+3�>F?�u�6HJ'�/i��[k!�11jxۜ����kn���%��e�R�����j:       �      x�3�4�4�4�2�4҆\1z\\\ l�      �   '   x�3�4�4�2�4�ƜƜ&\&@�!�)�m����� K�+      �   .   x�3�LBCSNNC3 e�e�Y�&@������W� ���             x������ � �            x������ � �         Z   x�3��M,*��Sp�J-,�L�QJLJ-�4�42�4165�5565�5�01�8��ph1�42�4212�5312�5751ҵ�01j����� zj         �  x���͎�0 �sx
.��C�h�JQ�姪X��h�]�2�C�&�Y;?��G�աE�Ҟ���5���q�%�ш�?��SR����id�}o�vq_U��ڶ�2!��T�,>+���ѹ�΋�ܙ�]e�Y��B�[ u�)���;�,ˢx�<A�&l�o'_�U��'ǵ�� ��ZU�8�бGá��z�J�2ň Ce�4jvh��E�0F����?|]�&�o�Vl��&�ڬ�y2[�ݠ��oz�SFA(`ˠ����nP!G�G���/��J���H*�\�LĎ�윣H�|���̴ �7_ky4	��c�L���{9��ǹWZ�+�C�V�;�O>К�<�$��!%�X�=�.d��=S�ܱ���	.�N�kL�9`Ah�\tR�(r '}'��4p��Y�:�tL_fr��+9�6k�R{����?��n�:ϛ��t?�^��о�     