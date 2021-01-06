view: order_payments {
  view_label: "Order payment data"
  sql_table_name: "DATASETS"."ORDER_PAYMENTS"
    ;;

  dimension: order_id {
    description: "Unique identifier of the order"
    type: string
    # hidden: yes
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: payment_installments {
    description: "Number of installments chosen by the customer."
    type: number
    sql: ${TABLE}."PAYMENT_INSTALLMENTS" ;;
  }

  dimension: payment_sequential {
    description: "A customer may pay an order with more than one payment method. If he does so, a sequence will be created to accommodate all payments."
    type: number
    sql: ${TABLE}."PAYMENT_SEQUENTIAL" ;;
  }

  dimension: payment_type {
    description: "Method of payment chosen by the customer."
    type: string
    sql: ${TABLE}."PAYMENT_TYPE" ;;
  }

  dimension: payment_value {
    description: "Transaction value."
    type: number
    sql: ${TABLE}."PAYMENT_VALUE" ;;
    value_format: "$#.00;($#.00)"
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [orders.order_id]
  }

  measure: sum {
    label: "Sum"
    type: sum
    drill_fields: [orders.order_id]
  }

  measure: count_percent_of_total {
    label: "Count (Percent of total)"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [orders.order_id]
  }
}
