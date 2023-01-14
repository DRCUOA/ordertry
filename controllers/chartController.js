

UPDATE bgReadings
SET device_timestamp = substr(device_timestamp, 12,5) || ' ' || substr(device_timestamp, 1, 2) || '-' || substr(device_timestamp, 4, 2) || '-' || substr(device_timestamp, 7,4);




UPDATE bgReadings
SET device_timestamp = datetime(substr(device_timestamp, 7, 4) || '-' || substr(device_timestamp, 1, 2) || '-' || substr(device_timestamp, 4, 2) || ' ' || substr(device_timestamp, 12, 5) ||':00');



// 	"device_timestamp"	TEXT,
// 	"record_type"	NUMERIC,
// 	"bg"	NUMERIC,
// );