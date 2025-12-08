-- hooks são para executar código SQL antes ou depois de certas operações do dbt, como execução de modelos, testes ou snapshots.
-- Eles são úteis para tarefas como configuração de ambiente, limpeza de dados ou auditoria.

{{config(
    pre_hook=[
        "INSERT INTO audit_log (model_name, run_time) VALUES ('{{ this.name }}', CURRENT_TIMESTAMP)"
    ],
    post_hook=[
        "UPDATE audit_log SET status='completed' WHERE model_name='{{ this.name }}' AND status IS NULL"
    ]
)}}

SELECT
    *
FROM
    {{ ref('northwind_erp__customers') }}