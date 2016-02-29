require "bullets"
require "misc"

function move( mov )

	mov = tonumber(mov)

	--WASD Move
	if mov == 1 then
		if love.keyboard.isDown("d") then
				player.x = player.x + 5
			elseif love.keyboard.isDown("a") then
				player.x = player.x - 5
			end
			if love.keyboard.isDown("w") then
				player.y = player.y - 5
			elseif love.keyboard.isDown("s") then
				player.y = player.y + 5
			end
			if love.keyboard.isDown("space") or love.mouse.isDown("1") then
				addBullets()
			end
	end
	--Arrow Move
	if mov == 0 then
		if love.keyboard.isDown("right") then
			player.x = player.x + 5
		elseif love.keyboard.isDown("left") then
			player.x = player.x - 5
		end
		if love.keyboard.isDown("up") then
			player.y = player.y - 5
		elseif love.keyboard.isDown("down") then
			player.y = player.y + 5
		end

		if love.keyboard.isDown("space") or love.mouse.isDown("1") then
			addBullets()
		end
	end

	--Collisioni con il bordo Destra/Sinitra
	if player.x < 0 then
		player.x = 0
	end

	if player.x > width - player.width then
		player.x = width - player.width
	end

	--Collisioni con il bordo Su/Giu
	if player.y < 0 then
		player.y = 0
	end
	
	if player.y > height - player.height -  percent( height , 12 )-1 then
		player.y = height - player.height  -  percent( height , 12 )-1
	end

end

