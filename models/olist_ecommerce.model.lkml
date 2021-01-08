connection: "olist"
label: "Olist eCommerce Data"

include: "/views/*.view" # include all the views

datagroup: olist_ecommerce_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: olist_ecommerce_default_datagroup

############ Customers and Purchase Behaviors Explore #############

explore: customers_purchase_behaviors {
  label: "(1) Customers and Purchase Behaviors"
  view_name: customers

  join: repeat_purchase {
    view_label: "Repeat Purchase"
    relationship: one_to_one
    sql_on: ${customers.customer_id} = ${orders.customer_id} ;;
  }

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

  join: order_facts {
    view_label: "Order Facts"
    relationship: one_to_one
    sql_on: ${orders.order_id} = ${order_facts.order_id} ;;
  }

}

############ Orders and Products Sold Explore #############

explore: orders_products_sold {
  label: "(2) Orders and Products Sold"
  view_name: orders

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

  join: products {
    view_label: "Products"
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.product_id} ;;
  }

  join: product_category_name_translation {
    view_label: "Product Translation"
    relationship: many_to_one
    sql_on: ${products.product_category_name} = ${product_category_name_translation.product_category_name} ;;
  }

  join: order_facts {
    view_label: "Order Facts"
    relationship: one_to_one
    sql_on: ${orders.order_id} = ${order_facts.order_id} ;;
  }

}

############ TEST Customers and Purchase Behaviors Explore 2 #############

explore: customers_purchase_behaviors_2 {
  label: "(3) Customers and Purchase Behaviors"
  view_name: orders

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

  join: order_facts {
    view_label: "Order Facts"
    relationship: one_to_one
    sql_on: ${orders.order_id} = ${order_facts.order_id} ;;
  }

  join: customers {
    view_label: "Customers"
    relationship: many_to_one
    sql_on: ${customers.customer_id} = ${orders.customer_id} ;;
  }

  join: repeat_purchase {
    view_label: "Repeat Purchase"
    relationship: one_to_one
    sql_on: ${repeat_purchase.customer_unique_id} = ${customers.customer_unique_id} ;;
  }

}
