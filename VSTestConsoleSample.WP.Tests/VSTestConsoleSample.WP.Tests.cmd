@echo off
SET "sampledir=%userprofile%\Documents\visual studio 2015\Projects\VSTestConsoleSample"
SET msbuildexe="%PROGRAMFILES(x86)%\MSBuild\14.0\Bin\MSBuild.exe"
SET "APP_DIRECTORY=%sampledir%\VSTestConsoleSample.WP.Tests"
SET vstest="C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\CommonExtensions\Microsoft\TestWindow\vstest.console.exe"
SET "APP_MSBUILD_PATH=%APP_DIRECTORY%\AppPackages\VSTestConsoleSample.WP.Tests_1.0.0.0_x86_Debug_Test\VSTestConsoleSample.WP.Tests_1.0.0.0_x86_Debug.appx"

@echo "building VSTestConsoleSample.WP.App project..."
%msbuildexe% "%sampledir%\VSTestConsoleSample.WP.App\VSTestConsoleSample.WP.App.csproj" -t:Rebuild -p:Configuration=Debug;BuildPlatform=x86 /verbosity:quiet /nologo

@echo "building VSTestConsoleSample.WP.Tests project..."
%msbuildexe% "%APP_DIRECTORY%\VSTestConsoleSample.WP.Tests.csproj" -t:Rebuild -p:Configuration=Debug;BuildPlatform=x86 /verbosity:quiet /nologo

@echo "Running VSTestConsoleSample.WP.Tests via Appx..."
%vstest% "%APP_MSBUILD_PATH%" /settings:"%APP_DIRECTORY%\Local.runsettings" /Platform:x86 /UseVsixExtensions:true /EnableCodeCoverage /InIsolation