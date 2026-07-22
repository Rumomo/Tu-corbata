<?php

declare(strict_types=1);

require_once __DIR__ . '/consultas/corbatas.php';

$corbatas = [];
$error = null;

try {
    $corbatas = obtenerCorbatas();
} catch (Throwable $excepcion) {
    $error = 'No se pudieron recuperar las corbatas.';
    error_log($excepcion->getMessage());
}

function escapar(string|int|float|null $valor): string
{
    return htmlspecialchars((string) $valor, ENT_QUOTES, 'UTF-8');
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Corbata</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            color: #222;
        }

        header {
            background: #7a1f14;
            color: white;
            padding: 24px;
            text-align: center;
        }

        main {
            width: min(1100px, 92%);
            margin: 32px auto;
        }

        .catalogo {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .corbata {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.10);
        }

        .corbata h2 {
            margin-top: 0;
            color: #7a1f14;
        }

        .precio {
            font-size: 1.4rem;
            font-weight: bold;
            margin: 16px 0;
        }

        .datos {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .datos li {
            margin: 8px 0;
        }

        .error,
        .sin-resultados {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
    <header>
        <h1>Tu Corbata</h1>
        <p>Catálogo de corbatas</p>
    </header>

    <main>
        <?php if ($error !== null): ?>
            <p class="error">
                <?= escapar($error) ?>
            </p>

        <?php elseif ($corbatas === []): ?>
            <p class="sin-resultados">
                No hay corbatas disponibles en este momento.
            </p>

        <?php else: ?>
            <section class="catalogo">
                <?php foreach ($corbatas as $corbata): ?>
                    <article class="corbata">
                        <h2><?= escapar($corbata['nombre']) ?></h2>

                        <p><?= escapar($corbata['descripcion']) ?></p>

                        <p class="precio">
                            <?= number_format((float) $corbata['precio'], 2, ',', '.') ?> €
                        </p>

                        <ul class="datos">
                            <li>
                                <strong>Marca:</strong>
                                <?= escapar($corbata['marca']) ?>
                            </li>
                            <li>
                                <strong>Talla:</strong>
                                <?= escapar($corbata['talla']) ?>
                            </li>
                            <li>
                                <strong>Color:</strong>
                                <?= escapar($corbata['color']) ?>
                            </li>
                            <li>
                                <strong>Material:</strong>
                                <?= escapar($corbata['material']) ?>
                            </li>
                            <li>
                                <strong>Stock:</strong>
                                <?= escapar($corbata['stock']) ?> unidades
                            </li>
                        </ul>
                    </article>
                <?php endforeach; ?>
            </section>
        <?php endif; ?>
    </main>
</body>
</html>