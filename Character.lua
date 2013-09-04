
Character = {}
Character.__index = Character

function Character.create()
	local this = {}
	setmetatable(this, Character)
	this:init()
	return this
end

function Character:init()
	self.width = 70
	self.height = 100
	self._position = (love.graphics.getWidth() - self.width) / 2
end

function Character:draw()
	love.graphics.rectangle("fill", self._position, love.graphics.getHeight() - self.height, self.width, self.height)
end

function Character:left()
	self._position = self._position - 5
	if self._position < 0 then
		self._position = 0
	end
end

function Character:right()
	self._position = self._position + 5
	if self._position + self.width > love.graphics.getWidth() then
		self._position = love.graphics.getWidth() - self.width
	end
end

function Character:x1()
	return self._position
end

function Character:x2()
	return self:x1() + self.width
end

function Character:y1()
	return self:y2() - self.height
end

function Character:y2()
	return love.graphics.getHeight()
end