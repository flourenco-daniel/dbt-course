--query comum

SELECT
    *
FROM
    vendas
WHERE
    data_venda >= '2023-01-01' --Primeiro dia do mês atual

--query com Jinja (dinâmica)

SELECT
    *
FROM
    vendas
WHERE 
    data_venda >= '{{ var ("data_inicio") }}' --Primeiro dia do mês atual com variável

--query com Jinja 2 (dinâmica)

SELECT
    *
FROM
    vendas
WHERE
    data_venda >= '{{ (execute_at | as timestamp).strftime("%Y-%m-01") }}' --Primeiro dia do mês atual com função de data do Jinja

-- Estrutura de repetição for com Jinja

SELECT
    cliente_id,
    {% for mes in range(1, 13) %}
        SUM(CASE WHEN EXTRACT(MONTH FROM data_venda) = {{ mes }} THEN valor_venda ELSE 0 END) AS total_mes_{{ mes }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    vendas
GROUP BY
    cliente_id --Cria uma coluna para cada mês do ano com o total de vendas por cliente