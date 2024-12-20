PGDMP  "    
    	        
    |            StyleSphere_BD    16.2    16.0 ]    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    16398    StyleSphere_BD    DATABASE     �   CREATE DATABASE "StyleSphere_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
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
       public          postgres    false    215            %           0    0    carrito_idCarrito_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."carrito_idCarrito_seq" OWNED BY public.carrito."idCarrito";
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
       public          postgres    false    217            &           0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente."idCliente";
          public          postgres    false    218            �            1259    16409    detallePedido    TABLE     k   CREATE TABLE public."detallePedido" (
    "idDetallePedido" integer NOT NULL,
    "precioTotal" numeric
);
 #   DROP TABLE public."detallePedido";
       public         heap    postgres    false            �            1259    16414    detallePedido_Carrito    TABLE     �   CREATE TABLE public."detallePedido_Carrito" (
    "idDetallePedido" integer NOT NULL,
    "idCarrito" integer NOT NULL,
    precio numeric
);
 +   DROP TABLE public."detallePedido_Carrito";
       public         heap    postgres    false            �            1259    16419 !   detallepedido_iddetallepedido_seq    SEQUENCE     �   CREATE SEQUENCE public.detallepedido_iddetallepedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallepedido_iddetallepedido_seq;
       public          postgres    false    219            '           0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.detallepedido_iddetallepedido_seq OWNED BY public."detallePedido"."idDetallePedido";
          public          postgres    false    221            �            1259    16420    favorito    TABLE     �   CREATE TABLE public.favorito (
    "idFavorito" integer NOT NULL,
    "idCliente" numeric NOT NULL,
    "idProducto" integer NOT NULL
);
    DROP TABLE public.favorito;
       public         heap    postgres    false            �            1259    16425    favorito_idfavorito_seq    SEQUENCE     �   CREATE SEQUENCE public.favorito_idfavorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.favorito_idfavorito_seq;
       public          postgres    false    222            (           0    0    favorito_idfavorito_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.favorito_idfavorito_seq OWNED BY public.favorito."idFavorito";
          public          postgres    false    223            �            1259    16426    pedido    TABLE     �   CREATE TABLE public.pedido (
    "idPedido" integer NOT NULL,
    "metodoDePago" boolean NOT NULL,
    descuento integer NOT NULL,
    "precioFinal" double precision NOT NULL,
    "idCliente" integer NOT NULL,
    "idDetallePedido" integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16429    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    224            )           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido."idPedido";
          public          postgres    false    225            �            1259    16430    producto    TABLE     �  CREATE TABLE public.producto (
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
       public         heap    postgres    false            �            1259    16435    productos_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.productos_idproducto_seq;
       public          postgres    false    226            *           0    0    productos_idproducto_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.productos_idproducto_seq OWNED BY public.producto."idProducto";
          public          postgres    false    227            �            1259    16436    reseña    TABLE     �   CREATE TABLE public."reseña" (
    "idReseña" integer NOT NULL,
    "idTienda" integer NOT NULL,
    "idCliente" integer NOT NULL,
    comentario character varying(200) NOT NULL,
    valoracion integer NOT NULL
);
    DROP TABLE public."reseña";
       public         heap    postgres    false            �            1259    16439    reseña_idcomentario_seq    SEQUENCE     �   CREATE SEQUENCE public."reseña_idcomentario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."reseña_idcomentario_seq";
       public          postgres    false    228            +           0    0    reseña_idcomentario_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public."reseña_idcomentario_seq" OWNED BY public."reseña"."idReseña";
          public          postgres    false    229            �            1259    16440    tarjeta    TABLE     #  CREATE TABLE public.tarjeta (
    "idTarjeta" integer NOT NULL,
    "nombreDelTitular" character varying(100) NOT NULL,
    "numeroDeTarjeta" character varying(100) NOT NULL,
    "idCliente" integer NOT NULL,
    fechavencimiento character varying(5),
    fechadesde character varying(5)
);
    DROP TABLE public.tarjeta;
       public         heap    postgres    false            �            1259    16443    tarjeta_idtarjeta_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_idtarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tarjeta_idtarjeta_seq;
       public          postgres    false    230            ,           0    0    tarjeta_idtarjeta_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarjeta_idtarjeta_seq OWNED BY public.tarjeta."idTarjeta";
          public          postgres    false    231            �            1259    16444    tienda    TABLE     �  CREATE TABLE public.tienda (
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
       public         heap    postgres    false            �            1259    16449    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public          postgres    false    232            -           0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda."idTienda";
          public          postgres    false    233            �            1259    16450    tipoproducto    TABLE     �   CREATE TABLE public.tipoproducto (
    "idTipoProducto" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    imagen character varying(200) NOT NULL,
    "cantidadVentas" numeric NOT NULL
);
     DROP TABLE public.tipoproducto;
       public         heap    postgres    false            �            1259    16455    tipoproducto_idTipoProducto_seq    SEQUENCE     �   CREATE SEQUENCE public."tipoproducto_idTipoProducto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."tipoproducto_idTipoProducto_seq";
       public          postgres    false    234            .           0    0    tipoproducto_idTipoProducto_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."tipoproducto_idTipoProducto_seq" OWNED BY public.tipoproducto."idTipoProducto";
          public          postgres    false    235            K           2604    16456    carrito idCarrito    DEFAULT     z   ALTER TABLE ONLY public.carrito ALTER COLUMN "idCarrito" SET DEFAULT nextval('public."carrito_idCarrito_seq"'::regclass);
 B   ALTER TABLE public.carrito ALTER COLUMN "idCarrito" DROP DEFAULT;
       public          postgres    false    216    215            L           2604    16457    cliente idCliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN "idCliente" SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 B   ALTER TABLE public.cliente ALTER COLUMN "idCliente" DROP DEFAULT;
       public          postgres    false    218    217            M           2604    16458    detallePedido idDetallePedido    DEFAULT     �   ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "idDetallePedido" SET DEFAULT nextval('public.detallepedido_iddetallepedido_seq'::regclass);
 P   ALTER TABLE public."detallePedido" ALTER COLUMN "idDetallePedido" DROP DEFAULT;
       public          postgres    false    221    219            N           2604    16459    favorito idFavorito    DEFAULT     |   ALTER TABLE ONLY public.favorito ALTER COLUMN "idFavorito" SET DEFAULT nextval('public.favorito_idfavorito_seq'::regclass);
 D   ALTER TABLE public.favorito ALTER COLUMN "idFavorito" DROP DEFAULT;
       public          postgres    false    223    222            O           2604    16460    pedido idPedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN "idPedido" SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 @   ALTER TABLE public.pedido ALTER COLUMN "idPedido" DROP DEFAULT;
       public          postgres    false    225    224            P           2604    16461    producto idProducto    DEFAULT     }   ALTER TABLE ONLY public.producto ALTER COLUMN "idProducto" SET DEFAULT nextval('public.productos_idproducto_seq'::regclass);
 D   ALTER TABLE public.producto ALTER COLUMN "idProducto" DROP DEFAULT;
       public          postgres    false    227    226            Q           2604    16462    reseña idReseña    DEFAULT        ALTER TABLE ONLY public."reseña" ALTER COLUMN "idReseña" SET DEFAULT nextval('public."reseña_idcomentario_seq"'::regclass);
 D   ALTER TABLE public."reseña" ALTER COLUMN "idReseña" DROP DEFAULT;
       public          postgres    false    229    228            R           2604    16463    tarjeta idTarjeta    DEFAULT     x   ALTER TABLE ONLY public.tarjeta ALTER COLUMN "idTarjeta" SET DEFAULT nextval('public.tarjeta_idtarjeta_seq'::regclass);
 B   ALTER TABLE public.tarjeta ALTER COLUMN "idTarjeta" DROP DEFAULT;
       public          postgres    false    231    230            S           2604    16464    tienda idTienda    DEFAULT     t   ALTER TABLE ONLY public.tienda ALTER COLUMN "idTienda" SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 @   ALTER TABLE public.tienda ALTER COLUMN "idTienda" DROP DEFAULT;
       public          postgres    false    233    232            T           2604    16465    tipoproducto idTipoProducto    DEFAULT     �   ALTER TABLE ONLY public.tipoproducto ALTER COLUMN "idTipoProducto" SET DEFAULT nextval('public."tipoproducto_idTipoProducto_seq"'::regclass);
 L   ALTER TABLE public.tipoproducto ALTER COLUMN "idTipoProducto" DROP DEFAULT;
       public          postgres    false    235    234            
          0    16399    carrito 
   TABLE DATA           k   COPY public.carrito ("idCarrito", "idProducto", "idCliente", "cantidadAComprar", talle, color) FROM stdin;
    public          postgres    false    215   u                 0    16403    cliente 
   TABLE DATA           �   COPY public.cliente ("idCliente", nombre, apellido, "correoElectronico", "contraseña", celular, "fotoPerfil", idclientgoogle) FROM stdin;
    public          postgres    false    217   �u                 0    16409    detallePedido 
   TABLE DATA           K   COPY public."detallePedido" ("idDetallePedido", "precioTotal") FROM stdin;
    public          postgres    false    219   �w                 0    16414    detallePedido_Carrito 
   TABLE DATA           Y   COPY public."detallePedido_Carrito" ("idDetallePedido", "idCarrito", precio) FROM stdin;
    public          postgres    false    220   :x                 0    16420    favorito 
   TABLE DATA           K   COPY public.favorito ("idFavorito", "idCliente", "idProducto") FROM stdin;
    public          postgres    false    222   �x                 0    16426    pedido 
   TABLE DATA           v   COPY public.pedido ("idPedido", "metodoDePago", descuento, "precioFinal", "idCliente", "idDetallePedido") FROM stdin;
    public          postgres    false    224   y                 0    16430    producto 
   TABLE DATA           �   COPY public.producto ("idProducto", nombre, precio, "cantidadStock", "idTienda", "idTipoProducto", "cantidadVentas", imagen, talles_disponibles, colores_disponibles) FROM stdin;
    public          postgres    false    226   %y                 0    16436    reseña 
   TABLE DATA           a   COPY public."reseña" ("idReseña", "idTienda", "idCliente", comentario, valoracion) FROM stdin;
    public          postgres    false    228   Ă                 0    16440    tarjeta 
   TABLE DATA           �   COPY public.tarjeta ("idTarjeta", "nombreDelTitular", "numeroDeTarjeta", "idCliente", fechavencimiento, fechadesde) FROM stdin;
    public          postgres    false    230   <�                 0    16444    tienda 
   TABLE DATA           �   COPY public.tienda ("idTienda", nombre, direccion, "horarioApertura", "horarioClausura", "imagenTienda", "cantidadVentas", marca) FROM stdin;
    public          postgres    false    232   ă                 0    16450    tipoproducto 
   TABLE DATA           Z   COPY public.tipoproducto ("idTipoProducto", nombre, imagen, "cantidadVentas") FROM stdin;
    public          postgres    false    234   ��       /           0    0    carrito_idCarrito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."carrito_idCarrito_seq"', 33, true);
          public          postgres    false    216            0           0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 9, true);
          public          postgres    false    218            1           0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 32, true);
          public          postgres    false    221            2           0    0    favorito_idfavorito_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.favorito_idfavorito_seq', 58, true);
          public          postgres    false    223            3           0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 2, true);
          public          postgres    false    225            4           0    0    productos_idproducto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_idproducto_seq', 45, true);
          public          postgres    false    227            5           0    0    reseña_idcomentario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reseña_idcomentario_seq"', 13, true);
          public          postgres    false    229            6           0    0    tarjeta_idtarjeta_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tarjeta_idtarjeta_seq', 15, true);
          public          postgres    false    231            7           0    0    tienda_idtienda_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 8, true);
          public          postgres    false    233            8           0    0    tipoproducto_idTipoProducto_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."tipoproducto_idTipoProducto_seq"', 10, true);
          public          postgres    false    235            V           2606    16467    carrito carrito_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY ("idCarrito");
 >   ALTER TABLE ONLY public.carrito DROP CONSTRAINT carrito_pkey;
       public            postgres    false    215            Z           2606    16469    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY ("idCliente");
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    217            ^           2606    16471 0   detallePedido_Carrito detallePedido_Carrito_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido_Carrito"
    ADD CONSTRAINT "detallePedido_Carrito_pkey" PRIMARY KEY ("idDetallePedido", "idCarrito");
 ^   ALTER TABLE ONLY public."detallePedido_Carrito" DROP CONSTRAINT "detallePedido_Carrito_pkey";
       public            postgres    false    220    220            \           2606    16473     detallePedido detallepedido_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY ("idDetallePedido");
 L   ALTER TABLE ONLY public."detallePedido" DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    219            `           2606    16475    favorito favorito_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT favorito_pkey PRIMARY KEY ("idFavorito");
 @   ALTER TABLE ONLY public.favorito DROP CONSTRAINT favorito_pkey;
       public            postgres    false    222            c           2606    16477    pedido pedido_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY ("idPedido");
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    224            e           2606    16479    producto productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT productos_pkey PRIMARY KEY ("idProducto");
 A   ALTER TABLE ONLY public.producto DROP CONSTRAINT productos_pkey;
       public            postgres    false    226            g           2606    16481    reseña reseña_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY ("idReseña");
 B   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_pkey";
       public            postgres    false    228            i           2606    16483    tarjeta tarjeta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY ("idTarjeta");
 >   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT tarjeta_pkey;
       public            postgres    false    230            k           2606    16485    tienda tienda_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY ("idTienda");
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public            postgres    false    232            m           2606    16487    tipoproducto tipoproducto_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipoproducto
    ADD CONSTRAINT tipoproducto_pkey PRIMARY KEY ("idTipoProducto");
 H   ALTER TABLE ONLY public.tipoproducto DROP CONSTRAINT tipoproducto_pkey;
       public            postgres    false    234            W           1259    16488    fki_carrito_idCliente_fkey    INDEX     W   CREATE INDEX "fki_carrito_idCliente_fkey" ON public.carrito USING btree ("idCliente");
 0   DROP INDEX public."fki_carrito_idCliente_fkey";
       public            postgres    false    215            X           1259    16489    fki_carrito_idProducto_fkey    INDEX     Y   CREATE INDEX "fki_carrito_idProducto_fkey" ON public.carrito USING btree ("idProducto");
 1   DROP INDEX public."fki_carrito_idProducto_fkey";
       public            postgres    false    215            a           1259    16490    fki_i    INDEX     E   CREATE INDEX fki_i ON public.pedido USING btree ("idDetallePedido");
    DROP INDEX public.fki_i;
       public            postgres    false    224            n           2606    16491    carrito carrito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT "carrito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.carrito DROP CONSTRAINT "carrito_idCliente_fkey";
       public          postgres    false    215    4698    217            o           2606    16496    carrito carrito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT "carrito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 K   ALTER TABLE ONLY public.carrito DROP CONSTRAINT "carrito_idProducto_fkey";
       public          postgres    false    215    4709    226            p           2606    16501 :   detallePedido_Carrito detallePedido_Carrito_idCarrito_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido_Carrito"
    ADD CONSTRAINT "detallePedido_Carrito_idCarrito_fkey" FOREIGN KEY ("idCarrito") REFERENCES public.carrito("idCarrito");
 h   ALTER TABLE ONLY public."detallePedido_Carrito" DROP CONSTRAINT "detallePedido_Carrito_idCarrito_fkey";
       public          postgres    false    220    4694    215            q           2606    16506 @   detallePedido_Carrito detallePedido_Carrito_idDetallePedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."detallePedido_Carrito"
    ADD CONSTRAINT "detallePedido_Carrito_idDetallePedido_fkey" FOREIGN KEY ("idDetallePedido") REFERENCES public."detallePedido"("idDetallePedido");
 n   ALTER TABLE ONLY public."detallePedido_Carrito" DROP CONSTRAINT "detallePedido_Carrito_idDetallePedido_fkey";
       public          postgres    false    219    220    4700            r           2606    16511     favorito favorito_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idCliente_fkey";
       public          postgres    false    4698    222    217            s           2606    16516 !   favorito favorito_idProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorito
    ADD CONSTRAINT "favorito_idProducto_fkey" FOREIGN KEY ("idProducto") REFERENCES public.producto("idProducto") NOT VALID;
 M   ALTER TABLE ONLY public.favorito DROP CONSTRAINT "favorito_idProducto_fkey";
       public          postgres    false    226    222    4709            t           2606    16521    pedido pedido_detallepedidofk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_detallepedidofk FOREIGN KEY ("idDetallePedido") REFERENCES public."detallePedido"("idDetallePedido") NOT VALID;
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_detallepedidofk;
       public          postgres    false    4700    219    224            u           2606    16526    pedido pedido_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT "pedido_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT "pedido_idCliente_fkey";
       public          postgres    false    217    224    4698            v           2606    16531    producto producto_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTienda_fkey";
       public          postgres    false    226    232    4715            w           2606    16536 %   producto producto_idTipoProducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT "producto_idTipoProducto_fkey" FOREIGN KEY ("idTipoProducto") REFERENCES public.tipoproducto("idTipoProducto") NOT VALID;
 Q   ALTER TABLE ONLY public.producto DROP CONSTRAINT "producto_idTipoProducto_fkey";
       public          postgres    false    234    4717    226            x           2606    16541    reseña reseña_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 L   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idCliente_fkey";
       public          postgres    false    4698    217    228            y           2606    16546    reseña reseña_idTienda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idTienda_fkey" FOREIGN KEY ("idTienda") REFERENCES public.tienda("idTienda") NOT VALID;
 K   ALTER TABLE ONLY public."reseña" DROP CONSTRAINT "reseña_idTienda_fkey";
       public          postgres    false    4715    228    232            z           2606    16551    tarjeta tarjeta_idCliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT "tarjeta_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES public.cliente("idCliente") NOT VALID;
 J   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT "tarjeta_idCliente_fkey";
       public          postgres    false    4698    230    217            
   �   x�E���0E��A�-aa)K*
D*����i*�#ߗk0Á�b�[ ����х�H��8�ۘ�����-��Փ@���?/�x	We�}�a��LZl��H-�jsWM�f���!�D�:W�o?3Y�Rv�U����Ƭ��.=���,�W�Sw��"�����5UVHQ�=ʐu��"��%D�           x���kk�@�?�����݅��6is1WI���L�Dg������!�ma�,]83���px����X�����y�i��0q�
tz�0)�,Jń`�:���Z���$�},�H���#�U��Y��ZA�)�7-|�T��H�f������I��KmAtCh&ɿRd�(N:߮K�f:I#�eV�h���B��D
Yk�R��k���rԞ<��b_"�W�����ޓ�q�<R���sw����3������] ,�Ɩi2�a��g̠�u��p��Q�3Y.�>�̦Cz/����%���ȿK></ʪ���G�{AE��
e4����lVM;|�4�[��n1F�I�	!�&�ѹm������t���7yG�w��F9Y\�דQυ�#;E��z�)����M��D;�Fꃷ�44	$�"��z�28�bD�f����B�G�g��x�/oE:���^T�+�;��Wk�܇�L�N��y���8�وpȈ��9�e���Tf���.����~�זa� ��9�         >   x�5�� !C�s(�!*��b�u�r�;d>�*��LL|{a��p�'�G�����MD�i         t   x�U���0�P1��K��#�m��o	-)�FLl3kNLt��qG~��2��S��y�Z��%;�A�ߛt�O~2�4����.����?�Y�!��U�U��t��å���Z� �S2�         :   x����0�f�Vl'����QgH�
s��++6�Qx�l����l��o�=�.D	            x������ � �         �	  x��X�r��}���O~��f�\)ʖ�Z˒J�7�T�P`@abh �dmm~*��K� iY�M�)[T"g���>}���kss��1`��3� �2\����!��^�U>��nƧ�.�)*'�J�,�b�i�KJ���"��Y�e��!��ŚL]��5�˪���T%(�L1E2�u��_҄��n���)�"O���S����*��<������߃���6<6�ֆ?��0��vU��
�`VT��&���,p�8��,�3}7���>�B�MXhB��^�X��Q�im��k��u8����R�\0Mi&M����KF�©�Bķz	ɮk�Ep'�����iR22222 �j���u�� �`ouk'�Օ�\�e�r�� a<�YN˼h�z�t�.�TȌ�����[k���=]}��8'�Ķ��U��8׽�������%��a�	t_qDD骍�ژ�DY���������dX@Ã�����@E�=o�$PG�����F��O
���ymWE	)駍�cD4���)�&	RX�,)$�J�$)3��,㐅�
m�RP�F�L	*<�C�	8����Ep:;���Of����'�g'f>p��@ �ێ��NGFw}��z�om����sT��ץ�=��א��]L�u=_�Tt��V"���^)rï�/q.eN4@�ΕΡ���g��a�$6E^d%%�(3��"QY�D����Jm�ʳ�%T]�����P�B�� �����z%���}uK�^c~���?�����_�A���߫��_���i�d/�CC��q@t���j
%�j������'8�|_�#R�戰�����F<\�]�(/�'[J��i���܌B���U��]\t
#*����_�oM8�$�!�~}]�����KS�/{������7}�2���@ֈg�lF�����mn&8�� �9��)���9�X�:��䠬:�v1�Q�6"a�-�����Dt�A[u#ǎn�o�b�Ht`�ym�J� 	܅N�LR����m{b����#���"Fi��d������?^짾���&�1I������hdS�8س}�\� +�d��s$�o�H�t/��2M��Uf|�]o[�oDb�UL)���-V9�B�����Qa�%������HF�]��4%ro�Z�#����T�a���2��+��H��濍}�$�KǷ�E��ӭ��B�#T��-ǹ���)Lk��Z�d�b�en�m&!�R�	|���K���g9ރw��Ѣ��C���"PÇ������b��e�������N.���'����NO�`�x�{��\M9����5���ɬa,B,���9}�v�����������������N�����L��!/��K &��2?���THY-���:7.��V��LK�#���IS�U�Ǿ�L�#���hs�|��z`2P�ONW(�	f�����}��˴�(mf��Z�f:��8�ϫ"��G�Π�G�o��%-Y!t���O�]X�c����tz�{v`ao����0]]݂Ƙ.��Ӂ�'㻻�՗���k|�:�U�����IJ\[5E�pf�Q5��#&l�r����/+ӛ�;���ӂ�`ߐ���^ڪ�+ �$�Ր�0]��9��m��������>kǹF�&D_�GN~��5�;��ܻ(��֭��Ɍ�2I���Ll
=���SX��]J����}�Q?~�``y��႙6��$_(�qc��^hΕNP�`�bgY�KEK���dkAX�(�9��	�@47L	x��	�����f��M���N�����x4C/{��@���c0x1�tۛ~)��GGK8:*[���G��J�3�%��(�B 2��s."�P����JFs�'�m&P6�$�D
�B;:
���ºn�Y�7�3���	���KQ�S�2,���P�Ծ�t]�_�H�:��Ϩm��p�_�˪��UStw��q"._�Y��=� x�H�U�`�j�ye��x�n�~h��&�(ķ�9IF��d�a�u�[����RD  ��	�#`y�ނ�D@C����Pqp�--�t��� ���X�*ռ���Q_�����R~�%2�`H���,cϺ�;M	HȈ�_�l�?��������Ѻaǜ���&�]���A��}�զ��w��l�
��_"<8�簍$��>�89;<8<������G �4�!�icJ��ּÔ��p��?`�1��c����;�n��Ʌ0�|� ܪ��3�e���F����d0zw�}��g��;l��d����(Ou~n ��܉c�:�;��8� SP[g�L������:�4��a�e=���I^�L��p�'������>�}X 2�g��/�0D�c�Q�����)ʡ�\��|h����իW�7�G         h   x�3�4�4��-�TH*M�S�)MO,R�4��r��F*8���)���;)*�d8M�Z�SS8��9̀����1H(�i�eh�i�%��'��\1z\\\ J�         x   x�5�1
�0�W��uw+�ii\�Q@�!"�Ư�	�լң�ﶻ��j#���!SD
�$/yZ9ؿ��ӷ����F���1yv�+h��t�ew���IT$� �d�c:����'-�"�         �  x�u��r� �k�z!��n�Tιp�L�� ���|��&ϒ���.��ݥ���wW���Y�o���E�#p��\V��@)bl�?c��!�V
�:}���̤��x
��KA�F*�[�vښP��E��[b'���\�rBS���[R2J�R�e���غU;a���P�����3��'`|�C���_����sV�O}\.�"X��vr�q��3�:�T"�,J��@H��:��#�� Y���*X���Y@o9/%���ՙ�N��Ȗ�d<�8&?
���BJ�xZ��;	���+BV��u|�_�����.��9�iuC�Ql1[g�a�vHǅ��Ct�
ct�J���Ȏue_��r�Kj@��^$�]8k�����p�?�a�O�����>�j�mwz����h���(��C�2x?��#�iej�cD'��F���e?�,�����!         �  x����j�0����b/��~��6���,!m�� �j�[��4�~��%��	,�����}͖��u�M߷�{����T}��ͨ���%�kQ�>4=޶���3B-&?�F�E�K�&�>4�m��R�eG�_�P�e3���
M隭C��1�(iǊQܦXn���֣:�� � �9}M����pc��0�� ���f�)���yv��ߝ���Fa�q �C�ʸk�:���RD��3�W�q�U�3!�u,C�0���rH.%�E�ݵ�ݸ�Єj�����R��:Q���Ry��y�r+��D������W�t{+���0v ���J[n�?�T�<c��LT	m�.��Lz�8<W��5���&�Y��e��W�h���p�L!�.��(�����:�IRc���NyE��� �z��cl���f��^i0Ф���n X?#�{q0�^آ,UĒ�� 	���6
�b����
�"�m�7�)⊮ڽPL�}I�l{�M
e��ԏ�`���}��˥���.�9�C)���g��r�Ɠ���M�hq~5�������������ͮ>O�C��w7L3(�x;����<�žz��a�"D���ٗ��3�7t��N'���r|���'truy4?G���"�a� {da��eN	��?N��n7*ݦv}|��y~1>�_PR۽���y��:��     