require "Scripts/level"
require "Scripts/hud"

levels = {}
current_index = 1
levels[1] = "level1"

level = Level(levels[current_index])

function Update(delta)
	if not level.completed then
		level.update()
	else
		current_index = current_index + 1
		level.setLevel(levels[current_index])
	end
end

