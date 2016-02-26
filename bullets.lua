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
		love.graphics.circle("line", o.x+25, o.y+25, 10)
	end
end