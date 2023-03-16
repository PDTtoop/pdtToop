connection: "looker_training_username"

# include all the views
include: "/views/**/*.view"

datagroup: looker_training_chayapuntika_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_training_chayapuntika_default_datagroup

explore: bikeshare_stations {
  label: "Bikeshare Traffic"
  join: bikeshare_status {
    type: left_outer
    view_label: "Status"
    relationship: one_to_one
    sql_on: ${bikeshare_stations.station_id} = ${bikeshare_status.station_id} ;;
  }

  join: bikeshare_trips {
    type: inner
    view_label: "Trip"
    relationship: one_to_many
    sql_on: ${bikeshare_stations.station_id} = ${bikeshare_trips.start_station_id} or ${bikeshare_stations.station_id} = ${bikeshare_trips.end_station_id}  ;;
  }
}
