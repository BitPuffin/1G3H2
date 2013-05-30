require "Scripts/hud"
require "Scripts/player"
require "Scripts/enemy"

class "Level"

function Level:Level(name)
	self.loaded = false
	self.name = name
	self.current = nil
	self.completed = false
	
	self:initLevel()
end

function Level:initLevel()
	self:checkCurrent()
end

function Level:checkCurrent()
	if self.current is not self.name then
		self.screen = PhysicsScreen(40, 60.0)
		self.screen:setNormalizedCoordinates(true, 720)
		self.level = ScreenEntityInstance("Resources/levels/".. self.name .. ".entity2d")
		self.current = self.name
		self.screen:addChild(self.level)
		self.playerEntity = self.level:getScreenEntityById("player", true) -- Lol what's the true for
		self.player = Player() -- FIXME
		self.screen:trackCollisionChild(self.player.hitbox, PhysicsScreenEntity.ENTITY_RECT)
		
		local walls = self.level:getScreenEntitiesByTag("wall", true)
		for i=1, count(walls) do
			self.screen:trackCollisionChild(walls[i].hitbox, PhysicsScreenEntity.ENTITY_RECT)
		end

		self.takethem = self.lever:getScreenEntitiesByTag("takeit", true)
		for i=1, count(self.takethem) do
			self.screen:trackCollisionChild(self.takethem[i].hitbox, PhysicsScreenEntity.ENTITY_RECT)
		end

		self.enemies = {}
		local e = self.screen:getScreenEntitiesByTag("enemy", true)
		for i=1, count(e) do
			self.screen:trackCollisionChild(e[i].hitbox, true)
			self.enemies[i] = Enemy() -- FIXME
		end

		self.screen:addEventListener(self, Level:onNewCollision, PhysicsScreenEvent.EVENT_NEW_SHAPE_COLLISION)A

		self.hud = HUD()
		self.hud:setLevel(self.name)
		self.loaded = true
	end
end

function Level:setLevel(level)
	self.name = level
	self.completed = false
	self.loaded = false
end

function Level:Update(delta)
	self:checkCurrent()
	
	self.player:Update(delta)
	
	for i=1, count(self.enemies) do
		self.enemies[i]:Update(delta)
	end
	
	
end

