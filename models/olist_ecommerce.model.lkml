connection: "olist"
label: "Olist eCommerce Data"

include: "/views/*.view" # include all the views

datagroup: olist_ecommerce_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: olist_ecommerce_default_datagroup

############ Base Explores #############

explore: customers {
  label: "(1) Customers and Purchase Behaviors"
  view_name: customers

}
