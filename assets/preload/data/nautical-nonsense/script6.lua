-- script by ItsCapp don't steal, it's dumb

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'-360', '-10'}
downoffsets = {'-110', '-60'}
upoffsets = {'-60', '80'}
rightoffsets = {'-360', '-10'}


-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'pibby_idle'
left_xml_name = 'pibby_left'
down_xml_name = 'pibby_down'
up_xml_name = 'pibby_up'
right_xml_name = 'pibby_right'


-- basically horizontal and vertical positions
x_position = 1900
y_position = 600

-- scales your character (set to 1 by default)
xScale = 1.3
yScale = 1.3

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = false

-- pretty self-explanitory
name_of_character_xml = 'pibby_playable'
name_of_character = 'pibby_playable'
name_of_notetype = 'pibby'
--name_of_notetype2 = '' -- for multiple characters singing at the same time
--altnotetype = '' -- this is used for alt animations (uncomment if you use them)
--altnotetype2 = '' -- this is used for alt animations and singing at the same time (uncomment if you use them)

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = true
playablecharacter = false -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);

	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_character, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_character, 'flipX', false);
	end

	scaleObject(name_of_character, xScale, yScale);


	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_character, 'alpha', 0)
	end
end


local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype then
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation(name_of_character, 'idle');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
end