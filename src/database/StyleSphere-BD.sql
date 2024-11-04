PGDMP  %                
    |            StyleSphere_BD    16.2    16.0 Z               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    StyleSphere_BD    DATABASE     �   CREATE DATABASE "StyleSphere_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
     DROP DATABASE "StyleSphere_BD";
                postgres    false            �            1259    16399    carrito    TABLE     �   CREATE TABLE public.carrito (
    "idCarrito" integer NOT NULL,
    "idProducto" integer NOT NULL,
    "idCliente" integer NOT NULL,
    "cantidadAComprar" integer NOT NULL,
    talle character varying(10),
    color character varying(10)
);
    DROP TABLE public.carrito;
       public         heap    postgres    false            �            1259    16402    carrito_idCarrito_seq    SEQUENCE     �   CREATE SEQUENCE public."carrito_idCarrito_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."carrito_idCarrito_seq";
       public          postgres    false    215                       0    0    carrito_idCarrito_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."carrito_idCarrito_seq" OWNED BY public.carrito."idCarrito";
          public          postgres    false    216            �            1259    16403    cliente    TABLE     m  CREATE TABLE public.cliente (
    "idCliente" numeric NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    "correoElectronico" character varying(100) NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    celular character varying(50),
    "fotoPerfil" character varying(300),
    idclientgoogle numeric
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
       public          postgres    false    217                       0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente."idCliente";
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
       public          postgres    false    219                        0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.detallepedido_iddetallepedido_seq OWNED BY public."detallePedido"."idDetallePedido";
          public          postgres    false    220            �            1259    16413    favorito    TABLE     �   CREATE TABLE public.favorito (
    "idFavorito" integer NOT NULL,
    "idCliente" numeric NOT NULL,
    "idProducto" integer NOT NULL
);
    DROP TABLE public.favorito;
       public         heap    postgres    false            �            1259    16418    favorito_idfavorito_seq    SEQUENCE     �   CREATE SEQUENCE public.favorito_idfavorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.favorito_idfavorito_seq;
       public          postgres    false    221            !           0    0    favorito_idfavorito_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.favorito_idfavorito_seq OWNED BY public.favorito."idFavorito";
          public          postgres    false    222            �            1259    16419    pedido    TABLE     '  CREATE TABLE public.pedido (
    "idPedido" integer NOT NULL,
    completado boolean NOT NULL,
    "metodoDePago" boolean NOT NULL,
    "tarifaDeServicio" double precision NOT NULL,
    descuento integer NOT NULL,
    "precioFinal" double precision NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16422    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    223            "           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido."idPedido";
          public          postgres    false    224            �            1259    16423    producto    TABLE     �  CREATE TABLE public.producto (
    "idProducto" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    precio double precision NOT NULL,
    "cantidadStock" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idTipoProducto" integer NOT NULL,
    "cantidadVentas" integer NOT NULL,
    imagen character varying(200) NOT NULL,
    talles_disponibles text[],
    colores_disponibles text[]
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    16428    productos_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.productos_idproducto_seq;
       public          postgres    false    225            #           0    0    productos_idproducto_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.productos_idproducto_seq OWNED BY public.producto."idProducto";
          public          postgres    false    226            �            1259    16429    reseña    TABLE     �   CREATE TABLE public."reseña" (
    "idReseña" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idCliente" integer NOT NULL,
    comentario character varying(200) NOT NULL,
    valoracion integer NOT NULL
);
    DROP TABLE public."reseña";
       public         heap    postgres    false            �            1259    16432    reseña_idcomentario_seq    SEQUENCE     �   CREATE SEQUENCE public."reseña_idcomentario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."reseña_idcomentario_seq";
       public          postgres    false    227            $           0    0    reseña_idcomentario_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public."reseña_idcomentario_seq" OWNED BY public."reseña"."idReseña";
          public          postgres    false    228            �            1259    16433    tarjeta    TABLE     4  CREATE TABLE public.tarjeta (
    "idTarjeta" integer NOT NULL,
    "nombreDelTitular" character varying(100) NOT NULL,
    "fechaInicioVencimiento" integer NOT NULL,
    "fechaTerminadoVencimiento" integer NOT NULL,
    "numeroDeTarjeta" character varying(100) NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.tarjeta;
       public         heap    postgres    false            �            1259    16436    tarjeta_idtarjeta_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_idtarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tarjeta_idtarjeta_seq;
       public          postgres    false    229            %           0    0    tarjeta_idtarjeta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarjeta_idtarjeta_seq OWNED BY public.tarjeta."idTarjeta";
          public          postgres    false    230            �            1259    16437    tienda    TABLE     �  CREATE TABLE public.tienda (
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
       public         heap    postgres    false            �            1259    16442    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public          postgres    false    231            &           0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda."idTienda";
          public          postgres    false    232            �            1259    16443    tipoproducto    TABLE     �   CREATE TABLE public.tipoproducto (
    "idTipoProducto" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    imagen character varying(200) NOT NULL,
    "cantidadVentas" numeric NOT NULL
);
     DROP TABLE public.tipoproducto;
       public         heap    postgres    false            �            1259    16448    tipoproducto_idTipoProducto_seq    SEQUENCE     �   CREATE SEQUENCE public."tipoproducto_idTipoProducto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."tipoproducto_idTipoProducto_seq";
       public          postgres    false    233            '           0    0    tipoproducto_idTipoProducto_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."tipoproducto_idTipoProducto_seq" OWNED BY public.tipoproducto."idTipoProducto";
          public          postgres    false    234            G           2604    16449    carrito idCarrito    DEFAULT     z   ALTER TABLE ONLY public.carrito ALTER COLUMN "idCarrito" SET DEFAULT nextval('public."carrito_idCarrito_seq"'::regclass);
 B   ALTER TABLE public.carrito ALTER COLUMN "idCarrito" DROP DEFAULT;
       public          postgres    false    216    215            H           2604    16450    cliente idCliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN "idCliente" SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 B   ALTER TABLE public.cliente ALTER COLUMN "idCliente" DROP DEFAULT;
       public          postgres    false    218    217            I           2604    16451    detallePedido idDetallePedido    DEFAULT     �   ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "idDetallePedido" SET DEFAULT nextval('public.detallepedido_iddetallepedido_seq'::regclass);
 P   ALTER TABLE public."detallePedido" ALTER COLUMN "idDetallePedido" DROP DEFAULT;
       public          postgres    false    220    219            J           2604    16452    favorito idFavorito    DEFAULT     |   ALTER TABLE ONLY public.favorito ALTER COLUMN "idFavorito" SET DEFAULT nextval('public.favorito_idfavorito_seq'::regclass);
 D   ALTER TABLE public.favorito ALTER COLUMN "idFavorito" DROP DEFAULT;
       public          postgres    false    222    221            K           2604    16453    pedido idPedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN "idPedido" SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 @   ALTER TABLE public.pedido ALTER COLUMN "idPedido" DROP DEFAULT;
       public          postgres    false    224    223            L           2604    16454    producto idProducto    DEFAULT     }   ALTER TABLE ONLY public.producto ALTER COLUMN "idProducto" SET DEFAULT nextval('public.productos_idproducto_seq'::regclass);
 D   ALTER TABLE public.producto ALTER COLUMN "idProducto" DROP DEFAULT;
       public          postgres    false    226    225            M           2604    16455    reseña idReseña    DEFAULT        ALTER TABLE ONLY public."reseña" ALTER COLUMN "idReseña" SET DEFAULT nextval('public."reseña_idcomentario_seq"'::regclass);
 D   ALTER TABLE public."reseña" ALTER COLUMN "idReseña" DROP DEFAULT;
       public          postgres    false    228    227            N           2604    16456    tarjeta idTarjeta    DEFAULT     x   ALTER TABLE ONLY public.tarjeta ALTER COLUMN "idTarjeta" SET DEFAULT nextval('public.tarjeta_idtarjeta_seq'::regclass);
 B   ALTER TABLE public.tarjeta ALTER COLUMN "idTarjeta" DROP DEFAULT;
       public          postgres    false    230    229            O           2604    16457    tienda idTienda    DEFAULT     t   ALTER TABLE ONLY public.tienda ALTER COLUMN "idTienda" SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 @   ALTER TABLE public.tienda ALTER COLUMN "idTienda" DROP DEFAULT;
       public          postgres    false    232    231            P           2604    16458    tipoproducto idTipoProducto    DEFAULT     �   ALTER TABLE ONLY public.tipoproducto ALTER COLUMN "idTipoProducto" SET DEFAULT nextval('public."tipoproducto_idTipoProducto_seq"'::regclass);
 L   ALTER TABLE public.tipoproducto ALTER COLUMN "idTipoProducto" DROP DEFAULT;
       public          postgres    false    234    233                      0    16399    carrito 
   TABLE DATA                 public          postgres    false    215   �l                 0    16403    cliente 
   TABLE DATA                 public          postgres    false    217   �m                 0    16409    detallePedido 
   TABLE DATA                 public          postgres    false    219   �o       
          0    16413    favorito 
   TABLE DATA                 public          postgres    false    221   �o                 0    16419    pedido 
   TABLE DATA                 public          postgres    false    223   up                 0    16423    producto 
   TABLE DATA                 public          postgres    false    225   �p                 0    16429    reseña 
   TABLE DATA                 public          postgres    false    227   �z                 0    16433    tarjeta 
   TABLE DATA                 public          postgres    false    229   {                 0    16437    tienda 
   TABLE DATA                 public          postgres    false    231   �{                 0    16443    tipoproducto 
   TABLE DATA                 public          postgres    false    233   �}       (           0    0    carrito_idCarrito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."carrito_idCarrito_seq"', 26, true);
          public          postgres    false    216            )           0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 8, true);
          public          postgres    false    218            *           0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 2, true);
          public          postgres    false    220            +           0    0    favorito_idfavorito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.favorito_idfavorito_seq', 55, true);
          public          postgres    false    222            ,           0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 2, true);
          public          postgres    false    224            -           0    0    productos_idproducto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_idproducto_seq', 45, true);
          public          postgres    false    226            .           0    0    reseña_idcomentario_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."reseña_idcomentario_seq"', 9, true);
          public          postgres    false    228            /           0    0    tarjeta_idtarjeta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tarjeta_idtarjeta_seq', 2, true);
          public          postgres    false    230            0           0    0    tienda_idtienda_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 8, true);
          public          postgres    false    232            1           0    0    tipoproducto_idTipoProducto_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."tipoproducto_idTipoProducto_seq"', 10, true);
          public          postgres    false    234            R           2606    16460    carrito carrito_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY ("idCarrito");
 >   ALTER TABLE ONLY public.carrito DROP CONSTRAINT carrito_pkey;
       public            postgres    false    215            V           2606    16462    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY ("idCliente");
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    217            X           2606    16464     detallePedido detallepedido_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY ("idDetallePedido");
 L   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    219            \           2606    16466    favorito favorito_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_pkey PRIMARY KEY ("idFavorito");
 @   ALTER TABLE ONLY public.favorito DROP CONSTRAINT favorito_pkey;
       public            postgres    false    221            ^           2606    16468    pedido pedido_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY ("idPedido");
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    223            `           2606    16470    producto productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT productos_pkey PRIMARY KEY ("idProducto");
 A   ALTER TABLE ONLY public.producto DROP CONSTRAINT productos_pkey;
       public            postgres    false    225            b           2606    16472    reseña reseña_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY ("idReseña");
 B   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_pkey";
       public            postgres    false    227            d           2606    16474    tarjeta tarjeta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY ("idTarjeta");
 >   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT tarjeta_pkey;
       public            postgres    false    229            f           2606    16476    tienda tienda_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY ("idTienda");
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public            postgres    false    231            h           2606    16478    tipoproducto tipoproducto_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipoproducto
    ADD CONSTRAINT tipoproducto_pkey PRIMARY KEY ("idTipoProducto");
 H   ALTER TABLE ONLY public.tipoproducto DROP CONSTRAINT tipoproducto_pkey;
       public            postgres    false    233            S           1259    16479    fki_carrito_idCliente_fkey    INDEX     W   CREATE INDEX "fki_carrito_idCliente_fkey" ON public.carrito USING btree ("idCliente");
 0   DROP INDEX public."fki_carrito_idCliente_fkey";
       public            postgres    false    215            T           1259    16480    fki_carrito_idProducto_fkey    INDEX     Y   CREATE INDEX "fki_carrito_idProducto_fkey" ON public.carrito USING btree ("idProducto");
 1   DROP INDEX public."fki_carrito_idProducto_fkey";
       public            postgres    false    215            Y           1259    16481    fki_detallepedido_idPedido_fkey    INDEX     c   CREATE INDEX "fki_detallepedido_idPedido_fkey" ON public."detallePedido" USING btree ("idPedido");
 5   DROP INDEX public."fki_detallepedido_idPedido_fkey";
       public            postgres    false    219            Z           1259    16482 !   fki_detallepedido_idProducto_fkey    INDEX     g   CREATE INDEX "fki_detallepedido_idProducto_fkey" ON public."detallePedido" USING btree ("idProducto");
 7   DROP INDEX public."fki_detallepedido_idProducto_fkey";
       public            postgres    false    219            i           2606    16483    carrito carrito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT "carrito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.carrito DROP CONSTRAINT "carrito_idCliente_fkey";
       public          postgres    false    215    4694    217            j           2606    16488    carrito carrito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT "carrito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 K   ALTER TABLE ONLY public.carrito DROP CONSTRAINT "carrito_idProducto_fkey";
       public          postgres    false    215    4704    225            k           2606    16493 )   detallePedido detallepedido_idPedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallepedido_idPedido_fkey" FOREIGN KEY ("idPedido") REFERENCES public.pedido("idPedido") NOT VALID;
 W   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallepedido_idPedido_fkey";
       public          postgres    false    219    223    4702            l           2606    16498 +   detallePedido detallepedido_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallepedido_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 Y   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallepedido_idProducto_fkey";
       public          postgres    false    4704    219    225            m           2606    16503     favorito favorito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idCliente_fkey";
       public          postgres    false    221    217    4694            n           2606    16508 !   favorito favorito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 M   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idProducto_fkey";
       public          postgres    false    225    4704    221            o           2606    16513    pedido pedido_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT "pedido_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT "pedido_idCliente_fkey";
       public          postgres    false    4694    223    217            p           2606    16518    producto producto_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTienda_fkey";
       public          postgres    false    225    231    4710            q           2606    16523 %   producto producto_idTipoProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTipoProducto_fkey" FOREIGN KEY ("idTipoProducto") REFERENCES public.tipoproducto("idTipoProducto") NOT VALID;
 Q   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTipoProducto_fkey";
       public          postgres    false    225    4712    233            r           2606    16528    reseña reseña_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idCliente_fkey";
       public          postgres    false    4694    217    227            s           2606    16533    reseña reseña_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idTienda_fkey";
       public          postgres    false    231    227    4710            t           2606    16538    tarjeta tarjeta_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT "tarjeta_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT "tarjeta_idCliente_fkey";
       public          postgres    false    4694    229    217               �   x�����0�����@B�iJ'��u7bH�饿��I�Nm s�������$+�DIV�c�tm���ah����h��!6r�g#�b8��m8^��?�E<�Çg>\����L���f�5��@�Ϩ4�U�ZW���t6 ���g��J�7������% ǔ�����&$@1�x�A�k�tq@邳9��v�L�_�4���}�G�	�������3��A���7@o��         2  x���]o�0���+r�MZ�7�&��I��M��D��@b0����"��&m���������6��ӝ����5��RD~�O
ޘ��]�i|ҿ4���Q�T��[�*⬪���� �"��e�|]����u�!A#��,�������{_p�e^�r!�R��MY�����O!Դ��!� #��_��J`�%I�o*-�gɁ��)���Z-�
�x��'���S/ϟe�Z<Ne��Ͱ(��k�-B�
���\�)뤨�o{m�2`ҿM6�*�83�t/��i��]�;�cO�d��x�u�=vO��I0����WV�f ]�(C@��� ��4jR���ˑSSw-��͜��j5D�\�hɬh�ն�eF<x�n��#�owt� s���x8ٓ%n�w��z�oV���SJ��� bU��8������Xf�;����N�t�s�L�4����ճ���<����9������kD��=��Y�a���Aj�ux'S	�(�Cy�)����x���1�G��NY��n=_��}G�6��_{�'�ɻL��X�@�T'���'���         
   x���          
   q   x���v
Q���W((M��L�KK,�/�,�Ws�	uV�0�Q0"#Mk.O"���(���BG��܄H��͉Tnt<�S"��=kD��L ���������� ��lx         
   x���             
  x��X�R�H���Я�[%Y����Jm��0�!@�f���%��Yr$�f_ja_lo��2@�dv���j�=��s������ŕ79�:�拤,�Ѽ��E��އ����K�/�������]�;�=F�=����0\RF��]7oö�,�,���3�:�"%I�5�X�(��2%sE��4I"MB�߳[2�u>oq�e.c!�:�I_�q��#�/�Y�FB�x�\!�*�����}�u�K������'���\Կ����6���4�����򷃿���d�,,��t�h���,�́�,x|<ݶ�kG���+fzjZ��F ��0p��2.��짱˟� ��eR�T0Mi"M�����r�cE���rT����>]�A�O�O#�*�!�aR�f����U�B�n������pq_{�ō��9,�6 ���+b<��&�iV��|�LېS!.���}]�����s�)!$��bZT�S�鲞����o#�T�0
p���W��N�
v�	�Ҙ�I�ӛ�qc�
<� Y�Dy��F��	�u���0��+�o�����\uQF��(-�E��ݨ2]���i���p#%�$B
+�D�DRiEy"Ҝ%�K���!�,b$K��2�똱O|��#龨[�{��?�^�O�N��ɛ�w5�8��>^�\��M��v�-�:0��<�3}_Wz�W�M���<�K�y݄��]umH��rz�SѦ�{��jz��_V��Tʔh$�:U:y�R�d�J��9��di�䔐,O0c�H%��6�	><R=1GvGK���u�w[��zK]e Bb��ȉkЃ���P��[̏g�t'�x�:~��].~<�_z�+`ff��Jrи~�� �z��p1��]4n������{ؐy��\-�<��4���62Lz�v��Ia�����6���iF���$��V7��m݆Eւx0�� BȾ�~�JЈSL@\��/�E�]���_^�bzݹK��Mڽꚅ�Ih{F0��e1(�mݤ���h����b���Δ�۹.���W�Ek�6��ЊeX@�$ٹ{<���@D��݉��ֳ�eb���d��
]:q�.b"�/�K*��f^7]�B?�|�$8��F�� #ɂÓ�럃�8�:�����`�D�Q�%vG�M�{V#��QwEuc�U�e�x�W�"ɷ��mrgEW�*��"1.ܶ��]DB�UH)�g��O�ݢ�Af�9���@91�s`o( ��5�e�qp_&�*O(h��J10��p%K���F�ƥU���B�d��-6�S7�ڷ�@�%{�@U.�v�Lu9���4�\�DD2B�Sk�	��
H:�<"!���Ӑ]u��އۨ���G�]���ێ����7�6ͫ�4}��/���Y�L><����_��GGo��.�i����VDO|7���ܘ����a,B,��%�l=�o�����N���w�g[��"݀`��տ3�����ض���O�w� ����F+P�P����X���SI�NM��\/�.t�b��.����従÷wt�VgZ�|1�����v�LddM�",P��&�n`�UpuffVk�3���0/����N@��!\A�-s��L�|����`!`�ؾ����o��>�{c�7S�:_fڲ��6�J�'���pv߱�1Pj��^�l�S�����YLl��ħHX�ͨ���y��m��*�����t�{�D��)Y)�T�ՙ��E�f9�_���6h�Ł
3m��*�y�a��z�Qi?C�&2W�'V��N���;�����C�n����)�(��(a��A�q|~q�n#\�J�x0��'��L��Wܴ��޽�NJ���ql����yV:B)����eX*�۞�L°��"�rJ0���0%��&%�J��3 _A`U���]7�98~��<���� �o �>�0��Xҍ\�#�k��`��v[h�C�a�JI�4g
̚ ��9�`(���C#Z��K��N[�>Is=�Ɂ42P���j[�['�+%�F!#La�A,F1���E0�c>V�z���e�}~%��d
&���W�^/�{�ԋ*k�SÃo\�Luu�[{�|�l%}H�$"hMSZ��1J�|���]�oĉ(����ID0�����1�;�ں�sK$��h)�{���`�#���#IԮ��O��~Y�p�9 Ǌ�ft^7j�%��xn�\�Z��~�6@��1�0��U��ǟ83�q��
}Kpv�������^.뺽�ޖ�f���'��d����o��]j�D�l��t��#�I%~�G���rH��}����br<9�\�-7#�o�ֈ�������t8J����p�b����;����W'�D&�$E�]I��9������81I�s�=|pPz����:�ϐ㏁�oA��x�)�uιNo@�l^H߭y�ӄ:�b[E%#�:3v1�
���6��	e
F%���x�D�$��e8�p[hou۳�U�mt�X��Z��g>l5� m"(b�r����}���/����Q         j   x���v
Q���W((M��L�S*J-N=�1QI!��'�5XA�PG�DG�HGAݷ�R!�45O!�4=�HQ]G�TӚ˓C,���	�Tp
u�S�	uwRT��� ��'(         �   x���v
Q���W((M��L�+I,�J-ITs�	uV�0�QP�M,*��Sp�J-,�L�QJLJ-R�Q0�Q02ʛ�����X���Y@YCMk.O���h�)P����L����\����H����j ��4�           x����n�0����+H8v��_���	Ub-bܝ�Np�ؑ㬰��Yx1��IN,'���~^o�n>��z�ۢ~,[UENI- }Y}���Co�wh�Q�kUI�����O`A���x�H�{L�����S�͹~X�I� ��T�D��HO*.x��o�L��y&2^Т��H)��3a� ��Fj9�3��P_�g�$f�~O��XGt�,G������M�/��Г������������%�V�!X�#�gq��^�?�UF��N�Xr�qe��ڑ�o/J���Sh	�;��g|6�����U(��J�T�8c�ul;�zԑ�����=iwro,>v�Bb86��ݨ�9	p:	�.SHC����Vf�#�te�'�R�xi��2PQ���)sƪ�ϳ_��&2�E]�\ĉ��:+YWqUSNyLkȪ���@.������z{��^�vV��QYp-R��2-��t�_��!�����9/�3֟�Ӵ�-T�8����:)�<a�99����'��~�k&*         �  x���]��F���Wp�V�0�_���NC6�z�f�Y�����$��=&��DQ���1>z�{����m��v4��.G���|��&6m,�y�����}��D�Y�*��{��)5�[����>��0�c5v->5(�u
u���]�aF�ń����ʵ�1V�h���CQʥ�?�z3{%���� ���*S���Gz,ܥ؆`0�c�(��밇���F>H)�w�?<���̩&�Xb5܍AJD�M��*��@��`������р,���P�"�j�o���RD��3�W�q�U�3!���-C�0q�]�\J6������nX�TS��|n�m(�d��Q���Ry��y��r+��D��[q!p˳(�P[�c��e��i� sI��3�΄@�ІQ-��œ��0�!R+�[�:�C�Ð�f�ab^��\��bZԅ���)�ˇr���1VSn� y��
.���0�"���\�=i�b������uۨ�?�����k�;D�m^�*bI�'��{�q��ہ�R������󸣻�2
��/����)�/��PtMl��	�?�u!u灸��c����(����&�U����t6�l�4C����>Nֳ�l����4�����ٺ����7��J(��W����ݏ��N�W�kE������.�\��B�U�MW��v2�������v9G}��gx!:`Wx{搅K�ym���9�N��*��������X�`E���%_$�     