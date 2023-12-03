::Bat-file for whisper-faster.exe
::Transcribe all wav-files in \wav\-folder to txt-files in \txt\-folder
@echo of
for %%a in ("D:\SysAgr_txt\wav\*.wav") do ( 
    echo "%%a"
    echo "%%a" && "D:\SysAgr_txt\whisper-faster.exe" "%%a" --language=Russian --model=large-v3 --output_dir="txt" --output_format=txt --beep_off
)