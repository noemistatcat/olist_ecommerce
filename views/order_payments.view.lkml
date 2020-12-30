view: order_payments {
  sql_table_name: "DATASETS"."ORDER_PAYMENTS"
    ;;

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: payment_installments {
    type: number
    sql: ${TABLE}."PAYMENT_INSTALLMENTS" ;;
  }

  dimension: payment_sequential {
    type: number
    sql: ${TABLE}."PAYMENT_SEQUENTIAL" ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}."PAYMENT_TYPE" ;;
  }

  dimension: payment_value {
    type: number
    sql: ${TABLE}."PAYMENT_VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.order_id]
  }

  measure: sum {
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
