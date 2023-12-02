@echo off

echo "[I] gen jar"

del "%~dp0\custom_spider.jar"
rd /s/q "%~dp0\Smali_classes"

echo "[I] Smali_classes"
java -jar "%~dp0\3rd\baksmali-2.5.2.jar" d "%~dp0\..\app\build\intermediates\dex\release\minifyReleaseWithR8\classes.dex" -o "%~dp0\Smali_classes"

rd /s/q "%~dp0\spider.jar\smali\com\github\catvod\spider"
rd /s/q "%~dp0\spider.jar\smali\com\github\catvod\parser"

if not exist "%~dp0\spider.jar\smali\com\github\catvod\" md "%~dp0\spider.jar\smali\com\github\catvod\"

if "%1" == "ec" (
    echo "[I] ec : Smali_classes"
    java -Dfile.encoding=utf-8 -jar "%~dp0\3rd\oss.jar" "%~dp0\Smali_classes"
)

echo "[I] move"
move "%~dp0\Smali_classes\com\github\catvod\spider" "%~dp0\spider.jar\smali\com\github\catvod\"
move "%~dp0\Smali_classes\com\github\catvod\parser" "%~dp0\spider.jar\smali\com\github\catvod\"


rd /s/q "%~dp0\Smali_classes"

echo "[I] spider.jar"
java -jar "%~dp0\3rd\apktool_2.4.1.jar" b "%~dp0\spider.jar" -c

echo "[I]  move to custom_spider.jar"
move "%~dp0\spider.jar\dist\dex.jar" "%~dp0\out\custom_spider.jar"

if exist "%~dp0\out\custom_spider.jar" (
    echo "[I] md5"
    certUtil -hashfile "%~dp0\out\custom_spider.jar" MD5 | find /i /v "md5" | find /i /v "certutil" > "%~dp0\out\custom_spider.jar.md5"
    echo "[DONE]"
    echo "[DONE]"
    echo "[DONE]"
) else (
    echo "[E] can not find spider"
    echo "[E] can not find spider"
    echo "[E] can not find spider"
    echo "[E] can not find spider"
    echo "[E] can not find spider"
)


rd /s/q "%~dp0\spider.jar\smali\com\github\catvod\spider"
rd /s/q "%~dp0\spider.jar\smali\com\github\catvod\parser"

rd /s/q "%~dp0\spider.jar\build"
rd /s/q "%~dp0\spider.jar\dist"
