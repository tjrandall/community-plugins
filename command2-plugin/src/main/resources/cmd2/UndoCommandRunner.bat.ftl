@echo off
setlocal

<#assign envVars=deployed.envVars />
<#list envVars?keys as envVar>
set ${envVar}=${envVars[envVar]}
</#list>

<#if deployed.file??>
REM do not remove - this actually triggers the upload
cd "${deployed.file}"
</#if>

<#if deployed.undoCommand??>
${deployed.undoCommand}
<#else>
echo No undo command specified. Nothing to do.
endlocal
exit
</#if>

set COMMAND_EXIT_CODE=%ERRORLEVEL%

endlocal
exit %COMMAND_EXIT_CODE%