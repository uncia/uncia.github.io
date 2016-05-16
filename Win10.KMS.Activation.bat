@ECHO OFF&PUSHD %~DP0
TITLE title KMS_Activation for Windows 10
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo 请使用右键管理员身份运行！&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion

echo.&echo 本批处理会自动检查Windows10版本，然后导入对应KMS密钥
echo.&echo 通过连接到指定的 KMS 服务器激活 Windows 10 RTM正式版
echo.&echo.

:: 如果激活失败，可能是因为连不到KMS服务器，
:: 你仅需修改下面的KMS服务器地址

set KMS_Sev=kms.cmcc.ml
::set KMS_Sev=zh.us.to
::set KMS_Sev=kms.shuax.com
::set KMS_Sev=skms.ddns.net

::以下内容无需更改
call :verchk
call :adminchk

set Core=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
set CoreCountrySpecific=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
set CoreN=3KHY7-WNT83-DGQKR-F7HPR-844BM
set CoreSingleLanguage=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
set Professional=W269N-WFGWX-YVC9B-4J6C9-T83GX
set ProfessionalN=MH37W-N47XK-V7XM9-C7227-GCQG9
set Enterprise=NPPR9-FWDCX-D2C8J-H872K-2YT43
set EnterpriseN=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
set Education=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
set EducationN=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
set EnterpriseS=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
set EnterpriseSN=2F77B-TNFGY-69QQF-B8YKP-D69TJ

for /f "tokens=3 delims= " %%i in ('reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"') do set EditionID=%%i

if defined %EditionID% (
	cscript //Nologo %windir%\system32\slmgr.vbs /ipk !%EditionID%!
	cscript //Nologo %windir%\system32\slmgr.vbs /skms %KMS_Sev%
	cscript //Nologo %windir%\system32\slmgr.vbs /ato
) else (
	echo.&echo 找不到KEY，请回车输入密钥: "%EditionID%".
	echo.
)
pause
exit

:verchk
ver | find "10.0." >nul 2>nul && (goto :EOF)
echo.&echo 您的当前系统不是Windows 10.
echo.&pause
exit

:adminchk
reg query "HKU\S-1-5-19" >nul 2>nul || (
cls&echo.&echo 请以管理员身份运行！
echo.&echo 请按任意键退出！
echo.&pause>nul
exit)
goto :EOF