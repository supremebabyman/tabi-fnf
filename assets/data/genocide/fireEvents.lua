local splitCameras = false
local tweenBar = false

function onCreate()
setProperty('skipCountdown', true)
end

function onCreatePost()
makeLuaSprite('lighting', nil, -650, -650);
makeGraphic('lighting', screenWidth * 3.5, screenHeight * 3.5, 'FF0000');
scaleObject('lighting', 99, 99, false);
addLuaSprite('lighting', false)
setScrollFactor('lighting',0,0)
setProperty('lighting.alpha', 0)

makeLuaSprite('blackScreen', nil, -650, -650);
makeGraphic('blackScreen', screenWidth * 3.5, screenHeight * 3.5, '000000');
scaleObject('blackScreen', 99, 99, false);
addLuaSprite('blackScreen', false)
setScrollFactor('blackScreen',0,0)
setProperty('blackScreen.alpha', 0)

setProperty('defaultCamZoom', 0.75)
setProperty('camGame.zoom', 0.75)

--Cameras
createInstance('camBoyfriend', 'flixel.FlxCamera')
callMethod('camBoyfriend.copyFrom', {instanceArg('camGame')})
addInstance('camBoyfriend')
createInstance('camDad', 'flixel.FlxCamera')
callMethod('camDad.copyFrom', {instanceArg('camGame')})
addInstance('camDad')
callMethodFromClass('flixel.FlxG', 'cameras.remove', {instanceArg('camBoyfriend'),false})
callMethodFromClass('flixel.FlxG', 'cameras.remove', {instanceArg('camDad'),false})
callMethodFromClass('flixel.FlxG', 'cameras.remove', {instanceArg('camOther'),false})
callMethodFromClass('flixel.FlxG', 'cameras.remove', {instanceArg('camHUD'),false})
callMethodFromClass('flixel.FlxG', 'cameras.add', {instanceArg('camBoyfriend')}) 
callMethodFromClass('flixel.FlxG', 'cameras.add', {instanceArg('camDad')}) 
callMethodFromClass('flixel.FlxG', 'cameras.add', {instanceArg('camHUD'),false}) 
callMethodFromClass('flixel.FlxG', 'cameras.add', {instanceArg('camOther'),false}) 
setProperty('camBoyfriend.width', screenWidth / 2 + 100)
setProperty('camBoyfriend.target', nil)
setProperty('camBoyfriend.scroll.x', 750)
setProperty('camBoyfriend.scroll.y', 50)
setProperty('camBoyfriend.x', 1300) --560
setProperty('camBoyfriend.zoom', 1)
setProperty('camDad.width', screenWidth / 2 + 50)
setProperty('camDad.target', nil)
setProperty('camDad.scroll.x', -250)
setProperty('camDad.scroll.y', -50)
setProperty('camDad.x', -800) -- 0
setProperty('camDad.zoom', 1)
end

function onBeatHit()
if curBeat == 64 then
cameraFlash('game', 'FF0000', 2, true)
end
if curBeat == 192 then
cameraFlash('game', '000000', 2, true)
setProperty('blackScreen.alpha', 0.8)
end
if curBeat == 224 then
doTweenAlpha('blackNig', 'blackScreen', 0, 9)
doTweeAlpha('objectFuck', 'front flame right', 0.85, 9)
doTweeAlpha('objectFuck1', 'front flame left', 0.85, 9)
end
if curBeat == 256 then
cameraFlash('game', 'FF0000', 2, true)
end
if curBeat == 384 then
cameraFlash('game', '000000', 2, true)
setProperty('front flame right.alpha', 0.1)
setProperty('front flame left.alpha', 0.1)
setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.3)
end
if curBeat == 416 then
startTween('fuck1', 'game', {defaultCamZoom = getProperty('defaultCamZoom') - 0.3}, 9, {ease = 'cubeInOut'})
doTweenAlpha('yamecamse', 'blackScreen', 0, 9)
doTweeAlpha('objectFuck2', 'front flame right', 0.85, 9)
doTweeAlpha('objectFuck3', 'front flame left', 0.85, 9)
end
if curBeat == 616 then
tweenBar = true
runHaxeCode('game.updateIconsPosition = ()->{};')
noteTweenY('byeFuck0', 0, (downscroll and -130 or 1200), 4.5, 'quartIn')
noteTweenY('byeFuck4', 4, (downscroll and -130 or 1200), 4.5, 'quartIn')
noteTweenY('byeFuck1', 1, (downscroll and -130 or 1200), 4.2, 'quartIn')
noteTweenY('byeFuck5', 5, (downscroll and -130 or 1200), 4.2, 'quartIn')
noteTweenY('byeFuck2', 2, (downscroll and -130 or 1200), 3.9, 'quartIn')
noteTweenY('byeFuck6', 6, (downscroll and -130 or 1200), 3.9, 'quartIn')
noteTweenY('byeFuck3', 3, (downscroll and -130 or 1200), 4.7, 'quartIn')
noteTweenY('byeFuck7', 7, (downscroll and -130 or 1200), 4.7, 'quartIn')
doTweenY('hidy', 'scoreTxt', (downscroll and -130 or 1200), 3, 'quartIn')
doTweenY('hidy1', 'timeTxt', (downscroll and 1200 or -130), 3, 'quartIn')
doTweenY('hidy2', 'timeBar', (downscroll and 1200 or -130), 3, 'quartIn')
end
end

function onSongStart()
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.y", 300)
setProperty("camFollow.x", 200)
callMethod('camGame.snapToTarget', {''})
setProperty('defaultCamZoom', 1.5)
setProperty('camGame.zoom', 1.5)
cameraFlash('other', '000000', 19, true)
doTweenZoom('okay', 'camGame', 0.7, 19, 'cubeInOit')
--startTween('fuck', 'game', {defaultCamZoom = 0.7}, 19, {ease = 'cubeInOut'})
runTimer('cam', 19)
end

function onTimerCompleted(t)
if t == 'cam' then
setProperty('isCameraOnForcedPos', false)
setProperty('defaultCamZoom', 0.7)
setProperty('camZooming', true)
end
end

function onUpdate(elapsed)
if tweenBar then
setProperty('healthBar.x', getProperty('healthBar.x') + 300 * playbackRate * elapsed)
setProperty('iconP1.x', getProperty('iconP1.x') + 300 * playbackRate * elapsed)
setProperty('iconP2.x', getProperty('iconP2.x') + 300 * playbackRate * elapsed)
end
end

function onMoveCamera(focus)
if splitCameras then
	if focus == 'boyfriend' then
     doTweenX('pointBf', 'camBoyfriend', 540, 0.3, 'quartOut')
     doTweenX('unpointTabi', 'camDad', -50, 0.3, 'quartOut')
    elseif focus == 'dad' then
    doTweenX('unpointBf', 'camBoyfriend', 560, 0.3, 'quartOut')
     doTweenX('pointTabi', 'camDad', 0, 0.3, 'quartOut')
    end
	end
end

function onStepHit()
if curStep == 1816 or curStep == 2392 then
splitCameras = true
doTweenX('pointBf1', 'camBoyfriend', 540, 0.3, 'quartOut')
doTweenX('unpointTabi1', 'camDad', -50, 0.3, 'quartOut')
end
if curStep == 2080 then
splitCameras = false
setProperty('camGame.visible', false)
setProperty('camDad.x', -800)
setProperty('camBoyfriend.x', 1300)
end
if curStep == 2084 then
cameraFlash('game', 'FF0000', 3, true)
setProperty('camGame.visible', true)
end
if curStep == 2464 then
splitCameras = false
doTweenX('byepointBf1', 'camBoyfriend', 1300, 0.3, 'quartOut')
doTweenX('byepointTabi1', 'camDad', -800, 0.3, 'quartOut')
doTweenAlpha('s', 'camGame', 0, stepCrochet/1000 * 32)
startTween('lol', 'game', {defaultCamZoom = 1.5}, 4, {ease = 'circOut'})
setProperty('isCameraOnForcedPos', true)
setProperty('opponentCameraOffset[0]', getProperty('opponentCameraOffset[0]') - 230)
setProperty('opponentCameraOffset[1]', getProperty('opponentCameraOffset[1]') - 130)
cameraSetTarget('dad')
end
end

function opponentNoteHit()
    cameraShake('hud', 0.005, stepCrochet/1000 * 1)
    cameraShake('game', 0.004, stepCrochet/1000 * 1)
    health = getProperty('health')
    if getProperty('health') > 0.03 then
        setProperty('health', health- 0.02);
      end
    end