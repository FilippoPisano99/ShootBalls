
local resetColorRGB = {255,255,255}
local canShowParam = false

function resetColor()
	love.graphics.setColor(resetColorRGB)
 end

function colora(r,g,b)
	love.graphics.setColor(r,g,b)
end

function colora(r,g,b,a)
	love.graphics.setColor(r,g,b,a)
end

function aspetta(s)
	love.timer.sleep( s )
end


function commands()

	if love.keyboard.isDown("f") then
    	love.window.setFullscreen( true )
		width = love.graphics.getWidth( )
		height = love.graphics.getHeight( )
    end

	if love.keyboard.isDown("escape")  then
    	love.event.quit()
    end

	if love.keyboard.isDown("f1")  and not ShowParamTable then
		showParameters()
    end

	if love.keyboard.isDown("home") then
		player.x = width/2-player.width/2
		player.y = height/2-player.height/2
    end
end

function printText(t,x,y)
	love.graphics.print(t,x,y)
end


function showParameters()

	h = 200
	movmentOption = readParam(1,"mov")
	showP = readParam(2,"ShwP")
	colora(216,216,216, 100)
	love.graphics.rectangle("fill", 5 , 5 , 220, h)
	resetColor()

	colora(0,0,0)
	printText("player.x ="..player.x ,10,10)
	printText("player.y ="..player.y ,10,25)
	printText("FPS ="..love.timer.getFPS( ),10,40)
	printText("Move Option ="..movmentOption,10,55)
	printText("ShwP ="..showP,10,70)
	printText("Nemici ="..nemici.Counter , 10, 85)
	printText("Volume ="..musicVolume , 10, 100)
	printText("Shoot Volume ="..shootVolume, 10 , 115)
	printText("direction Pi ="..direction,10,130)
	printText("direction °  ="..directionGradi , 10 , 145)
	resetColor()
end


function CheckCollision( bull , enem , dim)
  return bull.x+25 > enem.x and
         bull.y+25 > enem.y and
         bull.x+25<= enem.x+dim and
         bull.y+25 <= enem.y+dim
         --y2 < y1+h1--x2 < x1 and
end

--  X : MAX = PerC : 100
function percent( max , perc )
	-- body
	return (max*perc)/100
end

function drawHP()
	-- body
	love.graphics.rectangle("fill", 10 , percent( height , 93 ) , percent(width , 99)-10, 30)
end


function LockFPS( fps , dt )
   	if dt < 1/fps then
		love.timer.sleep(1/fps - dt)
   	end

end