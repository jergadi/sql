WITH test as (SELECT 10 as id, '{"event_time_preference": "both", "event_type_preferences": ["6f4098d2-6c93-426f-bb83-8eaaebfeb402", "a1f8dde6-c9bd-4789-bf6c-d87e6df3fb49", "803b0c69-5f9c-4ee7-adf9-83458a88551f", "59817a40-3b30-420e-8f22-c79438f10ab0", "2339920f-c334-4985-a3cf-eae5caea4c49", "c35e135b-3fc0-4663-a2d4-e9e034663e1d", "c2acd2b6-b7ad-46d2-9194-572e5c3c670b", "1f1f082f-9cac-415b-8fdc-4b123b1bc40c", "4eb75f4f-f994-47b0-9b5d-ca3c12f1bb69", "800cb27c-4dd8-4d45-926f-68996909bb13", "0c98a7ec-c48c-4ae3-a3d8-8a894e01c00f", "47d8112d-3916-44f5-a8db-aa83d182639c", "93b0bfce-c4f3-41cb-aa98-cdd46e124c3d"]}' as js)

SELECT id
		,data.event_time_preference	
        ,jsonb_array_elements(cast(data.event_type_preferences as jsonb)) as event_type_preferences
FROM test
	      , json_to_record(js::json) as data(event_time_preference text, event_type_preferences text)

------------------------------------------------------
RESULT:
id	event_time_preference	event_type_preferences
10	both	6f4098d2-6c93-426f-bb83-8eaaebfeb402
10	both	a1f8dde6-c9bd-4789-bf6c-d87e6df3fb49
10	both	803b0c69-5f9c-4ee7-adf9-83458a88551f
10	both	59817a40-3b30-420e-8f22-c79438f10ab0
10	both	2339920f-c334-4985-a3cf-eae5caea4c49
10	both	c35e135b-3fc0-4663-a2d4-e9e034663e1d
10	both	c2acd2b6-b7ad-46d2-9194-572e5c3c670b
10	both	1f1f082f-9cac-415b-8fdc-4b123b1bc40c
10	both	4eb75f4f-f994-47b0-9b5d-ca3c12f1bb69
10	both	800cb27c-4dd8-4d45-926f-68996909bb13
10	both	0c98a7ec-c48c-4ae3-a3d8-8a894e01c00f
10	both	47d8112d-3916-44f5-a8db-aa83d182639c
10	both	93b0bfce-c4f3-41cb-aa98-cdd46e124c3d
