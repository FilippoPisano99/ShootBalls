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
	--bullets.shootDelay = 10

	end


function drawNemici()
	-- body
	local ogg
	for _, ogg in ipairs(nemici) do
		colora(255,0,0)
		love.graphics.rectangle("fill", ogg.x , ogg.y , 30, 30) 
		resetColor()

	end
end

