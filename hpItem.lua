require "General_math"
require "misc"



function spawnHp()
	-- body

	Rx = math.random(10,width)
	Ry = math.random(10,percent(height,88)-40) 

	table.insert(Hp, {
		x = Rx,
		y = Ry,
	})
end

function drawHp()
	-- body
	for idx, ogg in ipairs(Hp) do
		colora(255,255,255)
		love.graphics.rectangle("line", ogg.x , ogg.y , Hp.dim , Hp.dim) 
		love.graphics.rectangle("fill", ogg.x+3 , ogg.y+3 , Hp.dim-6 , Hp.dim-6) 
		colora(255,0,0)
		love.graphics.rectangle("fill", ogg.x+Hp.dim/2-3 , ogg.y , 6 , Hp.dim) 
		love.graphics.rectangle("fill", ogg.x , ogg.y+Hp.dim/2-3 ,Hp.dim,6) 
		resetColor()
	end

end


function delHp()
	-- body
	for idx, ogg in ipairs(Hp) do

   	--IF Hp hit the Player
		if CheckCollisionWithPlayer( player , ogg , Hp.dim)then
			table.remove(Hp,idx)
			player.hp = player.hp + 5
			if player.hp > 100 then
				player.hp = 100
			end
		end
   	end
end