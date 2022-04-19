-- Intro:
-- (done by Italo)

local composer = require( "composer" )

local scene = composer.newScene()

local snapshot = display.newSnapshot( 4000, 4000)
halfH = display.contentHeight * 0.5

-- Pressing Space to skip the intro
local function onKeyEvent( event )
   if ( "space" == event.keyName and event.phase == "down" ) then
      composer.gotoScene( "game")
   end
 
   return true
end

local skip = "Press Space to skip"

local story =   [[
Your name is David Silver Kinsella,
a hacker that works for the well-known Anonymats,
a hacktivist group that aims to take down several
corrupted governments/institutions.

After spending months investigating a government
that was secretly making experiments on
bats to develop some sort of virus that would create
a huge and negative impact on society.

You finally found sufficient evidence
to go against the government’s claims
and you tried to reach out
to your comrades in Anonymats
but someone from inside
leaked your IP address and went after you.

Unfortunately, they have reached you
and knocked you out.
You do not remember what happened.
Your memory is vague, and you can only
remember the last few events,
such as being laid down into a bed
surrounded by people
that seems to be doctors
from the way they were dressed,
and they were injecting
some weird liquid into your arm.

You now have woken up in a desolated forest
and
you find besides you your only friend;
the good-old trusted crossbow.

As the sun settles,
you see what it seems to be a human,
judging it by its silhouette approaching you.
Upon closer inspection
you notice its deformed features.
It runs towards you,
pointing its claws at you
and lunges in your direction.
You lift your crossbow and shoot.

The creature is now dead, but you notice…






You are not alone...
                ]]

-- -----------------------------------------------------------------------------------
-- Displaying Section
-- -----------------------------------------------------------------------------------
local options = -- Display settings for the text
{
   text = story,
   x = 150,
   y = halfH,
   font = native.systemFont,
   fontSize = 20,
   align = "center"
}

local function introVideo()
   -- Moves the text upwards
   transition.to( snapshot.path, { 
   time = 80000, 
   x1 = 0, y1 = -display.contentHeight, 
   x2 = 0, y2 = -display.contentHeight * 2, 
   x3 = 0, y3 = -display.contentHeight * 2,  
   x4 = -0, y4= -display.contentHeight } )
end

local skipText = display.newText( skip, 1400, 125, native.systemFont, 25 ) -- Display the skip text
local storyText = display.newText( options )                              -- Display the story text

storyText:setFillColor( 0.8, 0.6, 0.4 ) -- Colour of the text
storyText:translate( 250, 440)          -- Position of the text
snapshot.group:insert( storyText )      -- Insert storyText into snapshot
snapshot:translate( 0, halfH )          -- Center snapshot
snapshot:invalidate()                   -- Invalidate snapshot
snapshot:scale( 2, 2 )                  -- Scale snapshot

function scene:show( event )
   introVideo()
end
-- -----------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
Runtime:addEventListener( "key", onKeyEvent )
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
-- -----------------------------------------------------------------------------------

return scene
