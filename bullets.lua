require "misc"

direction = 0
directionGradi = 0
function delBullets(dt)
	-- body
	
	local i, o
	for i, o in ipairs(bullets) do
		o.x = o.x + math.cos(o.dir) * o.speed * dt
		o.y = o.y + math.sin(o.dir) * o.speed * dt
		if (o.x < -20) or (o.x > width + 20)
		or (o.y < -20) or (o.y > height + 20) then
			table.remove(bullets, i)
		end
	end

end

function drawBulltes()
	-- body
	local i, o
	for i, o in ipairs(bullets) do
		love.graphics.circle("line", o.x+25, o.y+25, 5)
		colora(0,0,255)
		love.graphics.circle("fill", o.x+25, o.y+25, 3)
		resetColor()
		--love.graphics.rectangle("line", o.x+(player.width/2), o.y+(player.height/2), 10 , 10)

		--Destroy if bulltes collide with enemies [It destry bulltes and Enemies]
		for idx,v in ipairs(nemici) do 
			if  CheckCollision(o , v , nemici.dim ) then
				--love.graphics.setBackgroundColor(0,255,0)
				table.remove(bullets, i)
				table.remove(nemici, idx)
				love.graphics.circle("fill", o.x+25, o.y+25, 5)
			end
		end
		
	end
end



function addBullets()
	-- body
	shootSound:play()
	direction = math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
	directionGradi = ((direction * 180 )/3.14159265 )*-1
	--*-1 perchè conta i gradi come i geometri  
	--Questi valori sono  + [0 % 180] e - [180 % 360] 

	if bullets.shootDelay <= 0 then
		table.insert(bullets, {
		x = player.x,
		y = player.y,
		dir = direction,
		speed = 500
	})
	bullets.shootDelay = 10

	end
end