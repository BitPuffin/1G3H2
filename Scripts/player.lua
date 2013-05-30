require "Scripts/human"



class "Player" (Human)

function Player:Player(screen, entity)
	Human.Human(self, screen, entity, safe_cast(entity:getEntityById("sprite", true), ScreenSprite), safe_cast(entity:getEntityByID("hitbox", true) ScreenShape))
end
