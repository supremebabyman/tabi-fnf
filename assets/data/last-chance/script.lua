function onCreate()
setProperty('skipCountdown', true)
end

function onSongStart()
setProperty('dad.skipDance',true)
setProperty('opponentCameraOffset[0]', getProperty('opponentCameraOffset[0]') - 200)
cameraSetTarget('dad')
callMethod('camGame.snapToTarget', {''})
callMethod('camGame.fade', {0x000000, 10, true})
setProperty('camGame.scroll.x', -450)
setProperty('freezeCamera', true)
setProperty('camGame.zoom', getProperty('defaultCamZoom') + 0.2)
doTweenZoom('zoo', 'camGame', getProperty('camGame.zoom') + 0.1, 10, 'quartOut')
end

function onStepHit()
if curStep == 128 then
setProperty('dad.skipDance',false)
setProperty('freezeCamera', false)
setProperty('opponentCameraOffset[0]', getProperty('opponentCameraOffset[0]') + 200)
cameraSetTarget('dad')
end
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('genocide')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end

lockedIn = false 
function onEvent(name,v1,v2)
if name == "HScript Call" then
if v1 == "locktoggle" then
lockedIn = not lockedIn
end
end
end

function onUpdate(elapsed)
setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]') + lockedIn and -60 or -150)
if lockedIn and mustHitSection then
setProperty('camGame.zoom',lerp(getProperty('camGame.zoom') + getProperty('defaultCamZoom'),0.2,0.04))
end
end

function lerp(a, b, t)
    return a + (b - a) * t
end

