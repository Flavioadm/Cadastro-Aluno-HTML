<?php

$nomeTurma = filter_input(INPUT_POST, 'nomeTurma', filter_sanitize_string);

echo "nomeTurma: $nomeTurma , <br>";