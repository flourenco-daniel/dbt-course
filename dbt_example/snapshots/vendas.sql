{% snapshot vendas_snapshot %}
    {{
        config(
            target_schema='snapshots', --armazenamento dos snapshots
            unique_key='id_venda', --chave única
            strategy='timestamp', --estratégia de snapshot (timestamp ou check) a check compara todas as colunas ou algumas
            check_cols=['valor_venda', 'id_cliente'], --colunas a serem monitoradas na estratégia check. pode ser all
            updated_at='data_atualizacao'
        )
    }}
    
    SELECT
        id_pedido,
        status,
        valor_venda,
        data_atualizacao
    FROM {{ ref('vendas') }}
    
{% endsnapshot %}


-- quando quer rodar, é dbt snapshot (roda todas as snapshots) ou dbt snapshot --select vendas_snapshot (roda um snapshot específico).