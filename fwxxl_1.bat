@echo off

::проверка файлов для обработки во входящей директории
 if not exist "C:\AI\ObmenFW\in\wav1\*.wav" (EXIT)

::перенос файлов из папки входящие во временный каталог, каталоги различаются для каждого задания
 move /Y "C:\AI\ObmenFW\in\wav1\*.wav" "C:\AI\ObmenFW\temp\temp1in"

::распознование файлов из временной папки и запись текстовых файлов в временную папку отправки, каталоги различаются для каждого задания
 C:\AI\WSW\faster-whisper-xxl.exe "C:\AI\ObmenFW\temp\temp1in\*.wav" --device=cuda --compute_type=auto --language Russian --model=large-v3-turbo --output_dir="C:\AI\ObmenFW\temp\temp1out" --output_format=txt --beep_off --check_files --vad_method=pyannote_onnx_v3

::перенос файлов из временной исходящей папки в исходящие, каталоги различаются для каждого задания
 move /Y "C:\AI\ObmenFW\temp\temp1out\*.txt" "C:\AI\ObmenFW\out\txt1"

::удаление всех файлов из временного каталога
 del "C:\AI\ObmenFW\temp\temp1in\*.*" /F /Q
 del "C:\AI\ObmenFW\temp\temp1out\*.*" /F /Q