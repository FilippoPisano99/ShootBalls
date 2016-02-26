require "bullets"

function move( mov )

	mov = tonumber(mov)

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

	else
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

end

