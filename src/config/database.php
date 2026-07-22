<?php

declare(strict_types=1);

/**
 * Crea y devuelve una conexión PDO con la base de datos.
 *
 * @throws RuntimeException Si falta alguna variable de entorno.
 * @throws PDOException Si no se puede establecer la conexión.
 */
function obtenerConexion(): PDO
{
    $host = getenv('DB_HOST');
    $nombreBaseDatos = getenv('DB_NAME');
    $usuario = getenv('DB_USER');
    $contrasena = getenv('DB_PASSWORD');

    if (
        $host === false ||
        $nombreBaseDatos === false ||
        $usuario === false ||
        $contrasena === false
    ) {
        throw new RuntimeException(
            'Faltan variables de entorno para conectar con la base de datos.'
        );
    }

    $dsn = sprintf(
        'mysql:host=%s;dbname=%s;charset=utf8mb4',
        $host,
        $nombreBaseDatos
    );

    return new PDO(
        $dsn,
        $usuario,
        $contrasena,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]
    );
}