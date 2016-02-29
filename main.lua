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
	paused = false
	gameOver = false
	OndateDelay = 50
	difficolta = 1

	if tonumber(readParam(2,"ShwP")) == 1 then
		ShowParamTable = true
	end

	bullets = { }
	bullets.shootDelay = 10

	nemici = { }
	nemici.Counter = 0
	nemici.dim = 30
	nemici.x = 0
	nemici.y = 0

	player = {}
	player.hp = 100
	player.score = 0
	player.x = 200
	player.y = 200
	player.width = 50
	player.height = 50


	player.R = 0
	player.G = 150
	player.B = 150

	movmentOption = tonumber(readParam(1,"mov"))

	music = love.audio.newSource("BitRush.mp3" , "stream")
	music:play()
	music:setVolume(tonumber(readParam(3,"Mvol")))
	music:setLooping( true )

	musicVolume = music:getVolume()

	shootSound = love.audio.newSource("shootSound.wav")
	shootVolume = tonumber(readParam(4,"Evol"))
	shootSound:setVolume(shootVolume)
	--resetColor()

	bg = love.graphics.newImage("bg.png")




end

function love.update(dt)
	if not paused then
		LockFPS(32,dt)

		bullets.shootDelay = bullets.shootDelay-1
		--Player Triangolo
		--			  xBSin		 yBSin			xACen		yACen		  xBDes			yBDes
		--vertici = { player.x , player.y+50 , player.x+25 , player.y  , player.x+50 , player.y+50}

		move(movmentOption)
		commands()

		delBullets(dt)
	end
end

function love.draw()
	if not paused then
		love.graphics.draw(bg, 0, 0)
		OndateDelay = OndateDelay - 1
		x, y = love.mouse.getPosition( )

		--PLAYER
		colora(player.R,player.G, player.B)
		love.graphics.rectangle("line", player.x , player.y , player.width, player.height)
		colora(player.R-50,player.G-50, player.B-50)
		love.graphics.rectangle("fill", player.x+3 , player.y+3 , player.width-6, player.height-6)
		resetColor()



		--love.graphics.polygon( "line" , vertici)
		--love.graphics.triangle( "line",  )

		--love.graphics.line( 0 , height/2, width, height/2 )
		--love.graphics.line( x, y, x, height/2 )

		--love.graphics.circle( "line" , width/2, height/2, math.dist(player.x+25, player.y+25, x,y) )

		if OndateDelay <= 0 then
			rnd= math.random(5*difficolta,32)
			for i=1,rnd do
				spawnNemici()
			end
			OndateDelay = rnd*30+difficolta/2
			difficolta = difficolta + 3
		end





		drawBulltes()
		drawNemici()




		--Mirino
		love.graphics.circle("fill", x+25, y+25,5 )


		if ShowParamTable then
			showParameters()
		end

		drawStats()

		--Asse Verticale
		--colora(0,0,255)
		--love.graphics.line( width/2, 0, width/2, height )

	end

	if gameOver then
		paused = true
		love.graphics.clear( )
		music:pause()

		love.graphics.setBackgroundColor(0,0,0)
		gameOver = love.graphics.newImage("gameOver.png")
		love.graphics.draw(gameOver, width/2-200, height/2-70)
		love.graphics.print("Score\n "..player.score, width/2-25, height/2+100 , 0 , 1.5,1.5)
		commands()
	end
end

function love.focus(t)
	if not t then
		paused = true;

		music:pause()
	else
		paused = false;
		music:resume()
	end
end
