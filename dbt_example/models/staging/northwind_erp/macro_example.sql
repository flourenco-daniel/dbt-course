SELECT 
    id_cliente,
    {{ to_snake_case('Nome Cliente') }} AS nome_cliente,
    {{ to_snake_case('Data de Cadastro') }} AS data_de_cadastro
FROM
    clientes