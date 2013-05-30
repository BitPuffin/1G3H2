class "Human"

function Human:Human(screen, entity, sprite, hitbox)
	self.screen = screen
	self.entity = entity
	self.sprite = sprite
	self.direction = "down"
	self.velocity = 0.0
end

function Human:setDirection(dir)
	self.direction = dir
end

function Human:Update(delta)
	if self.velocity == 0.0 then
		self.sprite.playAnimation(self.direction .. "_idle", 0, false)
	else 
		self.sprite.playAnimation(self.direction, 0, false)
	end
end
