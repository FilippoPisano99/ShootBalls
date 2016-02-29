require "movimento"
require "misc"
require "files"
require "General_math"
require "bullets"
require "nemici"

function love.load()
	love.mouse.setVisible( false )

	width = love.graphics.getWidth( )
	height = love.graphics.getHeight( )

	if tonumber(readParam(2,"ShwP")) == 1 then
		ShowParamTable = true
	end

	bullets = { }
	bullets.shootDelay = 10

	nemici = { }
	nemici.Counter = 0
	nemici.dim = 30

	player = {}
	player.hp = 100
	player.x = 200
	player.y = 200
	player.width = 50
	player.height = 50

	player.R = 0
	player.G = 150
	player.B = 150
	
	--[[
	player.R = 255
	player.G = 20
	player.B = 147
--]]

	movmentOption = tonumber(readParam(1,"mov"))
--"BitRush.mp3"
	music = love.audio.newSource("BitRush.mp3" , "stream")
	
	music:play()
	music:setVolume(tonumber(readParam(3,"Mvol")))
	
	--music:setLooping(true)
	musicVolume = music:getVolume()

	shootSound = love.audio.newSource("shootSound.wav","stream")
	--shootSound:setVolume(shootVolume)
	shootVolume = tonumber(readParam(4,"Evol"))
	shootSound:setVolume(shootVolume)
	--love.audio.setPosition( 0,0,0 )

	spawnNemici()
	
	
end

function love.update(dt)

	LockFPS(32,dt)

	bullets.shootDelay = bullets.shootDelay-1
	--Player Triangolo
	--			  xBSin		 yBSin			xACen		yACen		  xBDes			yBDes
	--vertici = { player.x , player.y+50 , player.x+25 , player.y  , player.x+50 , player.y+50}

	move(movmentOption)
	commands()
	
	delBullets(dt)

end

function love.draw()

	x, y = love.mouse.getPosition( )
	

	colora(player.R,player.G, player.B)
	--whale = love.graphics.newImage("troll.jpg")
	--love.graphics.draw(whale, player.x , player.y )
	love.graphics.rectangle("line", player.x , player.y , player.width, player.height)
	colora(player.R-50,player.G-50, player.B-50)
	love.graphics.rectangle("fill", player.x+3 , player.y+3 , player.width-6, player.height-6)
	resetColor()
	colora(255,0,0)
	drawHP()
	resetColor()
	--love.graphics.polygon( "line" , vertici)
	--love.graphics.triangle( "line",  )

	--love.graphics.line( 0 , height/2, width, height/2 )
	--love.graphics.line( x, y, x, height/2 )

	--love.graphics.circle( "line" , width/2, height/2, math.dist(player.x+25, player.y+25, x,y) )

	

	if love.keyboard.isDown("p") then
		spawnNemici()	
	end
	
	drawBulltes()
	drawNemici()

	--Mirino
	love.graphics.circle("fill", x+25, y+25,2 )
	

	if ShowParamTable then
		showParameters()
	end

end
