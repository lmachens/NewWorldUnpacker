@echo off
setlocal enabledelayedexpansion

rem Define a list of folder names
set "folderList=newworld_vitaeeterna nw_arena01 nw_arena02 nw_dungeon_brimstonesands_00 nw_dungeon_cutlasskeys_00 nw_dungeon_edengrove_00 nw_dungeon_everfall_00 nw_dungeon_firstlight_01 nw_dungeon_greatcleave_01 nw_dungeon_reekwater_00 nw_dungeon_restlessshores_01 nw_dungeon_shattermtn_00 nw_dungeon_windsward_00 nw_trial_season_02 nw_trial_season_02_q13 outpostrush"

rem Loop through the folder names
for %%F in (%folderList%) do (
    set "currentFolder=%%F"
    set "folderPath=C:\dev\NewWorldUnpacker\tiles\!currentFolder!"
    
    rem Check if the folder exists and create it if it doesn't
    if not exist "!folderPath!" (
        mkdir "!folderPath!"
    )
    
    rem Process the files in the folder
    for %%f in ("C:\dev\NewWorldUnpacker\out\lyshineui\worldtiles\!currentFolder!\*.dds") do (  
        CompressonatorCLI.exe -fd ARGB_8888 "%%f" "!folderPath!\%%~nf.png"
        cwebp "!folderPath!\%%~nf.png" -o "!folderPath!\%%~nf.webp"
        DEL "!folderPath!\%%~nf.png"
    )
)

endlocal
