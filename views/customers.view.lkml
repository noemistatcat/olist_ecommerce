view: customers {
  view_label: "Customer information and location"
  sql_table_name: "DATASETS"."CUSTOMERS"
    ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    description: "Key to the orders dataset. Each order has a unique customer_id."
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customer_city {
    description: "Customer city name"
    type: string
    sql: ${TABLE}."CUSTOMER_CITY" ;;
  }

  dimension: customer_state {
    description: "Customer state TEST"
    type: string
    sql: ${TABLE}."CUSTOMER_STATE" ;;
  }

  dimension: customer_state_duo {
    description: "Customer state TEST2"
    type: string
    sql: ${TABLE}."CUSTOMER_STATE" ;;
  }

  dimension: customer_unique_id {
    description: "Unique identifier of a customer"
    type: string
    sql: ${TABLE}."CUSTOMER_UNIQUE_ID" ;;
  }

  dimension: customer_zip_code_prefix {
    description: "First five digits of customer zip code"
    type: number
    sql: ${TABLE}."CUSTOMER_ZIP_CODE_PREFIX" ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [customer_id]
  }

  measure: count_distinct_customer_id {
    label: "Count (Distinct)"
    type: count_distinct
    sql: ${customer_unique_id} ;;
    }

  measure: count_percent_of_total {
    label: "Count (Percent of total)"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [detail*]
    }

  set: detail {
    fields: [customer_id, customer_unique_id, customer_state, customer_city]
  }
}
