--[[--]]

function spawnNemici()
	-- body

	Nx = math.random(10,width)
	Ny =math.random(10,height) 

	--love.graphics.rectangle("fill", Nx , Ny , 30, 30)   

	table.insert(nemici, {
		x = Nx,
		y = Ny,
		--dir = direction,
		--speed = 350
	})
	nemici.Counter = nemici.Counter + 1
	--bullets.shootDelay = 10

	end


function drawNemici()
	-- body
	local ogg
	for _, ogg in ipairs(nemici) do
		colora(255,0,0)
		--love.graphics.circle("line", ogg.x , ogg.y , nemici.dim) 
		love.graphics.rectangle("line", ogg.x , ogg.y , nemici.dim , nemici.dim) 
		love.graphics.rectangle("fill", ogg.x+5 , ogg.y+5 , nemici.dim-10 , nemici.dim-10) 
		resetColor()

	end
end

