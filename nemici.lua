require "General_math"
require "misc"

justOneTime = true

function spawnNemici()
	-- body

	Nx = math.random(10,width)
	Ny = math.random(10,percent(height,88)-40) 

	table.insert(nemici, {
		x = Nx,
		y = Ny,
		speed = 0.5
	})
	nemici.Counter = nemici.Counter + 1
end

function drawNemici()
	-- body
	local ogg
	for idx, ogg in ipairs(nemici) do


		-- Determina l'angolo presente tra player e nemico
   		angle = math.angle(ogg.x, ogg.y, player.x, player.y)
   		
   		ogg.x = ogg.x + math.cos(angle) * ogg.speed
   		ogg.y = ogg.y + math.sin(angle) * ogg.speed


   		--IF Enemy hit the Player
   		if CheckCollisionWithPlayer( player , ogg , nemici.dim)then
   			
			
			if player.hp > 1 then
				player.hp = player.hp-0.10
			else
				player.hp = 0
				buffHPforBanner = 0
				gameOver = true
				if justOneTime then
					gameOverSound = love.audio.newSource("gameOverSound.mp3")
					gameOverSound:play()
					justOneTime = false
				end
			end
		end

		colora(255,0,0)
		love.graphics.rectangle("line", ogg.x , ogg.y , nemici.dim , nemici.dim) 
		love.graphics.rectangle("fill", ogg.x+5 , ogg.y+5 , nemici.dim-10 , nemici.dim-10) 
		resetColor()


	end
end
