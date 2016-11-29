@echo off
upx.exe SubtitleAPI\SubtitleAPI.dll --compress-exports=1 --compress-resources=1 --strip-relocs --best --compress-icons=1

upx.exe SubtitleWorkshop.exe --compress-exports=1 --compress-resources=1 --strip-relocs --best --compress-icons=1
