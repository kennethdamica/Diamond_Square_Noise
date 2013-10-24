_lg = love.graphics
ds = require('Diamond_Square_Noise')

function love.load()
	tiling = false
	Generate_heightmap()
end

function love.update(dt)

end

function love.draw()
	_lg.draw(heightmap_image,0,0)
	if tiling then
		_lg.draw(heightmap_image,size,0)
		_lg.draw(heightmap_image,0,size)
		_lg.draw(heightmap_image,size,size)
	end
	_lg.print('Press r to generate new map.',0,0)
	_lg.print('Press t to toggle tiling.',0,14)
end

function love.keypressed(key, code)
	if key == 'r' then
		Generate_heightmap()
	elseif key == 't' then
		tiling = not tiling
	end
end

function Generate_heightmap(size)
	local size = size or 513
	assert(math.floor(math.log(size-1)/math.log(2)) == math.log(size-1)/math.log(2), 
			"ERROR: Argument 'size' must be of the form 2^n + 1")
	heightmap = ds:create(size)
	
	heightmap_data = love.image.newImageData(size,size)
	for col = 0,#heightmap do
		for row=0,#heightmap[col] do
			local val = heightmap[col][row]
			val = math.min(val,255)
			val = math.max(val,0)
			if val > 200 then 
				heightmap_data:setPixel(row,col,val,val,val,255)
			elseif val > 90 then
				heightmap_data:setPixel(row,col,0,val,0,255)
			else
				heightmap_data:setPixel(row,col,0,0,val*2.5,255)
			end	
			
		end
	end
	
	heightmap_image = _lg.newImage(heightmap_data)
end