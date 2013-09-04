
Stone = {}
Stone.__index = Stone

function Stone.create(width, height, x)
	local this = {}
	setmetatable(this, Stone)
	this:init(width, height, x)
	return this
end

function Stone:init(width, height, x, speed)
	self.width = width
	self.height = height
	self.speed = 0
	self.x = x
	self.y = -height
	self.acceleration = 0.0375
	self.overflowed = false
end

function Stone:update(dt)
	self:refreshSpeed(dt)
	self.y = self.y + self.speed
	if self.y >= love.graphics.getHeight() then self.overflowed = true end
end

function Stone:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Stone:refreshSpeed(dt)
	self.speed = self.speed + self.acceleration
end

function Stone:included(x1, y1, x2, y2)
	flag = false
	if self.x < x1 then
		if self.x + self.width > x1 then
			flag = true
		end
	else -- self.x > x1
		if self.x < x2 then
			flag = true
		end
	end

	if flag == false then return false end

	if self.y < y1 then
		if self.y + self.height > y1 then
			return true
		end
	else -- self.y > y1
		if self.y < y2 then
			return true
		end
	end

	return false
end