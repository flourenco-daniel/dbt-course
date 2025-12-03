SELECT
    data_inicial,
    data_final,
    {{ calc_diff('data_inicial', 'data_final') }} AS diferenca_dias
FROM
    pedidos