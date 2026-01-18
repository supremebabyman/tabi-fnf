local dir = 'stages/restaurant/fire/'

function onCreatePost()
makeLuaSprite('bg', dir..'bg', -250, -150)
addLuaSprite('bg', false)
scaleObject('bg', 1.65, 1.65, false)

makeAnimatedLuaSprite('backmost flames', dir..'backmost flames', -3, 9)
addLuaSprite('backmost flames', false)
addAnimationByPrefix('backmost flames', 'i', 'Symbol 7 instance 1', 24, true)
scaleObject('backmost flames', 2.6, 2.6, false)

makeLuaSprite('tables', dir..'bg2', -250, -150)
addLuaSprite('tables', false)
scaleObject('tables', 1.65, 1.65, false)

makeLuaSprite('glow', dir..'glow', -700, 500)
scaleObject('glow', 4.0, 4.0);
addLuaSprite('glow', true)
setScrollFactor('glow', 0.1, 0.1)

makeAnimatedLuaSprite('front flame right', dir..'front flame right', -820, 81)
scaleObject('front flame right', 2.0, 2.0);
addLuaSprite('front flame right', true)
addAnimationByPrefix('front flame right', 'i', 'fire instance 1', 24, true)
setScrollFactor('front flame right', 1.3, 1.3)

makeAnimatedLuaSprite('front flame left', dir..'front flame left', 1463, 125)
scaleObject('front flame left', 2.0, 2.0);
addLuaSprite('front flame left', true)
addAnimationByPrefix('front flame left', 'i', 'fire instance 1', 24, true)
setScrollFactor('front flame left', 1.3, 1.3)

makeLuaSprite('vignette', 'vignette', 0, 0)
addLuaSprite('vignette')
setObjectCamera('vignette', 'hud')
screenCenter('vignette')
scaleObject('vignette', 4.4, 4.4, false)
setBlendMode('vignette', 'multiply');
setProperty('vignette.alpha', 0.4)
end


