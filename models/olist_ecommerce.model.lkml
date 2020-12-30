connection: "olist"
label: "Olist eCommerce Data"

include: "/views/*.view" # include all the views

datagroup: olist_ecommerce_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: olist_ecommerce_default_datagroup

############ Base Explores #############

explore: customers_purchase_behaviors {
  label: "(1) Customers and Purchase Behaviors"
  view_name: customers

  join: orders {
    view_label: "Orders"
    relationship: one_to_many
    sql_on: ${customers.customer_id} = ${orders.customer_id} ;;
  }

  join: order_items {
    view_label: "Order Items"
    relationship: one_to_many
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }

  join: order_payments {
    view_label: "Order Payments"
    relationship: one_to_many
    sql_on: ${orders.order_id} = ${order_payments.order_id} ;;
  }

}
