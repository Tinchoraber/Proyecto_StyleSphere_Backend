PGDMP  $    9                |            StyleSphere_BD    16.3    16.3 Z               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25634    StyleSphere_BD    DATABASE     �   CREATE DATABASE "StyleSphere_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
     DROP DATABASE "StyleSphere_BD";
                postgres    false            �            1259    25635    carrito    TABLE     �   CREATE TABLE public.carrito (
    "idCarrito" integer NOT NULL,
    "idProducto" integer NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.carrito;
       public         heap    postgres    false            �            1259    25638    carrito_idCarrito_seq    SEQUENCE     �   CREATE SEQUENCE public."carrito_idCarrito_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."carrito_idCarrito_seq";
       public          postgres    false    215                       0    0    carrito_idCarrito_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."carrito_idCarrito_seq" OWNED BY public.carrito."idCarrito";
          public          postgres    false    216            �            1259    25639    cliente    TABLE     w  CREATE TABLE public.cliente (
    "idCliente" integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    "correoElectronico" character varying(100) NOT NULL,
    "contraseña" character varying(50) NOT NULL,
    celular character varying(50),
    "fotoPerfil" character varying(300),
    idclientgoogle character varying
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    25644    cliente_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cliente_idcliente_seq;
       public          postgres    false    217                       0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente."idCliente";
          public          postgres    false    218            �            1259    25645    detallePedido    TABLE     �   CREATE TABLE public."detallePedido" (
    "idDetallePedido" integer NOT NULL,
    "idProducto" integer NOT NULL,
    cantidad integer NOT NULL,
    "idPedido" integer NOT NULL
);
 #   DROP TABLE public."detallePedido";
       public         heap    postgres    false            �            1259    25648 !   detallepedido_iddetallepedido_seq    SEQUENCE     �   CREATE SEQUENCE public.detallepedido_iddetallepedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallepedido_iddetallepedido_seq;
       public          postgres    false    219                        0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.detallepedido_iddetallepedido_seq OWNED BY public."detallePedido"."idDetallePedido";
          public          postgres    false    220            �            1259    25649    favorito    TABLE     �   CREATE TABLE public.favorito (
    "idFavorito" integer NOT NULL,
    "idCliente" integer NOT NULL,
    "idProducto" integer NOT NULL
);
    DROP TABLE public.favorito;
       public         heap    postgres    false            �            1259    25652    favorito_idfavorito_seq    SEQUENCE     �   CREATE SEQUENCE public.favorito_idfavorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.favorito_idfavorito_seq;
       public          postgres    false    221            !           0    0    favorito_idfavorito_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.favorito_idfavorito_seq OWNED BY public.favorito."idFavorito";
          public          postgres    false    222            �            1259    25653    pedido    TABLE     '  CREATE TABLE public.pedido (
    "idPedido" integer NOT NULL,
    completado boolean NOT NULL,
    "metodoDePago" boolean NOT NULL,
    "tarifaDeServicio" double precision NOT NULL,
    descuento integer NOT NULL,
    "precioFinal" double precision NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    25656    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    223            "           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido."idPedido";
          public          postgres    false    224            �            1259    25657    producto    TABLE     �  CREATE TABLE public.producto (
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
       public         heap    postgres    false            �            1259    25660    productos_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.productos_idproducto_seq;
       public          postgres    false    225            #           0    0    productos_idproducto_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.productos_idproducto_seq OWNED BY public.producto."idProducto";
          public          postgres    false    226            �            1259    25661    reseña    TABLE     �   CREATE TABLE public."reseña" (
    "idReseña" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idCliente" integer NOT NULL,
    comentario character varying(200) NOT NULL,
    valoracion integer NOT NULL
);
    DROP TABLE public."reseña";
       public         heap    postgres    false            �            1259    25664    reseña_idcomentario_seq    SEQUENCE     �   CREATE SEQUENCE public."reseña_idcomentario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."reseña_idcomentario_seq";
       public          postgres    false    227            $           0    0    reseña_idcomentario_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public."reseña_idcomentario_seq" OWNED BY public."reseña"."idReseña";
          public          postgres    false    228            �            1259    25665    tarjeta    TABLE     4  CREATE TABLE public.tarjeta (
    "idTarjeta" integer NOT NULL,
    "nombreDelTitular" character varying(100) NOT NULL,
    "fechaInicioVencimiento" integer NOT NULL,
    "fechaTerminadoVencimiento" integer NOT NULL,
    "numeroDeTarjeta" character varying(100) NOT NULL,
    "idCliente" integer NOT NULL
);
    DROP TABLE public.tarjeta;
       public         heap    postgres    false            �            1259    25668    tarjeta_idtarjeta_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_idtarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tarjeta_idtarjeta_seq;
       public          postgres    false    229            %           0    0    tarjeta_idtarjeta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarjeta_idtarjeta_seq OWNED BY public.tarjeta."idTarjeta";
          public          postgres    false    230            �            1259    25669    tienda    TABLE     �  CREATE TABLE public.tienda (
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
       public         heap    postgres    false            �            1259    25674    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public          postgres    false    231            &           0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda."idTienda";
          public          postgres    false    232            �            1259    25675    tipoproducto    TABLE     �   CREATE TABLE public.tipoproducto (
    "idTipoProducto" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    imagen character varying(200) NOT NULL,
    "cantidadVentas" numeric NOT NULL
);
     DROP TABLE public.tipoproducto;
       public         heap    postgres    false            �            1259    25680    tipoproducto_idTipoProducto_seq    SEQUENCE     �   CREATE SEQUENCE public."tipoproducto_idTipoProducto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."tipoproducto_idTipoProducto_seq";
       public          postgres    false    233            '           0    0    tipoproducto_idTipoProducto_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."tipoproducto_idTipoProducto_seq" OWNED BY public.tipoproducto."idTipoProducto";
          public          postgres    false    234            G           2604    25681    carrito idCarrito    DEFAULT     z   ALTER TABLE ONLY public.carrito ALTER COLUMN "idCarrito" SET DEFAULT nextval('public."carrito_idCarrito_seq"'::regclass);
 B   ALTER TABLE public.carrito ALTER COLUMN "idCarrito" DROP DEFAULT;
       public          postgres    false    216    215            H           2604    25682    cliente idCliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN "idCliente" SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 B   ALTER TABLE public.cliente ALTER COLUMN "idCliente" DROP DEFAULT;
       public          postgres    false    218    217            I           2604    25683    detallePedido idDetallePedido    DEFAULT     �   ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "idDetallePedido" SET DEFAULT nextval('public.detallepedido_iddetallepedido_seq'::regclass);
 P   ALTER TABLE public."detallePedido" ALTER COLUMN "idDetallePedido" DROP DEFAULT;
       public          postgres    false    220    219            J           2604    25684    favorito idFavorito    DEFAULT     |   ALTER TABLE ONLY public.favorito ALTER COLUMN "idFavorito" SET DEFAULT nextval('public.favorito_idfavorito_seq'::regclass);
 D   ALTER TABLE public.favorito ALTER COLUMN "idFavorito" DROP DEFAULT;
       public          postgres    false    222    221            K           2604    25685    pedido idPedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN "idPedido" SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 @   ALTER TABLE public.pedido ALTER COLUMN "idPedido" DROP DEFAULT;
       public          postgres    false    224    223            L           2604    25686    producto idProducto    DEFAULT     }   ALTER TABLE ONLY public.producto ALTER COLUMN "idProducto" SET DEFAULT nextval('public.productos_idproducto_seq'::regclass);
 D   ALTER TABLE public.producto ALTER COLUMN "idProducto" DROP DEFAULT;
       public          postgres    false    226    225            M           2604    25687    reseña idReseña    DEFAULT        ALTER TABLE ONLY public."reseña" ALTER COLUMN "idReseña" SET DEFAULT nextval('public."reseña_idcomentario_seq"'::regclass);
 D   ALTER TABLE public."reseña" ALTER COLUMN "idReseña" DROP DEFAULT;
       public          postgres    false    228    227            N           2604    25688    tarjeta idTarjeta    DEFAULT     x   ALTER TABLE ONLY public.tarjeta ALTER COLUMN "idTarjeta" SET DEFAULT nextval('public.tarjeta_idtarjeta_seq'::regclass);
 B   ALTER TABLE public.tarjeta ALTER COLUMN "idTarjeta" DROP DEFAULT;
       public          postgres    false    230    229            O           2604    25689    tienda idTienda    DEFAULT     t   ALTER TABLE ONLY public.tienda ALTER COLUMN "idTienda" SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 @   ALTER TABLE public.tienda ALTER COLUMN "idTienda" DROP DEFAULT;
       public          postgres    false    232    231            P           2604    25690    tipoproducto idTipoProducto    DEFAULT     �   ALTER TABLE ONLY public.tipoproducto ALTER COLUMN "idTipoProducto" SET DEFAULT nextval('public."tipoproducto_idTipoProducto_seq"'::regclass);
 L   ALTER TABLE public.tipoproducto ALTER COLUMN "idTipoProducto" DROP DEFAULT;
       public          postgres    false    234    233                      0    25635    carrito 
   TABLE DATA           I   COPY public.carrito ("idCarrito", "idProducto", "idCliente") FROM stdin;
    public          postgres    false    215   �p                 0    25639    cliente 
   TABLE DATA           �   COPY public.cliente ("idCliente", nombre, apellido, "correoElectronico", "contraseña", celular, "fotoPerfil", idclientgoogle) FROM stdin;
    public          postgres    false    217   �p                 0    25645    detallePedido 
   TABLE DATA           `   COPY public."detallePedido" ("idDetallePedido", "idProducto", cantidad, "idPedido") FROM stdin;
    public          postgres    false    219   �q       
          0    25649    favorito 
   TABLE DATA           K   COPY public.favorito ("idFavorito", "idCliente", "idProducto") FROM stdin;
    public          postgres    false    221   r                 0    25653    pedido 
   TABLE DATA           �   COPY public.pedido ("idPedido", completado, "metodoDePago", "tarifaDeServicio", descuento, "precioFinal", "idCliente") FROM stdin;
    public          postgres    false    223   Nr                 0    25657    producto 
   TABLE DATA           �   COPY public.producto ("idProducto", nombre, precio, talle, color, "cantidadStock", "idTienda", "idTipoProducto", "cantidadVentas", imagen) FROM stdin;
    public          postgres    false    225   kr                 0    25661    reseña 
   TABLE DATA           a   COPY public."reseña" ("idReseña", "idTienda", "idCliente", comentario, valoracion) FROM stdin;
    public          postgres    false    227   o{                 0    25665    tarjeta 
   TABLE DATA           �   COPY public.tarjeta ("idTarjeta", "nombreDelTitular", "fechaInicioVencimiento", "fechaTerminadoVencimiento", "numeroDeTarjeta", "idCliente") FROM stdin;
    public          postgres    false    229   �{                 0    25669    tienda 
   TABLE DATA           �   COPY public.tienda ("idTienda", nombre, direccion, "horarioApertura", "horarioClausura", "imagenTienda", "cantidadVentas", marca) FROM stdin;
    public          postgres    false    231   �{                 0    25675    tipoproducto 
   TABLE DATA           Z   COPY public.tipoproducto ("idTipoProducto", nombre, imagen, "cantidadVentas") FROM stdin;
    public          postgres    false    233   �}       (           0    0    carrito_idCarrito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."carrito_idCarrito_seq"', 1, false);
          public          postgres    false    216            )           0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 4, true);
          public          postgres    false    218            *           0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 2, true);
          public          postgres    false    220            +           0    0    favorito_idfavorito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.favorito_idfavorito_seq', 11, true);
          public          postgres    false    222            ,           0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 2, true);
          public          postgres    false    224            -           0    0    productos_idproducto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_idproducto_seq', 45, true);
          public          postgres    false    226            .           0    0    reseña_idcomentario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reseña_idcomentario_seq"', 1, false);
          public          postgres    false    228            /           0    0    tarjeta_idtarjeta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tarjeta_idtarjeta_seq', 2, true);
          public          postgres    false    230            0           0    0    tienda_idtienda_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 8, true);
          public          postgres    false    232            1           0    0    tipoproducto_idTipoProducto_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."tipoproducto_idTipoProducto_seq"', 10, true);
          public          postgres    false    234            R           2606    25692    carrito carrito_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY ("idCarrito");
 >   ALTER TABLE ONLY public.carrito DROP CONSTRAINT carrito_pkey;
       public            postgres    false    215            V           2606    25694    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY ("idCliente");
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    217            X           2606    25696     detallePedido detallepedido_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY ("idDetallePedido");
 L   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    219            \           2606    25698    favorito favorito_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_pkey PRIMARY KEY ("idFavorito");
 @   ALTER TABLE ONLY public.favorito DROP CONSTRAINT favorito_pkey;
       public            postgres    false    221            ^           2606    25700    pedido pedido_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY ("idPedido");
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    223            `           2606    25702    producto productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT productos_pkey PRIMARY KEY ("idProducto");
 A   ALTER TABLE ONLY public.producto DROP CONSTRAINT productos_pkey;
       public            postgres    false    225            b           2606    25704    reseña reseña_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY ("idReseña");
 B   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_pkey";
       public            postgres    false    227            d           2606    25706    tarjeta tarjeta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY ("idTarjeta");
 >   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT tarjeta_pkey;
       public            postgres    false    229            f           2606    25708    tienda tienda_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY ("idTienda");
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public            postgres    false    231            h           2606    25710    tipoproducto tipoproducto_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipoproducto
    ADD CONSTRAINT tipoproducto_pkey PRIMARY KEY ("idTipoProducto");
 H   ALTER TABLE ONLY public.tipoproducto DROP CONSTRAINT tipoproducto_pkey;
       public            postgres    false    233            S           1259    25711    fki_carrito_idCliente_fkey    INDEX     W   CREATE INDEX "fki_carrito_idCliente_fkey" ON public.carrito USING btree ("idCliente");
 0   DROP INDEX public."fki_carrito_idCliente_fkey";
       public            postgres    false    215            T           1259    25712    fki_carrito_idProducto_fkey    INDEX     Y   CREATE INDEX "fki_carrito_idProducto_fkey" ON public.carrito USING btree ("idProducto");
 1   DROP INDEX public."fki_carrito_idProducto_fkey";
       public            postgres    false    215            Y           1259    25713    fki_detallepedido_idPedido_fkey    INDEX     c   CREATE INDEX "fki_detallepedido_idPedido_fkey" ON public."detallePedido" USING btree ("idPedido");
 5   DROP INDEX public."fki_detallepedido_idPedido_fkey";
       public            postgres    false    219            Z           1259    25714 !   fki_detallepedido_idProducto_fkey    INDEX     g   CREATE INDEX "fki_detallepedido_idProducto_fkey" ON public."detallePedido" USING btree ("idProducto");
 7   DROP INDEX public."fki_detallepedido_idProducto_fkey";
       public            postgres    false    219            i           2606    25715    carrito carrito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT "carrito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.carrito DROP CONSTRAINT "carrito_idCliente_fkey";
       public          postgres    false    215    217    4694            j           2606    25720    carrito carrito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT "carrito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 K   ALTER TABLE ONLY public.carrito DROP CONSTRAINT "carrito_idProducto_fkey";
       public          postgres    false    225    215    4704            k           2606    25725 )   detallePedido detallepedido_idPedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallepedido_idPedido_fkey" FOREIGN KEY ("idPedido") REFERENCES public.pedido("idPedido") NOT VALID;
 W   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallepedido_idPedido_fkey";
       public          postgres    false    4702    219    223            l           2606    25730 +   detallePedido detallepedido_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallepedido_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 Y   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT "detallepedido_idProducto_fkey";
       public          postgres    false    225    4704    219            m           2606    25735     favorito favorito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idCliente_fkey";
       public          postgres    false    217    4694    221            n           2606    25740 !   favorito favorito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 M   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idProducto_fkey";
       public          postgres    false    221    4704    225            o           2606    25745    pedido pedido_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT "pedido_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT "pedido_idCliente_fkey";
       public          postgres    false    4694    217    223            p           2606    25750    producto producto_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTienda_fkey";
       public          postgres    false    225    4710    231            q           2606    25755 %   producto producto_idTipoProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTipoProducto_fkey" FOREIGN KEY ("idTipoProducto") REFERENCES public.tipoproducto("idTipoProducto") NOT VALID;
 Q   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTipoProducto_fkey";
       public          postgres    false    233    225    4712            r           2606    25760    reseña reseña_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idCliente_fkey";
       public          postgres    false    227    4694    217            s           2606    25765    reseña reseña_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idTienda_fkey";
       public          postgres    false    231    227    4710            t           2606    25770    tarjeta tarjeta_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT "tarjeta_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT "tarjeta_idCliente_fkey";
       public          postgres    false    229    217    4694                  x������ � �           x���[O�0���(-�kb�u����q����@(�UY�eC�>�Lr&��|9�b��FkQ�u�$Q����K�拐!�YL�c��+7^4e%�J�d�ݡnou?�_��0�EISF��"(Z7e���]��Р��/��i,����O���0���g+��&Pmmo�@�į *%ߍtm���[ ����Cy���\�g���S����q\^�i��k=~�^]dŒo�u�!ʏ̂����0�4r���$��yߠ2~            x������ � �      
   $   x�3�4�44�2�4Q�Ɯ�&\� �9W� J�R            x������ � �         �  x��X�r�8}��BOy2E�AL�kJ����v����R� (sL2II����Ƕ��L&٭<ȡb	}����c/
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
�4��7p�D�]���\z��܍/�ף���4�y���`�%�6���)_)Da����Z`X"A��[K���>��n"�P��k���T����鰅[�n;H����^�P}�����U�,uSBKa[j��tYPњ�DL�%}R䅯���Hi��7_���ֻ��,WT��"�0�mn� B�E��Z�HUV(�j� �f��xK3x����-�B�/}?�58�Y��?�8��L�Y�}�i�̿������            x������ � �         Z   x�3��M,*��Sp�J-,�L�QJLJ-�4�42�4165�5565�5�01�8��ph1�42�4212�5312�5751ҵ�01j����� zj         �  x�u��r� �k�z!��n�Tιp�L�� ���|��&ϒ���.��ݥ���wW���Y�o���E�#p��\V��@)bl�?c��!�V
�:}���̤��x
��KA�F*�[�vښP��E��[b'���\�rBS���[R2J�R�e���غU;a���P�����3��'`|�C���_����sV�O}\.�"X��vr�q��3�:�T"�,J��@H��:��#�� Y���*X���Y@o9/%���ՙ�N��Ȗ�d<�8&?
���BJ�xZ��;	���+BV��u|�_�����.��9�iuC�Ql1[g�a�vHǅ��Ct�
ct�J���Ȏue_��r�Kj@��^$�]8k�����p�?�a�O�����>�j�mwz����h���(��C�2x?��#�iej�cD'��F���e?�,�����!         �  x����j�0����b/��~��6���,!m�� �j�[��4�~��%��	,�����}͖��u�M߷�{����T}��ͨ���%�kQ�>4=޶���3B-&?�F�E�K�&�>4�m��R�eG�_�P�e3���
M隭C��1�(iǊQܦXn���֣:�� � �9}M����pc��0�� ���f�)���yv��ߝ���Fa�q �C�ʸk�:���RD��3�W�q�U�3!�u,C�0���rH.%�E�ݵ�ݸ�Єj�����R��:Q���Ry��y�r+��D������W�t{+���0v ���J[n�?�T�<c��LT	m�.��Lz�8<W��5���&�Y��e��W�h���p�L!�.��(�����:�IRc���NyE��� �z��cl���f��^i0Ф���n X?#�{q0�^آ,UĒ�� 	���6
�b����
�"�m�7�)⊮ڽPL�}I�l{�M
e��ԏ�`���}��˥���.�9�C)���g��r�Ɠ���M�hq~5�������������ͮ>O�C��w7L3(�x;����<�žz��a�"D���ٗ��3�7t��N'���r|���'truy4?G���"�a� {da��eN	��?N��n7*ݦv}|��y~1>�_PR۽���y��:��     