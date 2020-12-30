connection: "olist"

datagroup: olist_ecommerce_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: olist_ecommerce_default_datagroup
