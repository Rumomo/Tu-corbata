USE TIENDA;

ALTER TABLE direccion
    ADD CONSTRAINT fk_direccion_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE pedido
    ADD CONSTRAINT fk_pedido_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    ADD CONSTRAINT fk_pedido_direccion
    FOREIGN KEY (id_direccion)
    REFERENCES direccion(id_direccion)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE corbata
    ADD CONSTRAINT fk_corbata_talla
    FOREIGN KEY (id_talla)
    REFERENCES talla(id_talla)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    ADD CONSTRAINT fk_corbata_color
    FOREIGN KEY (id_color)
    REFERENCES color(id_color)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    ADD CONSTRAINT fk_corbata_material
    FOREIGN KEY (id_material)
    REFERENCES material(id_material)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    ADD CONSTRAINT fk_corbata_marca
    FOREIGN KEY (id_marca)
    REFERENCES marca(id_marca)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE detalle_pedido
    ADD CONSTRAINT fk_detalle_pedido
    FOREIGN KEY (id_pedido)
    REFERENCES pedido(id_pedido)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    ADD CONSTRAINT fk_detalle_corbata
    FOREIGN KEY (id_corbata)
    REFERENCES corbata(id_corbata)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;