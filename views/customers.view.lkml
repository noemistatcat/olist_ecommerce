view: customers {
  view_label: "Customer information and location"
  sql_table_name: "DATASETS"."CUSTOMERS"
    ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}."CUSTOMER_CITY" ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}."CUSTOMER_STATE" ;;
  }

  dimension: customer_unique_id {
    type: string
    sql: ${TABLE}."CUSTOMER_UNIQUE_ID" ;;
  }

  dimension: customer_zip_code_prefix {
    type: number
    sql: ${TABLE}."CUSTOMER_ZIP_CODE_PREFIX" ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id]
  }

  measure: count_distinct_customer_id {
    label: "Count (Distinct)"
    type: count_distinct
    sql: ${customer_id} ;;
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
