USE Module4_Inventory
DELETE FROM OrderItems;
DELETE FROM Orders;
DELETE FROM Parts;
DELETE FROM Customers;

DBCC CHECKIDENT ('OrderItems', RESEED, 0);
DBCC CHECKIDENT ('Orders', RESEED, 0);
DBCC CHECKIDENT ('Parts', RESEED, 0);
DBCC CHECKIDENT ('Customers', RESEED, 0);

INSERT INTO Customers (name, contact_info, address) VALUES
('Aviation Logistics Group', 'aviation@alg.com', '1200 Falcon Ave'),
('Ground Support Services', 'contact@gss.com', '4500 Armor Rd'),
('Defense Electronics Corp', 'info@dec.com', '900 Circuit Blvd'),
('Tactical Supply Co', 'sales@tactical.com', '2200 Ranger St'),
('Precision Armor Works', 'support@paw.com', '3100 Steel Ridge Rd'),
('AeroDynamics Intl', 'contact@aero.com', '88 Skyhawk Blvd'),
('Frontline Defense Supply', 'fds@fds.com', '700 Patriot Way'),
('SecureWave Systems', 'info@securewave.com', '500 Encryption Ln'),
('BallisticsPro Manufacturing', 'sales@ballisticspro.com', '1400 Ammo Dr'),
('JetSystems Engineering', 'contact@jetsystems.com', '600 Jetstream Pkwy'),
('ArmorCo Industries', 'info@armorco.com', '2000 Titan Rd'),
('ElectroDefense Labs', 'support@edlabs.com', '9000 Circuit Ct'),
('HeatVision Optics', 'sales@heatvision.com', '440 Thermal St'),
('MotorDefense Mechanics', 'info@motordefense.com', '3300 Engine Row'),
('SkyWorks Aviation', 'contact@skyworks.com', '120 Skyway Blvd'),
('OrdnanceWorks LLC', 'sales@ordnanceworks.com', '800 Grenade Ave'),
('SecureNav Technologies', 'info@securenav.com', '100 Navigation Dr'),
('ArmorTech Solutions', 'support@armortech.com', '2100 Shield Rd'),
('AeroForce Components', 'contact@aeroforce.com', '900 Lift St'),
('DefensePro Logistics', 'info@defensepro.com', '500 Supply Ln');

INSERT INTO Parts (part_name, description, category, manufacturer, unit_price) VALUES
('F-16 Wing Bolt', 'High-tensile bolt for wing assembly', 'Aircraft Parts', 'AeroTech', 320),
('Hydraulic Pump', 'Landing gear hydraulic pump', 'Aircraft Parts', 'SkyWorks', 1450),
('APU Starter Motor', 'Auxiliary power unit starter', 'Aircraft Parts', 'JetSystems', 980),
('Jet Fuel Regulator', 'Regulates fuel flow', 'Aircraft Parts', 'AeroTech', 760),
('Turbine Blade Set', 'Heat-resistant turbine blades', 'Aircraft Parts', 'AeroForce', 2200),
('Flight Control Rod', 'Stabilizer control rod', 'Aircraft Parts', 'AeroDynamics Intl', 540),
('Landing Gear Strut', 'Shock-absorbing strut', 'Aircraft Parts', 'SkyWorks', 3100),
('Cabin Pressure Valve', 'Maintains cabin pressure', 'Aircraft Parts', 'AeroTech', 450),
('Engine Mount Bracket', 'Engine support bracket', 'Aircraft Parts', 'JetSystems', 880),
('Fuel Line Assembly', 'High-pressure fuel line', 'Aircraft Parts', 'AeroForce', 390),
('Navigation Light Kit', 'LED aircraft lighting', 'Aircraft Parts', 'SecureNav', 250),
('Wing Flap Actuator', 'Hydraulic actuator', 'Aircraft Parts', 'SkyWorks', 1750),
('Stabilizer Trim Motor', 'Tail trim motor', 'Aircraft Parts', 'AeroTech', 1300);

INSERT INTO Parts (part_name, description, category, manufacturer, unit_price) VALUES
('M1 Abrams Track Pad', 'Rubberized track pad', 'Vehicle Parts', 'ArmorCo', 75),
('Fuel Injector', 'High-pressure injector', 'Vehicle Parts', 'MotorDefense', 210),
('Brake Assembly', 'Heavy-duty brake system', 'Vehicle Parts', 'SteelForce', 650),
('Armored Hull Plate', 'Composite armor plating', 'Vehicle Parts', 'ArmorCo', 1200),
('Transmission Gear Set', 'Reinforced gear set', 'Vehicle Parts', 'MotorDefense', 980),
('Cooling Radiator', 'High-capacity radiator', 'Vehicle Parts', 'ArmorTech', 430),
('Suspension Strut', 'Shock-absorbing strut', 'Vehicle Parts', 'ArmorTech', 310),
('Engine Block Housing', 'Reinforced engine block', 'Vehicle Parts', 'MotorDefense', 1800),
('Tactical Tire', 'Run-flat armored tire', 'Vehicle Parts', 'ArmorCo', 950),
('Drive Shaft Assembly', 'Heavy-duty drive shaft', 'Vehicle Parts', 'SteelForce', 720),
('Armored Door Hinge', 'Reinforced hinge', 'Vehicle Parts', 'ArmorTech', 140),
('Fuel Pump Module', 'High-flow fuel pump', 'Vehicle Parts', 'MotorDefense', 260);

INSERT INTO Parts (part_name, description, category, manufacturer, unit_price) VALUES
('Radar Module', 'Short-range radar component', 'Electronics', 'ElectroDefense', 1800),
('Communication Chipset', 'Encrypted chipset', 'Electronics', 'SecureWave', 450),
('Thermal Sensor', 'Infrared sensor', 'Electronics', 'HeatVision', 320),
('Encrypted GPS Module', 'Secure GPS unit', 'Electronics', 'SecureNav', 950),
('Targeting Processor', 'Ballistic targeting CPU', 'Electronics', 'ElectroDefense', 2100),
('Night Vision Lens', 'Low-light optical lens', 'Electronics', 'HeatVision', 780),
('Signal Amplifier', 'Long-range amplifier', 'Electronics', 'SecureWave', 620),
('Drone Control Board', 'UAV control module', 'Electronics', 'ElectroDefense', 1300),
('Thermal Imaging Core', 'High-res thermal core', 'Electronics', 'HeatVision', 2400),
('Encrypted Radio Unit', 'Secure comms radio', 'Electronics', 'SecureWave', 1100),
('Navigation CPU', 'Flight navigation processor', 'Electronics', 'SecureNav', 890),
('Laser Rangefinder', 'Precision targeting laser', 'Electronics', 'ElectroDefense', 1750),
('Optical Relay Board', 'Signal relay board', 'Electronics', 'HeatVision', 540);

INSERT INTO Parts (part_name, description, category, manufacturer, unit_price) VALUES
('5.56mm Ammo Box', 'Box of 800 rounds', 'Ammunition', 'BallisticsPro', 240),
('9mm Ammo Box', 'Box of 500 rounds', 'Ammunition', 'BallisticsPro', 120),
('40mm Grenade', 'High-explosive grenade', 'Ammunition', 'OrdnanceWorks', 85),
('7.62mm Ammo Box', 'Box of 1000 rounds', 'Ammunition', 'BallisticsPro', 300),
('120mm Tank Shell', 'Armor-piercing shell', 'Ammunition', 'OrdnanceWorks', 1800),
('50 BMG Rounds', 'Box of 200 rounds', 'Ammunition', 'BallisticsPro', 450),
('Smoke Grenade', 'Tactical smoke grenade', 'Ammunition', 'OrdnanceWorks', 60),
('Flashbang Grenade', 'Stun grenade', 'Ammunition', 'OrdnanceWorks', 55),
('HE Rocket', 'High-explosive rocket', 'Ammunition', 'OrdnanceWorks', 3200),
('Tracer Rounds 5.56mm', 'Box of 600 rounds', 'Ammunition', 'BallisticsPro', 260),
('Incendiary Rounds 7.62mm', 'Box of 800 rounds', 'Ammunition', 'BallisticsPro', 420),
('Practice Grenade', 'Training grenade', 'Ammunition', 'OrdnanceWorks', 25);

INSERT INTO Orders (customer_id, order_date, total_cost) VALUES
(1,'2024-01-05',0),(2,'2024-01-10',0),(3,'2024-01-15',0),(4,'2024-01-20',0),
(5,'2024-02-01',0),(6,'2024-02-05',0),(7,'2024-02-10',0),(8,'2024-02-15',0),
(9,'2024-03-01',0),(10,'2024-03-05',0),(11,'2024-03-10',0),(12,'2024-03-15',0),
(13,'2024-03-20',0),(14,'2024-03-25',0),(15,'2024-04-01',0),(16,'2024-04-05',0),
(17,'2024-04-10',0),(18,'2024-04-15',0),(19,'2024-04-20',0),(20,'2024-04-25',0),
(1,'2024-05-01',0),(3,'2024-05-05',0),(5,'2024-05-10',0),(7,'2024-05-15',0),
(9,'2024-05-20',0),(11,'2024-05-25',0),(13,'2024-06-01',0),(15,'2024-06-05',0),
(17,'2024-06-10',0),(19,'2024-06-15',0);

INSERT INTO OrderItems (order_id, part_id, quantity) VALUES
(1,1,10),(1,7,2),(1,22,5),(1,40,20),
(2,3,4),(2,15,3),(2,33,1),(2,45,12),
(3,5,6),(3,18,2),(3,29,3),(3,50,10),
(4,2,8),(4,14,4),(4,31,2),(4,47,15),
(5,6,3),(5,20,1),(5,34,2),(5,42,25),
(6,8,5),(6,17,3),(6,30,4),(6,48,18),
(7,9,2),(7,21,1),(7,35,3),(7,41,30),
(8,10,4),(8,16,2),(8,32,1),(8,49,20),
(9,11,6),(9,19,3),(9,28,2),(9,46,12),
(10,12,3),(10,13,2),(10,36,4),(10,44,15),
(11,4,7),(11,23,2),(11,27,3),(11,39,18),
(12,7,5),(12,25,1),(12,38,2),(12,43,22),
(13,3,4),(13,24,2),(13,37,3),(13,50,10),
(14,6,6),(14,26,3),(14,29,2),(14,48,15),
(15,8,3),(15,17,2),(15,31,1),(15,47,20),
(16,9,4),(16,22,3),(16,33,2),(16,45,18),
(17,10,5),(17,18,2),(17,34,3),(17,42,25),
(18,11,6),(18,20,3),(18,35,2),(18,41,30),
(19,12,4),(19,21,2),(19,36,3),(19,49,12),
(20,13,5),(20,23,3),(20,37,2),(20,46,15),
(21,14,6),(21,24,2),(21,38,3),(21,43,20),
(22,15,4),(22,25,3),(22,39,2),(22,50,18),
(23,16,5),(23,26,2),(23,40,3),(23,48,22),
(24,17,6),(24,27,3),(24,41,2),(24,47,25),
(25,18,4),(25,28,2),(25,42,3),(25,45,30),
(26,19,5),(26,29,3),(26,43,2),(26,49,18),
(27,20,6),(27,30,2),(27,44,3),(27,46,22),
(28,21,4),(28,31,3),(28,45,2),(28,50,25),
(29,22,5),(29,32,2),(29,46,3),(29,48,30),
(30,23,6),(30,33,3),(30,47,2),(30,49,20);

UPDATE Orders
SET total_cost = (
    SELECT SUM(oi.quantity * p.unit_price)
    FROM OrderItems oi
    JOIN Parts p ON oi.part_id = p.part_id
    WHERE oi.order_id = Orders.order_id
);

SELECT p.category,
       SUM(oi.quantity * p.unit_price) AS total_revenue
FROM OrderItems oi
JOIN Parts p ON oi.part_id = p.part_id
GROUP BY p.category
ORDER BY total_revenue DESC;

