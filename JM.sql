CREATE database dbElectrodomesticos;
use dbElectrodomesticos;

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    CODCLI char(4)  NOT NULL,
    NOMCLI varchar(60)  NOT NULL,
    APECLI varchar(80)  NOT NULL,
    EMACLI varchar(80)  NOT NULL,
    CELCLI char(9)  NOT NULL,
    DIRCLI varchar(70)  NOT NULL,
    ESTCLI char(1)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (CODCLI)
);
/**--------------------------------------------------------------------------**/
INSERT INTO CLIENTE (CODCLI, NOMCLI, APECLI, EMACLI, CELCLI, DIRCLI, ESTCLI)
VALUES 
('CL01', 'Juana', 'Campos Ortiz', 'juana.campos@gmail.com', '987485152', 'av. Miraflores', 'A'),
('CL02', 'Sofia', 'Barrios Salsedo', 'sofia.barios@outlook.com', '', 'jr. Huallaga', 'A'),
('CL03', 'Claudio', 'Perez Luna', 'claudio.perez@outlook.com', '984512147', 'av. libertadores', 'A'),
('CL04', 'Marcos', 'Avila Manco', 'marcos.avila@yahoo.com', '', 'Calle huallaga', 'A'),
('CL05', 'Anastacio', 'Salomon int', 'anastacio.salomon@gamil.com', '', 'jr san martin', 'A');
 select*from CLIENTE;

-- Table: COMPRA
CREATE TABLE COMPRA (
    CODCOM char(5)  NOT NULL,
    FECCOM datetime  NOT NULL,
    CODPROV char(4)  NOT NULL,
    CODVEND char(5)  NOT NULL,
    ESTCOM char(1)  NOT NULL,
    VENDEDOR_CODVEND char(4)  NOT NULL,
    PROVEDOR_CODPROV char(5)  NOT NULL,
    CONSTRAINT COMPRA_pk PRIMARY KEY (CODCOM)
);

-- Table: COMPRADETALLE
CREATE TABLE COMPRADETALLE (
    IDCOMDET int  NOT NULL,
    CODCOM char(5)  NOT NULL,
    CODPRO char(5)  NOT NULL,
    CANTPRO int  NOT NULL,
    COMPRA_CODCOM char(5)  NOT NULL,
    PRODUCTO_CODPRO char(5)  NOT NULL,
    CONSTRAINT COMPRADETALLE_pk PRIMARY KEY (IDCOMDET)
);

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    CODPRO char(5)  NOT NULL,
    DESCPRO varchar(80)  NOT NULL,
    CATPRO char(1)  NOT NULL,
    PREPRO decimal(8,2)  NOT NULL,
    STOCKPRO int  NOT NULL,
    ESTPRO char(1)  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (CODPRO)
);
/**--------------------------------------------------------------------------**/
INSERT INTO PRODUCTO (CODPRO, DESCPRO, CATPRO, PREPRO, STOCKPRO, ESTPRO)
VALUES 
('PRO01', 'Refrigeradora LG Side Bv Side', '1', 4149, 15, 'A'),
('PRO02', 'Refrigeradora SBS 6021', '1', 3599, 10, 'A'),
('PRO03', 'Refrigeradora Top Mount 500 L', '1', 2799, 8, 'A'),
('PRO04', 'TV SAMSUNG UHD 55', '2', 1799, 25, 'A'),
('PRO05', 'Televisor 65" LG UHD 4K', '2', 2999, 20, 'A'),
('PRO06', 'TV CRYSTAL UHD 55', '2', 2299, 7, 'A'),
('PRO07', 'ASUS X415JA Core i3 10a Gen 14" 3', '3', 1099, 17, 'A'),
('PRO08', 'Lenovo IdeaPad 5i Intel Core i7 14"', '3', 3099, 10, 'A'),
('PRO09', 'Laptop HP 15-dw1085la Intel Core i3', '3', 1600, 15, 'A'),
('PRO10', 'Galaxy A52 128GB', '4', 1200, 25, 'A'),
('PRO11', 'iPhone 11 64GB Morado', '4', 2600, 30, 'A'),
('PRO12', 'POCO X3 GT 5G 256GB &GR', '4', 1450, 20, 'A');




-- Table: PROVEDOR
CREATE TABLE PROVEDOR (
    CODPROV char(5)  NOT NULL,
    RAZSOCPROV varchar(90)  NOT NULL,
    RUCPROV varchar(11)  NOT NULL,
    EMAPROV varchar(70)  NOT NULL,
    ESTPROV char(1)  NOT NULL,
    CONSTRAINT PROVEDOR_pk PRIMARY KEY (CODPROV)
);
/**--------------------------------------------------------------------------**/
INSERT INTO PROVEDOR (CODPROV, RAZSOCPROV, RUCPROV, EMAPROV, ESTPROV)
VALUES 
('PRV01', 'LG Corporation', '87542136951', 'informes@lg.com.pe', 'A'),
('PRV02', 'SONY', '45213698741', 'informes@sony.com.pe', 'A'),
('PRV03', 'SAMSUNG', '85321697661', 'informes@samsung.com.pe', 'A'),
('PRV04', 'OSTER SRL', '55663214478', 'informes@oster.com.pe', 'A'),
('PRV05', 'ASUS', '99663325478', 'informes@asus.com.pe', 'A');





-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    CODVEND char(4)  NOT NULL,
    NOMVEND varchar(60)  NOT NULL,
    APEVEND varchar(80)  NOT NULL,
    EMAVEND varchar(80)  NOT NULL,
    CELVEND char(9)  NOT NULL,
    DIRVEND varchar(70)  NOT NULL,
    ESTVEND char(1)  NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (CODVEND)
);
/**--------------------------------------------------------------------------**/
INSERT INTO VENDEDOR (CODVEND, NOMVEND, APEVEND, EMAVEND, CELVEND, DIRVEND, ESTVEND)
VALUES 
('VEN1', 'Gloria', 'Carriales Paredes', 'gloria.carriales@gmail.com', '984574123', 'calle las begonias', 'A'),
('VEN2', 'Gabriel', 'Lozada Lombardi', 'gabriel.lozada@gmail.com', '974512368', 'av. los girasoles', 'A'),
('VEN3', 'Gilberto', 'Martinez Guerra', 'gilberto.martinez@gmail.com', '', 'jr. palomares', 'A');



-- Table: VENTA
CREATE TABLE VENTA (
    CODVEN char(5)  NOT NULL,
    FECVEN datetime  NOT NULL,
    CODCLI char(4)  NOT NULL,
    CODVEND char(4)  NOT NULL,
    ESTVEN char(1)  NOT NULL,
    VENDEDOR_CODVEND char(4)  NOT NULL,
    CLIENTE_CODCLI char(4)  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (CODVEN)
);

-- Table: VENTADETALLE
CREATE TABLE VENTADETALLE (
    IDVENDET int  NOT NULL,
    CODVEN char(5)  NOT NULL,
    CODPRO char(5)  NOT NULL,
    CANTPRO int  NOT NULL,
    VENTA_CODVEN char(5)  NOT NULL,
    PRODUCTO_CODPRO char(5)  NOT NULL,
    CONSTRAINT VENTADETALLE_pk PRIMARY KEY (IDVENDET)
);

-- foreign keys
-- Reference: COMPRADETALLE_COMPRA (table: COMPRADETALLE)
ALTER TABLE COMPRADETALLE ADD CONSTRAINT COMPRADETALLE_COMPRA FOREIGN KEY COMPRADETALLE_COMPRA (COMPRA_CODCOM)
    REFERENCES COMPRA (CODCOM);

-- Reference: COMPRADETALLE_PRODUCTO (table: COMPRADETALLE)
ALTER TABLE COMPRADETALLE ADD CONSTRAINT COMPRADETALLE_PRODUCTO FOREIGN KEY COMPRADETALLE_PRODUCTO (PRODUCTO_CODPRO)
    REFERENCES PRODUCTO (CODPRO);

-- Reference: COMPRA_PROVEDOR (table: COMPRA)
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_PROVEDOR FOREIGN KEY COMPRA_PROVEDOR (PROVEDOR_CODPROV)
    REFERENCES PROVEDOR (CODPROV);

-- Reference: COMPRA_VENDEDOR (table: COMPRA)
ALTER TABLE COMPRA ADD CONSTRAINT COMPRA_VENDEDOR FOREIGN KEY COMPRA_VENDEDOR (VENDEDOR_CODVEND)
    REFERENCES VENDEDOR (CODVEND);

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
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (VENDEDOR_CODVEND)
    REFERENCES VENDEDOR (CODVEND);

-- End of file.

SELECT * FROM dbElectrodomesticos;
