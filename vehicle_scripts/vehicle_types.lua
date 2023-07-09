-- здесь мы храним информацию о данных, своственных конкретным ТИПАМ транспортов. По задумке, мы сможем получить к ним доступ из конкретного транспорта.

-- константы означающие типы транспортов
VEHICLE_TYPE_JEEP = 1
VEHICLE_TYPE_HELICOPTER = 31
VEHICLE_TYPE_JET = 32


local vehicles_info = {}

--произвольный список полей.
vehicles_info[VEHICLE_TYPE_JEEP] = {
	name = "JEEP",
	maxSpeed = 123,
	maxAcceleration = 123,
	weight = 100,
	distanceBetweenWheels = 100,
	hasSuspension = 0,
	isCar = true,
	yawAccelerationTime = 7,
	yawAccelerationCurve = 1,
	yawMaxSpeed = 17,
	throttleAccelerationTime = 20,
	throttleAccelerationCurve = 0.6,
	throttleMaxSpeed = 900,
	offsetZFromWheelsToRoot	= 0 -- MAKE FUNCTION
}

vehicles_info[VEHICLE_TYPE_HELICOPTER] = {
	name = "HELICOPTER",
	maxSpeed = 123,
	maxVerticalSpeed = 123,
	maxAcceleration = 123,
	isHelicopter = true
}

vehicles_info[VEHICLE_TYPE_JET] = {
	name = "JET",
	maxSpeed = 123,
	maxAcceleration = 123,
	isPlane = true
}

-- единственная функция, которая вернет обьект с информацией, свойственной vehicleType
function getVehicleInfo(vehicleType)
	return vehicles_info[vehicleType]
end