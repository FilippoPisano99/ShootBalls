require "movimento"
require "misc"
require "files"
require "General_math"
require "bullets"

function love.load()
	love.mouse.setVisible( false )

	width = love.graphics.getWidth( )
	height = love.graphics.getHeight( )

	if tonumber(readParam(2,"ShwP")) == 1 then
		ShowParamTable = true
	end

	bullets = { }
	bullets.shootDelay = 10

	player = {}
	player.x = 10
	player.y = 50
	player.width = 50
	player.height = 50
end

function love.update(dt)

	bullets.shootDelay = bullets.shootDelay-1


	move(movmentOption)
	commands()

	delBullets(dt)



end

function love.draw()

	x, y = love.mouse.getPosition( )
	love.graphics.circle("fill", x, y,2 )

	colora(0,150,150)
	love.graphics.rectangle("line", player.x , player.y , player.width, player.height)
	resetColor()

	--love.graphics.line( 0 , height/2, width, height/2 )
	--love.graphics.line( x, y, x, height/2 )

	--love.graphics.circle( "line" , width/2, height/2, math.dist(player.x+25, player.y+25, x,y) )

	if ShowParamTable then
		showParameters()
	end

	--angle = math.atan2(x-a,y-b)

	drawBulltes()

	







end
