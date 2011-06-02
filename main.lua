-- General game variables
local windowW = 400
local windowH = 400
local cameraX = 0
local cameraY = 0
local camVerticalLimit = 200

-- Variables used for the tile map
local tileW = 20
local tileH = 20
local tileMap =
{
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
{2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
{3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
{3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
{3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
}

-- Map width and height in tiles
local tileMapW = 30
local tileMapH = 20

local tileDisplayW = 20
local tileDisplayH = 20

local tiles = {}

-- Variables used by the world
local worldW = 1000
local worldH = 1000
local world
local gravity = 500
local speed = 200
local rightMod = 1
local leftMod = 1
local worldObjects = {}
local character = {}

-- Testing variables
local text = ""

function love.load()
	love.graphics.setMode(windowW, windowH, false, true, 0)
	initTiles()
	initWorld()
end

function initTiles()
	for i = 1, 4 do
		tiles[i] = love.graphics.newImage("images/tile_"..i..".png")
	end
end

function initWorld()
	world = love.physics.newWorld(-worldW, -worldH, worldW, worldH)
	world:setGravity(0, gravity)
	world:setCallbacks(add, persist, rem, result)

	for i = 1, tileMapH do
		for j = 1, tileMapW do
			if tileMap[i][j] ~= 0 then
				local temp = {}
				temp.body = love.physics.newBody(world, j * tileW - (tileW / 2), i * tileH - (tileH / 2), 0, 0) -- Positions are center of rectangle
				temp.shape = love.physics.newRectangleShape(temp.body, 0, 0, tileW, tileH, 0)
				local data = {}
				data.type = tileMap[i][j]
				temp.shape:setData(data) -- Save position in tileMap
				table.insert(worldObjects, temp)
			end
		end
	end

	character.body = love.physics.newBody(world, 200, 20, 30, 0) -- Positions are center of rectangle
	character.shape = love.physics.newRectangleShape(character.body, 0, 0, tileW, tileH, 0)
	local charData = {}
	charData.type = 0
	character.shape:setData(charData)

end

function love.update(dt)
	world:update(dt)

	local dx = (speed * dt)
	if love.keyboard.isDown("right") then
		character.body:applyForce(1,0)
		character.body:setLinearVelocity(speed, speed)
		cameraX = cameraX - dx / 4
	elseif love.keyboard.isDown("left") then
		character.body:applyForce(-1,0)
		character.body:setLinearVelocity(-speed, speed)
		cameraX = cameraX + dx / 4
	end
end

function love.draw()
	love.graphics.translate(cameraX, cameraY)
	drawMap()
	love.graphics.print(text.."\n", 0, 0)
end

function drawMap()
	for i, v in ipairs(worldObjects) do
		love.graphics.rectangle("line", v.body:getX() - (tileW / 2), v.body:getY() + (tileH / 2), tileW, tileH) -- Outline tiles
		local data = v.shape:getData()
		if data ~= nil then
			love.graphics.draw(tiles[data.type], v.body:getX() - (tileW / 2), v.body:getY() + (tileH / 2))
		end
	end

	love.graphics.rectangle("line", character.body:getX() - (tileW / 2), character.body:getY() + (tileH / 2), tileW, tileH) -- Outline tiles
	--love.graphics.draw(tiles[4], character.body:getX() - (tileW / 2), character.body:getY() + (tileH / 2))
end

function love.keypressed(key, unicode)
	if key == "up" then
		text = "up"
		character.body:applyForce(0,-25000)
	end
end

-- World callback functions

function add(a, b, coll)
end

function persist(a, b, coll)
end

function rem(a, b, coll)
end

function result(a, b, coll)
end

