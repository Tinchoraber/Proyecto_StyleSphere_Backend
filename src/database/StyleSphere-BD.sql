PGDMP  0                    |            StyleSphere_BD    16.3    16.3 M    
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
    public          postgres    false    217   Ka       �          0    25103    favorito 
   TABLE DATA           K   COPY public.favorito ("idFavorito", "idCliente", "idProducto") FROM stdin;
    public          postgres    false    219   ha       �          0    25107    pedido 
   TABLE DATA           �   COPY public.pedido ("idPedido", completado, "metodoDePago", "tarifaDeServicio", descuento, "precioFinal", "idCliente") FROM stdin;
    public          postgres    false    221   �a       �          0    25111    producto 
   TABLE DATA           �   COPY public.producto ("idProducto", nombre, precio, talle, color, "cantidadStock", "idTienda", "idTipoProducto", "cantidadVentas", imagen) FROM stdin;
    public          postgres    false    223   �a                  0    25115    reseña 
   TABLE DATA           a   COPY public."reseña" ("idReseña", "idTienda", "idCliente", comentario, valoracion) FROM stdin;
    public          postgres    false    225   �j                 0    25119    tarjeta 
   TABLE DATA           �   COPY public.tarjeta ("idTarjeta", "nombreDelTitular", "fechaInicioVencimiento", "fechaTerminadoVencimiento", "numeroDeTarjeta", "idCliente") FROM stdin;
    public          postgres    false    227   �j                 0    25123    tienda 
   TABLE DATA           �   COPY public.tienda ("idTienda", nombre, direccion, "horarioApertura", "horarioClausura", "imagenTienda", "cantidadVentas", marca) FROM stdin;
    public          postgres    false    229   Jk                 0    25129    tipoproducto 
   TABLE DATA           Z   COPY public.tipoproducto ("idTipoProducto", nombre, imagen, "cantidadVentas") FROM stdin;
    public          postgres    false    231   %m                  0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 3, true);
          public          postgres    false    216                       0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 2, true);
          public          postgres    false    218                       0    0    favorito_idfavorito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.favorito_idfavorito_seq', 10, true);
          public          postgres    false    220                       0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 2, true);
          public          postgres    false    222                       0    0    productos_idproducto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_idproducto_seq', 45, true);
          public          postgres    false    224                       0    0    reseña_idcomentario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reseña_idcomentario_seq"', 1, false);
          public          postgres    false    226                       0    0    tarjeta_idtarjeta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tarjeta_idtarjeta_seq', 2, true);
          public          postgres    false    228                       0    0    tienda_idtienda_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 8, true);
          public          postgres    false    230                       0    0    tipoproducto_idTipoProducto_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."tipoproducto_idTipoProducto_seq"', 10, true);
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
�0�ϻ#��,=�j���J0?E����=���쌄��%dx��WHu%�?Ɇع�~	� %�d�ک+3�>F?�u�6HJ'�/i��[k!�11jxۜ����kn���%��e�R�����j:       �      x������ � �      �   *   x�3�4�44�2�4Q�Ɯ�&\� �9���k����� r�j      �      x������ � �      �   �  x��X�r�8}��BOy2E�AL�kJ����v����R� (sL2II����Ƕ��L&٭<ȡb	}����c/
]��K�B�}t�~s�D4�`TD�]7oJ��pf�R�z�_]=4n��3=�m2N$^.1����]'����_�y��o��VѨl�1v�#�"���ҵq>�be\�m4��ù����O>آ�M�`�R�	�p�eH(%IFhtgg�у�H�8W��uQA8����尜MM8}��☾��C,��6��E|�0�T
���i�>Ol<�����+_�v0��2�mU�꺳m$y8��N珇�eġ
�#۹k:��J7�eg_t�ڮt�(��MʼMWR���I_�]��L�����HД"!R�U��� ��u����Shg$|�������$v�Z�VÙ��ܕu�u�Д ȩ��Ћ�KEڸ�O�s8=���:����\��@�W7��';�]VفYت��mǶ�Z�8p�-����E�Ks����r��h��m�(�"�8J1���KE"A6cX�
D�6�Ҍr%5�)���`*=	Q@�xt�gsO�S;eM9u���Ln�y���B��~'S	�PmO4�dغ��ַն��_%FC��4�7._�ޛG�H�
�Q����d�$����*ˉ��%��^��Xx�qul�|au<��|5���C���)ʡ� �^�i4��HA|>X�%����x�w�pO�o�)Qij�����bUgH�oVe�=���<B���۹5�Q�,�A�&���=�]3�r�\$b���G���O�ԋ��Ǘ��w�?~?�MB��X�*���\��=�q./m`H�IO�`=�� 
�]񴷴Yٕ��u��lo�k��!�@�,�m�A��1D�[4��Rc[b-��0L)��)���9��7=�)��с�t$�,4�S��u�����j�r�~����s�OQM*׶�ͤ(��p�;����R##��I�i�M�`@<QT��U�u�����=l�1�I?��6v�{���ot	D469��VJ�I�V6Ks	6�E���bf�Sa���Z!A,e$ϔ�2]k�D�}�;�������P�����3�U��~�%�m H�fلk������2%E2�3�e��1���e�s�'���	�"��[�jb�)?\��	
ą1��������P�l5�O�h�w/���m_��S�0g��Nu5wun7�#=������N!S�)A$��O���3����ᵟ(nyvE7� ��$e<ݢ,�����ρ�Sp*d�´{u���^|J�Mb!��-k]ml�%��Ώaªa��z�^�`�p�u��Ee��~����8:v]Y?��S��"X1ZI- M#����$���R�sݢsX;4�jBbCI��(F������&�,V9����"�Lb��b�eI`� {$,�XoK0�o��g���۳��ۛ���eP)�����5��Y�̼N6�56����a�A,YG�G����}�1�G��������e|2����sl�9$�286I�@����~�.�O=Y�.e(��9�X���#��Oh�mcv���7g�~�A����Pa�c��6��}�k��;�l��:��V��n찷�$N�aƷ16����*6��UA�]�r���
`��sL�oo/(ݘn�ե�*Ho+�ͺ���w���^7>�W�
e�&�%x��=Mn�Iw�#T¶�X������¢���l��~�]EJW�.��b���^���:�;������W��$�.�M�O�\�Ќ
ȞV�OG��ɦ ��5G�����MQvG�[�y��j^�����R���'���2�M��)m�ؐ����F��|��ʉ(����IJ0�9��}��0�#��ތ��.�bl�=ߓOa�Ļ�$�r���
G��J!�p�$.���l�E�, )�؎�Բ�_ߙ�_�B����x�_,���{�@��ﺗ��ʹ�qp^��-oz�}��0�������:Z�����u�ǧ�
�4��7p�D�]���\z��܍/�ף���4�y���`�%�6���)_)Da����Z`X"A��[K���>��n"�P��k���T����鰅[�n;H����^�P}�����U�,uSBKa[j��tYPњ�DL�%}R䅯���Hi��7_���ֻ��,WT��"�0�mn� B�E��Z�HUV(�j� �f��xK3x����-�B�/}?�58�Y��?�8��L�Y�}�i�̿������             x������ � �         Z   x�3��M,*��Sp�J-,�L�QJLJ-�4�42�4165�5565�5�01�8��ph1�42�4212�5312�5751ҵ�01j����� zj         �  x�u��r� �k�z!��n�Tιp�L�� ���|��&ϒ���.��ݥ���wW���Y�o���E�#p��\V��@)bl�?c��!�V
�:}���̤��x
��KA�F*�[�vښP��E��[b'���\�rBS���[R2J�R�e���غU;a���P�����3��'`|�C���_����sV�O}\.�"X��vr�q��3�:�T"�,J��@H��:��#�� Y���*X���Y@o9/%���ՙ�N��Ȗ�d<�8&?
���BJ�xZ��;	���+BV��u|�_�����.��9�iuC�Ql1[g�a�vHǅ��Ct�
ct�J���Ȏue_��r�Kj@��^$�]8k�����p�?�a�O�����>�j�mwz����h���(��C�2x?��#�iej�cD'��F���e?�,�����!         �  x����j�0����b/��~��6���,!m�� �j�[��4�~��%��	,�����}͖��u�M߷�{����T}��ͨ���%�kQ�>4=޶���3B-&?�F�E�K�&�>4�m��R�eG�_�P�e3���
M隭C��1�(iǊQܦXn���֣:�� � �9}M����pc��0�� ���f�)���yv��ߝ���Fa�q �C�ʸk�:���RD��3�W�q�U�3!�u,C�0���rH.%�E�ݵ�ݸ�Єj�����R��:Q���Ry��y�r+��D������W�t{+���0v ���J[n�?�T�<c��LT	m�.��Lz�8<W��5���&�Y��e��W�h���p�L!�.��(�����:�IRc���NyE��� �z��cl���f��^i0Ф���n X?#�{q0�^آ,UĒ�� 	���6
�b����
�"�m�7�)⊮ڽPL�}I�l{�M
e��ԏ�`���}��˥���.�9�C)���g��r�Ɠ���M�hq~5�������������ͮ>O�C��w7L3(�x;����<�žz��a�"D���ٗ��3�7t��N'���r|���'truy4?G���"�a� {da��eN	��?N��n7*ݦv}|��y~1>�_PR۽���y��:��     