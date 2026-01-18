local dir = 'stages/restaurant/'

function onCreatePost()
makeLuaSprite('bg', dir..'bg', -200, -150)
addLuaSprite('bg', false)
scaleObject('bg', 1.65, 1.65, false)

makeLuaSprite('chandelier', dir..'chandelier', 250, -400)
addLuaSprite('chandelier', false)
setScrollFactor('chandelier', 1.05, 1.05)

makeLuaSprite('fg', dir..'fg', -800, 600)
scaleObject('fg', 2.0, 2.0);
addLuaSprite('fg', true)
setScrollFactor('fg', 1.25, 1.25)
setProperty('fg.alpha', 0.75)
end


