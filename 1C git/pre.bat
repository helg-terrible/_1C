@echo off
rem Unload 1C sources for erf and epf to ext/ directory

Set Version=8.3.13.1513
Set Path1C="C:\Program Files (x86)\1cv8\%Version%\bin\1cv8.exe"
Set LogFile=.git\hooks\pre-commit.log
Set ExtDir=%cd%\ext

chcp 1251 >nul
echo "%date% %time% Start hooks before commit for unload erf and epf" >>%LogFile%

If NOT EXIST %Path1C% (
 rem 1C Enterprise not found
 exit 1
)

If NOT EXIST %ExtDir%\ md %ExtDir%

for %%f in (*.epf *.erf) do (
 echo %date% %time% запуск выгрузки %%f to %ExtDir%\%%~nf\ >> %LogFile%
 %Path1C% DESIGNER /DumpExternalDataProcessorOrReportToFiles "%ExtDir%\%%~nf" "%%f" /OUT %LogFile% -NoTruncate
)

echo > .commit
