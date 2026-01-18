local bumpThing = false

function onStepHit()
if curStep == 65 then
setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
end
if curStep == 96 then
setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]') + 30)
cameraSetTarget('bf')
end
if curStep == 128 then
setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.2)
setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]') - 30)
end
if curStep == 640 then
setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
bumpThing = true
end
if curStep == 760 then
bumpThing = false
setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
end
if curStep == 768 then
bumpThing = true
setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
end
if curStep == 896 then
bumpThing = false
setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
end
if curStep == 1152 then
setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
end
if curStep == 1184 then
setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.15)
end
if curStep == 1440 then
setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
end
end

function onBeatHit()
if bumpThing then 
if curBeat % 2 == 0 then
flick()
setProperty('camHUD.angle', 1)
setProperty('camGame.angle', 1)
else
flick()
setProperty('camHUD.angle', -1)
setProperty('camGame.angle', -1)
end
end
end

function onUpdate(elapsed)
setProperty('camGame.angle',lerp(getProperty('camGame.angle'),0,0.15))
setProperty('camHUD.angle',lerp(getProperty('camHUD.angle'),0,0.04)) 
end

function lerp(a, b, t)
    return a + (b - a) * t
end

function flick()
for i = 0,7 do
setPropertyFromGroup('strumLineNotes', i, "y", getPropertyFromGroup('strumLineNotes', i, "y") + 10 + i * 6)
noteTweenY('okay'..i, i, (downscroll and 570 or 50), 0.23, 'backOut')
end
end