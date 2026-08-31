{% macro incremental_watermark(column_name, default_value="'1900-01-01'::timestamp") %}
  {% if is_incremental() %}
    WHERE {{ column_name }} > (
      SELECT COALESCE(MAX({{ column_name }}), {{ default_value }})
      FROM {{ this }}
    )
  {% endif %}
{% endmacro %}
