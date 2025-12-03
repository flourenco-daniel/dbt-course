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

-- Estrutura de repetição loop for com Jinja

SELECT
    cliente_id,
    {% for mes in range(1, 13) %}
        SUM(CASE WHEN EXTRACT(MONTH FROM data_venda) = {{ mes }} THEN valor_venda ELSE 0 END) AS total_mes_{{ mes }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    vendas
GROUP BY
    cliente_id --Cria uma coluna para cada mês do ano com o total de vendas por cliente

-- Estrutura condicional if com Jinja
SELECT
    *
FROM
    vendas
WHERE
    {% if flag_ativo == true%}
        data_venda >= CURRENT_DATE - INTERVAL '30 days' --Se a flag for verdadeira, filtra vendas dos últimos 30 dias
    {% else %}
        data_venda IS NOT NULL  --Se a flag for falsa, retorna todas as vendas com data não nula
    {% endif %}