--by letter D
zoom = 5
--the actuall zoom the begins as soon is the game star

timer = 6
---when the timer for the cam return to normal state.

tim = 10
--this is the timer for how fast do you want the cam to get back to normal


function onCreate()
	doTweenZoom('gamezoom', 'camGame', zoom, 0.1, 'quadInOut');
	   makeLuaSprite('did', '', 0, 0);
        makeGraphic('did',5000,3000,'000000')
              setObjectCamera('did', 'other')
	      addLuaSprite('did', true);

	   makeLuaSprite('d1', 'vignette2', 0, 0);
              setObjectCamera('d1', 'other')
    setProperty('d1.alpha', 1)
	      addLuaSprite('d1', false);
doTweenColor('ww', 'dad', '000000', 0.1, 'linear')
  doTweenX('fuck off', 'gf', -1000, 0.00001, 'linear');
	runTimer('get back', timer)

end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'get back' then
	doTweenZoom('gamezoom', 'camGame', 0.3, tim, 'quadInOut');
		doTweenAlpha('dd','did', 0.9, tim,'linear')
end
end


function onStepHit()
	if curStep == 130 then

doTweenColor('ww', 'dad', 'ffffff', 0.01, 'linear')
doTweenAlpha('w', 'did', 0, 0.1, 'linear')
doTweenAlpha('w2', 'd1', 0, 0.1, 'linear')
	elseif curStep == 760 then
  doTweenX('fuck off2', 'gf', 700, 0.8, 'linear');
end
end