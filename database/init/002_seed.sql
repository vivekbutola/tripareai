INSERT INTO hotel_bookings VALUES
(
'11111111-1111-1111-1111-111111111111',
'aaaa1111-1111-1111-1111-111111111111',
'HOTEL001',
'delhi',
'2026-09-20',
'2026-09-22',
15000.00,
'confirmed',
NOW()
);

INSERT INTO booking_events
(
booking_id,
event_type,
payload,
created_at
)
VALUES
(
'11111111-1111-1111-1111-111111111111',
'booking_created',
JSON_OBJECT('source','web'),
NOW()
);
