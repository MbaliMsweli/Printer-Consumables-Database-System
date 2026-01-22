INSERT INTO CustomerShipping
(CustomerOrderID, CustomerID, DeliveryFee_1_5Units, BulkDeliveryFee_6_20Units,
 CourierName, DeliveryStatus, DeliveryDate, TrackingNumber)
VALUES
(1,1,65,130,'DHL','Delivered','2026-02-02','CUS1001'),
(2,2,65,130,'FedEx','Delivered','2026-02-03','CUS1002'),
(3,3,65,130,'Aramex','In Transit',NULL,'CUS1003'),
(4,4,65,130,'DHL','Delivered','2026-02-04','CUS1004'),
(5,5,65,130,'Fastway','Delivered','2026-02-05','CUS1005'),
(6,6,65,130,'DHL','In Transit',NULL,'CUS1006'),
(7,7,65,130,'FedEx','Delivered','2026-02-07','CUS1007'),
(8,8,65,130,'Aramex','Delivered','2026-02-08','CUS1008'),
(9,9,65,130,'Fastway','In Transit',NULL,'CUS1009'),
(10,10,65,130,'DHL','Delivered','2026-02-10','CUS1010');
