<?php
// Dados de conexão com o banco de dados MySQL
$hostname = 'db4free.net';
$username = 'flaviolucas@localhost';
$password = '3g_@@TaZVbU5Knv';
$database = 'cadastrodealunos';

// Estabelecer a conexão com o banco de dados usando o PDO
try {
    $pdo = new PDO("mysql:host=$hostname;dbname=$database", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexão com o banco de dados estabelecida com sucesso.";
} catch(PDOException $e) {
    echo "Erro na conexão com o banco de dados: " . $e->getMessage();
}