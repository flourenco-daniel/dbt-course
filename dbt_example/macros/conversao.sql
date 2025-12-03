{%macro to_snake_case(string) %}
    {{ string | replace(' ', '_') | lower() }}
{% endmacro %}