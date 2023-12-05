<?php
// Dados de conexão com o banco de dados MySQL
$hostname = 'localhost';
$username = 'seu_usuario';
$password = 'sua_senha';
$database = 'seu_banco_de_dados';

// Estabelecer a conexão com o banco de dados usando o PDO
try {
    $pdo = new PDO("mysql:host=$hostname;dbname=$database", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexão com o banco de dados estabelecida com sucesso.";
} catch(PDOException $e) {
    echo "Erro na conexão com o banco de dados: " . $e->getMessage();
}

// Realizar uma consulta no banco de dados
try {
    $stmt = $pdo->query("SELECT * FROM cadastro");
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "ID: " . $row['id'] . ", Nome: " . $row['nome'] . ", Email: " . $row['email'] . "<br>";
    }
} catch(PDOException $e) {
    echo "Erro na consulta: " . $e->getMessage();
}

// Fechar a conexão com o banco de dados
$pdo = null;
?>
