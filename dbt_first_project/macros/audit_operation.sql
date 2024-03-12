{% macro insert_audit(model_name, action_name) -%}

insert into demo.harry_test.dbt_audit (model, audit_type)

values ('{{ model_name }}', '{{ action_name }}');

commit;

{% endmacro -%}