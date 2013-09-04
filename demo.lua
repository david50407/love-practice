require 'Character'
require 'Stone'

demo = {}
demo.__index = demo

function demo.init()
	keyStatus = {}
	stones = {}
	character = Character.create()
end

function demo.draw()
	character:draw()
	for i, stone in ipairs(stones) do stone:draw() end
	love.graphics.printf(string.format("%d", #stones), 0, 0, 125, "left")
end

function demo.update(dt)
	if keyStatus["escape"] == true then love.event.push("quit") end
	if keyStatus["left"] == true then
		character:left()
	elseif keyStatus["right"] == true then
		character:right()
	end

	rand = math.random(100000)
	if rand % 13 == 0 then
		size = math.random(30) + 20
		speed = math.random(5)
		table.insert(stones, Stone.create(size, size, math.random(love.graphics.getWidth() - size), speed))
	end

	clearList = {}
	for i, stone in ipairs(stones) do
		if stone.overflowed == true then
			table.insert(clearList, i)
		else
			stone:update(dt)
			if stone:included(character:x1(), character:y1(), character:x2(), character.y2()) == true then
				love.event.push("quit")
			end
		end
	end
	if #clearList > 0 then
		for i = #clearList, 1 do
			table.remove(stones, clearList[i])
		end
	end
end

function demo.keypressed(key, code)
	keyStatus[key] = true
end

function demo.keyreleased(key)
	keyStatus[key] = false
end

