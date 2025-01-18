/**
ИМПОРТ:
fnc_subtitles = compile preprocessFileLineNumbers "function\dialog\YP_fnc_showSubtitles.sqf";


	Играет выбранный звук с субтитрами в стиле ArmA 3

	_title		STRING						Имя спикера

	_subtitles 	STRING						Текст субтитров

	_sound		STRING [DEFAULT "in1"]		Звук для воспроизведения. Один из
											"beep", "in1", "in2", "in3", "in4", "in5", "in6", "noise1", "noise2", "noise3", "noise4"

	_withNoise	BOOLEAN [DEFAULT false]		Запустить помехи на 5 секунд

	_soundOut	STRING [DEFAULT "REPEAT"]	Воспроизвести звук в конце радиопередачи (работает, если _withNoise === true)
											Можно передать имя звука
	
	RETURN: NOTHING

	[ 	"Имя",
		"Сообщение",
		"in1",
		true
		"REPEAT"	] spawn YP_fnc_showSubtitles;

 */
params [
	"_title",
	"_subtitles",
	["_sound", "in1"], 
	["_withNoise", false],
	["_soundOut", "REPEAT"]
];

[_title, _subtitles] spawn BIS_fnc_showSubtitle;
playSound _sound;

if (_withNoise) then {
	if (_soundOut == "REPEAT") then {
		_soundOut = _sound;
	};
	sleep 1;
	playSound selectRandom ["noise1", "noise2", "noise3"];
	sleep 5;
	playSound _soundOut;
};
