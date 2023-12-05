<?php
// Dados de conexão com o banco de dados MySQL
$hostname = '193.203.175.53';
$username = 'u294807456_flaviolucas';
$password = '@BDaluno2023';
$database = 'u294807456_cad_aluno';

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
    $stmt = $pdo->query("SELECT * FROM nome_aluno");
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "ID: " . $row['id'] . ", Nome: " . $row['nome'] . ", Data de nascimento: " . $row['data_nacimsnto'] . ", Tuma: " . $row['turma'] ; "<br>";
    }
} catch(PDOException $e) {
    echo "Erro na consulta: " . $e->getMessage();
}

// Fechar a conexão com o banco de dados
$pdo = null;
?>