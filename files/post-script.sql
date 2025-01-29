update edc_data_update.batch_data_update
set upload_ts = current_timestamp
where tkt_info = 'DEO1061_20250128'
and upload_ts is null
;