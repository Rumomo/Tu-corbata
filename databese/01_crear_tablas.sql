USE TIENDA;

CREATE TABLE usuario (
    id_usuario INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_usuario
        PRIMARY KEY (id_usuario),

    CONSTRAINT uq_usuario_email
        UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE direccion (
    id_direccion INT UNSIGNED AUTO_INCREMENT,
    id_usuario INT UNSIGNED NOT NULL,
    nombre_destinatario VARCHAR(150) NOT NULL,
    calle VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    piso VARCHAR(50) NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    localidad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL DEFAULT 'España',
    principal BOOLEAN NOT NULL DEFAULT FALSE,

    CONSTRAINT pk_direccion
        PRIMARY KEY (id_direccion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE marca (
    id_marca INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,

    CONSTRAINT pk_marca
        PRIMARY KEY (id_marca),

    CONSTRAINT uq_marca_nombre
        UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE color (
    id_color INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    codigo_hex CHAR(7) NULL,

    CONSTRAINT pk_color
        PRIMARY KEY (id_color),

    CONSTRAINT uq_color_nombre
        UNIQUE (nombre),

    CONSTRAINT uq_color_codigo_hex
        UNIQUE (codigo_hex)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE talla (
    id_talla INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    longitud_cm DECIMAL(5,2) NULL,
    descripcion TEXT NULL,

    CONSTRAINT pk_talla
        PRIMARY KEY (id_talla),

    CONSTRAINT uq_talla_nombre
        UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE material (
    id_material INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,

    CONSTRAINT pk_material
        PRIMARY KEY (id_material),

    CONSTRAINT uq_material_nombre
        UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE corbata (
    id_corbata INT UNSIGNED AUTO_INCREMENT,
    id_talla INT UNSIGNED NOT NULL,
    id_color INT UNSIGNED NOT NULL,
    id_material INT UNSIGNED NOT NULL,
    id_marca INT UNSIGNED NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT UNSIGNED NOT NULL DEFAULT 0,
    imagen VARCHAR(255) NULL,
    activa BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_corbata
        PRIMARY KEY (id_corbata),

    CONSTRAINT chk_corbata_precio
        CHECK (precio >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE pedido (
    id_pedido INT UNSIGNED AUTO_INCREMENT,
    id_usuario INT UNSIGNED NOT NULL,
    id_direccion INT UNSIGNED NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT pk_pedido
        PRIMARY KEY (id_pedido),

    CONSTRAINT chk_pedido_total
        CHECK (total >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE detalle_pedido (
    id_detalle INT UNSIGNED AUTO_INCREMENT,
    id_pedido INT UNSIGNED NOT NULL,
    id_corbata INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_detalle_pedido
        PRIMARY KEY (id_detalle),

    CONSTRAINT uq_detalle_pedido_producto
        UNIQUE (id_pedido, id_corbata),

    CONSTRAINT chk_detalle_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT chk_detalle_precio
        CHECK (precio_unitario >= 0),

    CONSTRAINT chk_detalle_subtotal
        CHECK (subtotal >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;