USE TIENDA;

START TRANSACTION;

-- =====================================================
-- MARCAS
-- =====================================================

INSERT INTO marca (id_marca, nombre, descripcion) VALUES
(1, 'Elegance', 'Marca especializada en corbatas clásicas y formales.'),
(2, 'Urban Tie', 'Corbatas modernas para un estilo urbano.'),
(3, 'Silk Premium', 'Corbatas de seda destinadas a ocasiones especiales.');


-- =====================================================
-- COLORES
-- =====================================================

INSERT INTO color (id_color, nombre, codigo_hex) VALUES
(1, 'Azul marino', '#1B365D'),
(2, 'Rojo burdeos', '#800020'),
(3, 'Negro', '#000000'),
(4, 'Verde oscuro', '#1B4D3E'),
(5, 'Gris plata', '#C0C0C0');


-- =====================================================
-- TALLAS
-- =====================================================

INSERT INTO talla (id_talla, nombre, longitud_cm, descripcion) VALUES
(1, 'Corta', 140.00, 'Recomendada para personas de menor estatura.'),
(2, 'Estándar', 150.00, 'Talla habitual para la mayoría de usuarios.'),
(3, 'Larga', 160.00, 'Recomendada para personas altas.');


-- =====================================================
-- MATERIALES
-- =====================================================

INSERT INTO material (id_material, nombre, descripcion) VALUES
(1, 'Seda', 'Material suave y elegante para ocasiones formales.'),
(2, 'Algodón', 'Material cómodo y adecuado para el uso diario.'),
(3, 'Poliéster', 'Material resistente y de fácil mantenimiento.'),
(4, 'Lana', 'Material cálido, apropiado para temporadas frías.');


-- =====================================================
-- USUARIOS
-- =====================================================

INSERT INTO usuario (
    id_usuario,
    nombre,
    apellidos,
    email,
    password,
    telefono,
    activo
) VALUES
(
    1,
    'Carlos',
    'García Pérez',
    'carlos.garcia@example.com',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.',
    '600111222',
    TRUE
),
(
    2,
    'Laura',
    'Martín López',
    'laura.martin@example.com',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.',
    '600333444',
    TRUE
);


-- =====================================================
-- DIRECCIONES
-- =====================================================

INSERT INTO direccion (
    id_direccion,
    id_usuario,
    nombre_destinatario,
    calle,
    numero,
    piso,
    codigo_postal,
    localidad,
    provincia,
    pais,
    principal
) VALUES
(
    1,
    1,
    'Carlos García Pérez',
    'Calle del Sol',
    '12',
    '2.º A',
    '38670',
    'Adeje',
    'Santa Cruz de Tenerife',
    'España',
    TRUE
),
(
    2,
    2,
    'Laura Martín López',
    'Avenida Central',
    '35',
    NULL,
    '38005',
    'Santa Cruz de Tenerife',
    'Santa Cruz de Tenerife',
    'España',
    TRUE
),
(
    3,
    1,
    'Carlos García Pérez',
    'Calle La Rosa',
    '8',
    NULL,
    '38660',
    'Arona',
    'Santa Cruz de Tenerife',
    'España',
    FALSE
);


-- =====================================================
-- CORBATAS
-- =====================================================

INSERT INTO corbata (
    id_corbata,
    id_talla,
    id_color,
    id_material,
    id_marca,
    nombre,
    descripcion,
    precio,
    stock,
    imagen,
    activa
) VALUES
(
    1,
    2,
    1,
    1,
    1,
    'Corbata Azul Clásica',
    'Corbata azul marino de seda para eventos formales.',
    29.95,
    20,
    'corbata-azul-clasica.jpg',
    TRUE
),
(
    2,
    2,
    2,
    1,
    3,
    'Corbata Burdeos Premium',
    'Corbata burdeos de seda con acabado premium.',
    34.90,
    15,
    'corbata-burdeos-premium.jpg',
    TRUE
),
(
    3,
    3,
    3,
    1,
    3,
    'Corbata Negra Elegante',
    'Corbata negra larga para ceremonias y eventos especiales.',
    39.95,
    10,
    'corbata-negra-elegante.jpg',
    TRUE
),
(
    4,
    2,
    4,
    2,
    2,
    'Corbata Verde Urbana',
    'Corbata verde de algodón con diseño moderno.',
    27.50,
    18,
    'corbata-verde-urbana.jpg',
    TRUE
),
(
    5,
    1,
    5,
    4,
    1,
    'Corbata Gris de Lana',
    'Corbata corta de lana en color gris plata.',
    44.90,
    8,
    'corbata-gris-lana.jpg',
    TRUE
);


-- =====================================================
-- PEDIDOS
-- =====================================================

INSERT INTO pedido (
    id_pedido,
    id_usuario,
    id_direccion,
    fecha_pedido,
    estado,
    total
) VALUES
(
    1,
    1,
    1,
    '2026-07-20 10:30:00',
    'Pagado',
    94.80
),
(
    2,
    2,
    2,
    '2026-07-21 17:45:00',
    'En preparación',
    94.95
);


-- =====================================================
-- DETALLES DE LOS PEDIDOS
-- =====================================================

INSERT INTO detalle_pedido (
    id_detalle,
    id_pedido,
    id_corbata,
    cantidad,
    precio_unitario,
    subtotal
) VALUES
(
    1,
    1,
    1,
    2,
    29.95,
    59.90
),
(
    2,
    1,
    2,
    1,
    34.90,
    34.90
),
(
    3,
    2,
    3,
    1,
    39.95,
    39.95
),
(
    4,
    2,
    4,
    2,
    27.50,
    55.00
);

COMMIT;