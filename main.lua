require 'demo'

function love.load()
	demo.init()
end

function love.draw()
	demo.draw()
end

function love.update(dt)
	demo.update(dt)
end

function love.keypressed(key, unicode)
	demo.keypressed(key, unicode)
end

function love.keyreleased(key)
	demo.keyreleased(key)
end