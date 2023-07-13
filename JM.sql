CREATE DATABASE dbElectrodomesticos;
USE dbElectrodomesticos;
CREATE TABLE  PROVEEDOR (
    CODPROV char(5)  NOT NULL COMMENT 'Código de proveedor',
    RAZSOCPROV varchar(90)  NOT NULL COMMENT 'Razón social del proveedor',
    RUCPROV varchar(11)  NOT NULL COMMENT 'RUC del proveedor',
    EMAPROV varchar(70)  NOT NULL COMMENT 'Email del proveedor',
    ESTPROV char(1)  NOT NULL COMMENT 'Estado del proveedor A(Activo)) I (Inactivo)',
    CONSTRAINT  PROVEEDOR_pk PRIMARY KEY (CODPROV)
) COMMENT 'Crear la tabla PROVEEDOR';
INSERT INTO PROVEEDOR ( CODPROV, RAZSOCPROV, RUCPROV, EMAPROV, ESTPROV )
values
('PRV01','LG Corporation' ,'','987485152','Av.Miraflores','A'),
('PRV02','SONY' ,'','Av.Miraflores','A'),
('PRV03','SANSUNG' ,'85','Av.Miraflores','A'),
('PRV04','OSTER SRL' ,'55663214478'Av.Miraflores','A'),
('PRV05','ASUS' ,'99663325478'Av.Miraflores','A');



-- Table: CLIENTE
CREATE TABLE CLIENTE (
    CODCLI char(4)  NOT NULL COMMENT 'Código del cliente',
    NOMCLI varchar(60)  NOT NULL COMMENT 'Nombre de cliente',
    APECLI varchar(80)  NOT NULL COMMENT 'Apellido de cliente',
    EMACLI varchar(80)  NOT NULL COMMENT 'Email del cliente',
    CELCLI char(9)  NOT NULL COMMENT 'Celular del cliente',
    DIRCLI varchar(70)  NOT NULL COMMENT 'Direccion del cliente',
    ESTCLI char(1)  NOT NULL COMMENT 'Estado cliente A(activo) I(inactivo)',
    CONSTRAINT CLIENTE_pk PRIMARY KEY (CODCLI)
) COMMENT 'Crea la tabla cliente  ';
INSERT INTO CLIENTE ( CODCLI, NOMCLI,  APECLI, EMACLI, CELCLI, DIRCLI, ESTCLI  )
values
('CL01','Juana' ,'Campos Ortìz','juana.campos@gmail.com','987485152','Av.Miraflores','A'),
('CL02','Sofia' ,'Barrios Salcedo','sofia.barrios@gmail.com','','Av.Miraflores','A'),
('CL03','Claudio' ,'Pèrez luna','claudio.perez@gmail.com','984512147','Av.Miraflores','A'),
('CL04','Marco' ,'Àvila Manco ','marco.avila@gmail.com','','Av.Miraflores','A'),
('CL05','Anastacio' ,'Salomon Inti','anastasio.salomon@gmail.com','','Av.Miraflores','A');
-- Table: COMPRA
CREATE TABLE COMPRA (
    CODCOM char(5)  NOT NULL COMMENT 'Código de compra',
    FECCOM datetime  NOT NULL COMMENT 'Fecha en que se realizó la compra',
    CODVEND char(4)  NOT NULL COMMENT 'Código de Proveedor',
    CODPROV char(5)  NOT NULL COMMENT 'Código de vendedor',
    ESTCOM char(1)  NOT NULL COMMENT 'Estado de compra Activo (A) I (Inactivo)',
    VENDEDOR_CODNED char(4)  NOT NULL,
    PROVEEDOR_CODPROV char(5)  NOT NULL,
    CONSTRAINT COMPRA_pk PRIMARY KEY (CODCOM)
) COMMENT 'Crear la tabla COMPRA';


-- Table: COMPRADETALLE
CREATE TABLE COMPRADETALLE (
    IDCOMDET int  NOT NULL COMMENT 'Identificador de detalle de compra (auto incrementable)',
    CODCOM char(5)  NOT NULL COMMENT 'Código de venta',
    CODPRO char(5)  NOT NULL COMMENT 'Código de producto',
    CANTPRO int  NOT NULL COMMENT 'Cantidad de productos comprados',
    PRODUCTO_CODPRO char(5)  NOT NULL,
    COMPRA_CODCOM char(5)  NOT NULL,
    CONSTRAINT COMPRADETALLE_pk PRIMARY KEY (IDCOMDET)
) COMMENT 'Crear la tabla COMPRADETALLE';

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    CODPRO char(5)  NOT NULL COMMENT 'Código de producto',
    DESCPRO varchar(80)  NOT NULL COMMENT 'Descripción del producto',
    CATPRO char(1)  NOT NULL COMMENT 'Categorías de Producto: Refrigeración (1), Televisores (2), Computadoras (3) y  Teléfono (4)',
    PREPRO decimal(8,2)  NOT NULL COMMENT 'Precio del producto',
    STOCKPRO int  NOT NULL COMMENT 'Stock de producto',
    ESTPRO char(1)  NOT NULL COMMENT 'Estado de producto Activo (A) - I (Inactivo)',
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (CODPRO)
) COMMENT 'Crear la tabla PRODUCTO';

-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    CODNED char(4)  NOT NULL COMMENT 'Código del vendedor',
    NOMVEND varchar(60)  NOT NULL COMMENT 'Nombre del vendedor',
    APEVEND varchar(80)  NOT NULL COMMENT 'Apellidos del vendedor',
    EMAVEND varchar(80)  NOT NULL COMMENT 'Email del vendedor',
    CELVEND char(9)  NOT NULL COMMENT 'Celular del vendedor',
    DIRVEND varchar(70)  NOT NULL COMMENT 'Direccion deL vendedor',
    ESTVEND char(1)  NOT NULL COMMENT 'Estado vendedor A(activo) I(inactivo)',
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (CODNED)
) COMMENT 'Crea la tabla vendedor';

INSERT INTO VENDEDOR ( CODNED, NOMVEND,  APEVEND, EMAVEND, CELVEND, DIRVEND, ESTVEND  )
values
('VEN1','Gloria' ,'Carrizales Paredes','Gloria.carrizales@gmail.com','984574123','Calle Las Begonias','A'),
('VEN2','Gabriel' ,'Lozada Lombardi','gabriel.lozada@gmail.com','974512368','Av.Los Girasoles','A'),
('VEN3','Gilberto' ,'Martinez Guerra','gilberto.martinez@gmail.com','','Jr.Palomares','A');

-- Table: VENTA
CREATE TABLE VENTA (
    CODVEN char(5)  NOT NULL COMMENT 'Código de venta',
    FECVEN datetime  NOT NULL COMMENT 'Fecha en que se realizó la venta',
    CODCLI char(4)  NOT NULL COMMENT 'Código del cliente',
    CODVEND char(4)  NOT NULL COMMENT 'Código del vendedor',
    ESTVEN char(1)  NOT NULL COMMENT 'Estado de venta A(Activo) (I) Inactivo',
    VENDEDOR_CODNED char(4)  NOT NULL,
    CLIENTE_CODCLI char(4)  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (CODVEN)
) COMMENT 'Crear la tabla VENTA';

-- Table: VENTADETALLE
CREATE TABLE VENTADETALLE (
    IDVENEDT int  NOT NULL COMMENT 'Identificador de detalle de venta (auto incrementable)',
    CODVEN char(5)  NOT NULL COMMENT 'Código de venta',
    CODPRO char(5)  NOT NULL COMMENT 'Código de producto',
    CANTPRO int  NOT NULL COMMENT 'Cantidad de productos a vender',
    VENTA_CODVEN char(5)  NOT NULL,
    PRODUCTO_CODPRO char(5)  NOT NULL,
    CONSTRAINT VENTADETALLE_pk PRIMARY KEY (IDVENEDT)
) COMMENT 'Crear la tabla VENTADETALLE';

-- foreign keys
-- Reference: COMPRADETALLE_COMPRA (table: COMPRADETALLE)
ALTER TABLE COMPRADETALLE ADD CONSTRAINT COMPRADETALLE_COMPRA FOREIGN KEY COMPRADETALLE_COMPRA (COMPRA_CODCOM)
    REFERENCES COMPRA (CODCOM);

-- Reference: COMPRADETALLE_PRODUCTO (table: COMPRADETALLE)
ALTER TABLE COMPRADETALLE ADD CONSTRAINT COMPRADETALLE_PRODUCTO FOREIGN KEY COMPRADETALLE_PRODUCTO (PRODUCTO_CODPRO)
    REFERENCES PRODUCTO (CODPRO);

-- Reference: COMPRA_ PROVEEDOR (table: COMPRA)
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_PROVEEDOR FOREIGN KEY (PROVEEDOR_CODPROV)
REFERENCES PROVEEDOR (CODPROV);

-- Reference: COMPRA_VENDEDOR (table: COMPRA)
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_VENDEDOR FOREIGN KEY COMPRA_VENDEDOR (VENDEDOR_CODNED)
    REFERENCES VENDEDOR (CODNED);

-- Reference: VENTADETALLE_PRODUCTO (table: VENTADETALLE)
ALTER TABLE VENTADETALLE ADD CONSTRAINT VENTADETALLE_PRODUCTO FOREIGN KEY VENTADETALLE_PRODUCTO (PRODUCTO_CODPRO)
    REFERENCES PRODUCTO (CODPRO);

-- Reference: VENTADETALLE_VENTA (table: VENTADETALLE)
ALTER TABLE VENTADETALLE ADD CONSTRAINT VENTADETALLE_VENTA FOREIGN KEY VENTADETALLE_VENTA (VENTA_CODVEN)
    REFERENCES VENTA (CODVEN);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (CLIENTE_CODCLI)
    REFERENCES CLIENTE (CODCLI);

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (VENDEDOR_CODNED)
    REFERENCES VENDEDOR (CODNED);

-- End of file.

SELECT * FROM dbElectrodomesticos;