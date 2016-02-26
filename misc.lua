local resetColorRGB = {255,255,255}
local canShowParam = false

function resetColor()
	love.graphics.setColor(resetColorRGB)
 end

function colora(r,g,b)
	love.graphics.setColor(r,g,b)
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

	movmentOption = readParam(1,"mov")
	showP = readParam(2,"ShwP")

	printText("player.x ="..player.x ,10,10)
	printText("player.y ="..player.y ,10,25)
	printText("FPS ="..love.timer.getFPS( ),10,40)
	printText("Move Option ="..movmentOption,10,55)
	printText("ShwP ="..showP,10,70)

end
