class "HUD"

function HUD:HUD()
	self.screen = Screen()
	self.screen.setNormalizedCoordinates(true, 720)
	self.levelLabel = ScreenLabel("Level: woot, none!", 32, "Sans")
	self.screen.addChild(self.levelLabel)
	self.levelLabel.position.x = -400
	self.levélLabel.position.y = -500
end

function HUD:setLevel(level)
	self.levelLabel.setText("Level: " .. level)
end
