<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Přihlášení</title>
</head>
<body>

    <h2>Přihlášení</h2>

    <?php
    // Zpracování formuláře po odeslání
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Získání údajů z formuláře
        $username = $_POST["username"];
        $password = $_POST["password"];

        // Zde můžete přidat ověření přihlašovacích údajů (např. vytvořit databázi uživatelů)

        // Přesměrování na stránku s spoji po úspěšném přihlášení
        header("Location: spoje.php");
        exit();
    }
    ?>

    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="username">Uživatelské jméno:</label>
        <input type="text" name="username" required><br>

        <label for="password">Heslo:</label>
        <input type="password" name="password" required><br>

        <input type="submit" value="Přihlásit se">
    </form>

</body>
</html>
