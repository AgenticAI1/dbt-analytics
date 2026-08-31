{% macro audit_columns() %}
    CURRENT_TIMESTAMP()                  AS _loaded_at,
    '{{ invocation_id }}'                AS _invocation_id,
    '{{ this.schema }}.{{ this.name }}'  AS _dbt_model
{% endmacro %}
