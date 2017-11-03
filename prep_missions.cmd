@ECHO OFF

echo Updating LastUpdated and PBOing...
echo Will need Mikero's PBO tools installed...

for /d %%i in (*) do (
	IF /I "%%i" == "Domination_Core" (
		echo Skipping Domination_Core...
	) else (
		IF /I "%%i" == "tools" (
			echo Skipping Tools...
		) else (
			echo Updating onLoadMission for %%i
			echo onLoadName = "Domination Redux - %DATE:/=-%"; > %%i\onLoadMission.hpp
			makePbo -NPM %%i
			echo makePboing %%i
		)
	)
)

PAUSE