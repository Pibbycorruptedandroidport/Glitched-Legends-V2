

local defaultNotePos = {};
local spin = true;
local Y1 = 0;
local Y2 = 0;
local X1 = 0;
local X2 = 0;


function onSongStart()
    for i = 0,7 do


        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')


        table.insert(defaultNotePos, {x,y})
      --  debugPrint("{" .. x .. "," .. y .. "}" .. " i:".. i)
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');
    currentBeat = (songPos / 900) * (bpm / 200)
    if  spin == true then
        for i = 0,7 do

            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(X1, X2) * math.sin((currentBeat + i*1.35) * math.pi))

            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(Y1, Y2) * math.cos((currentBeat + i*1.65) * math.pi))

        end
    end
end
function onCreatePost()
            Y1 = 5
            Y2 = -5
            X1 = 5
            X2 = -5
end

function onStepHit()
	if curStep == 240 then
            Y1 = 0
            Y2 = 10
            X1 = 10
            X2 = 0
	elseif curStep == 256 then
            Y1 = 20
            Y2 = 0
            X1 = 20
            X2 = 0

end
end