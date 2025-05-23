if exist "C:\AI\Whisper\_stateR1.txt" EXIT

@echo running > _stateR1.txt

set logfile=_timelog1.txt

for %%a in ("C:\AI\Whisper\wav1\*.wav") do ( 

    rem echo *** start *** >> %logfile%
    rem echo "%%a" >> %logfile%
	
    rem echo Current time: %time% >> %logfile%

    echo "%%a"
    echo "%%a" > _stateR1.txt
    echo "%%a" && "C:\AI\Whisper\whisper-faster.exe" "%%a" --language=Russian --model=large-v3 --output_dir="txt2" --output_format=txt --beep_off
    del "%%a"
	
    rem echo Current time: %time% >> %logfile%
    rem echo *** end *** >> %logfile%

)

del "C:\AI\Whisper\_stateR1.txt"