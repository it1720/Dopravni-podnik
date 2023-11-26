<?php
// Ověření, zda je uživatel přihlášen
// Zde můžete přidat další ověření, pokud je to potřeba
session_start();
// if (!isset($_SESSION["username"])) {
//     // Pokud uživatel není přihlášen, přesměrování na přihlašovací stránku
//     header("Location: login.php");
//     exit();
// }
// 
try {
	$db = new PDO("mysql:host=localhost;dbname=xdumbr00;port=/var/run/mysql/mysql.sock", 'xdumbr00', 'egezaj5m');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // SQL dotaz pro získání jmen z tabulky "uzivatel"
    $sql = "SELECT jmeno FROM uzivatel";

    // Příprava dotazu
    $stmt = $db->prepare($sql);

    // Provedení dotazu
    $stmt->execute();

    // Získání výsledků
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Výpis výsledků
    foreach ($result as $row) {
        echo "Jméno: " . $row['jmeno'] . "<br>";
    }
    } catch (PDOException $e) {
	echo "Connection error: ".$e->getMessage();
	die();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seznam spojů</title>
</head>
<body>

    <h2>Vítejte, <?php echo $_SESSION["username"]; ?>!</h2>

    <p>Zde můžete zobrazit seznam spojů nebo provést další operace.</p>

    <!-- Zde můžete přidat kód pro zobrazení seznamu spojů nebo další funkcionalitu -->

    <p><a href="logout.php">Odhlásit se</a></p>

</body>
</html>
