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
				local direction = math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
			table.insert(bullets, {
				x = player.x,
				y = player.y,
				dir = direction,
				speed = 350
			})
			
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
			local direction = math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
			if bullets.shootDelay <= 0 then
				table.insert(bullets, {
					x = player.x,
					y = player.y,
					dir = direction,
					speed = 350
				})
			bullets.shootDelay = 10
			end
		end

	end

end

