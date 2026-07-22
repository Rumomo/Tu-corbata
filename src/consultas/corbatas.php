<?php

declare(strict_types=1);

require_once __DIR__ . '/../config/database.php';

/**
 * Recupera todas las corbatas activas junto con sus datos relacionados.
 *
 * @return array<int, array<string, mixed>>
 */
function obtenerCorbatas(): array
{
    $conexion = obtenerConexion();

    $sql = <<<SQL
        SELECT
            c.id_corbata,
            c.nombre,
            c.descripcion,
            c.precio,
            c.stock,
            c.imagen,
            t.nombre AS talla,
            co.nombre AS color,
            m.nombre AS material,
            ma.nombre AS marca
        FROM corbata AS c
        INNER JOIN talla AS t
            ON c.id_talla = t.id_talla
        INNER JOIN color AS co
            ON c.id_color = co.id_color
        INNER JOIN material AS m
            ON c.id_material = m.id_material
        INNER JOIN marca AS ma
            ON c.id_marca = ma.id_marca
        WHERE c.activa = TRUE
        ORDER BY c.id_corbata
    SQL;

    $sentencia = $conexion->prepare($sql);
    $sentencia->execute();

    return $sentencia->fetchAll();
}