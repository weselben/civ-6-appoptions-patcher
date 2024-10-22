#SingleInstance Force

Gui, New
Gui, Add, Text,, Select the Civilization VI configuration file (AppOptions.txt):
Gui, Add, Button, gSelectFile, Select File
Gui, Add, Button, gPreviewChanges, Preview Changes
Gui, Add, Button, gApplyChanges, Apply Changes
Gui, Show,, Sid Meier's Civilization VI AppOption.txt Editor

global configFilePath := ""
global cpuThreads := GetCPUThreads()
global cpuBrand := GetCPUBrand()

return

SelectFile:
FileSelectFile, Path, , , Select AppOptions.txt, Text Files (*.txt)
if !Path
    return
configFilePath := Path
MsgBox "Selected file: %configFilePath%"
return

PreviewChanges:
if configFilePath = ""
{
    MsgBox "Please select a configuration file first."
    return
}

; Calculate values based on CPU information
if cpuThreads > 6
{
    maxGameCoreThreads := 7
    maxJobThreads := 5
}
else
{
    maxGameCoreThreads := cpuThreads
    if cpuBrand = "Intel"
    {
        maxJobThreads := maxGameCoreThreads
    }
    else if cpuBrand = "AMD"
    {
        maxJobThreads := maxGameCoreThreads - 2
        if maxJobThreads < 1
            maxJobThreads := 1
    }
}

maxUnitMovementThreads := maxJobThreads - 1
if maxUnitMovementThreads < 2
    maxUnitMovementThreads := 2

; Show the calculated values before applying them
previewText := "Calculated Values:`n"
previewText .= "MaxJobThreads: " . maxJobThreads . "`n"
previewText .= "MaxGameCoreThreads: " . maxGameCoreThreads . "`n"
previewText .= "MaxGameCoreUnitMovementThreads: " . maxUnitMovementThreads . "`n"
previewText .= "MaxGameCoreTradeRouteThreads: " . maxUnitMovementThreads . "`n"

MsgBox "%previewText%"
return

ApplyChanges:
if configFilePath = ""
{
    MsgBox "Please select a configuration file first."
    return
}

; Perform the calculations as in PreviewChanges
if cpuThreads > 6
{
    maxGameCoreThreads := 6
    maxJobThreads := 5
}
else
{
    maxGameCoreThreads := cpuThreads
    if cpuBrand = "Intel"
    {
        maxJobThreads := maxGameCoreThreads
    }
    else if cpuBrand = "AMD"
    {
        maxJobThreads := maxGameCoreThreads - 2
        if maxJobThreads < 1
            maxJobThreads := 1
    }
}

maxUnitMovementThreads := maxJobThreads - 2
if maxUnitMovementThreads < 2
    maxUnitMovementThreads := 2

; Update configuration file
FileRead, configContent, %configFilePath%
if !InStr(configContent, "MaxJobThreads")
{
    MsgBox "Configuration file format is not as expected."
    return
}

configContent := RegExReplace(configContent, "(?<=MaxJobThreads\s)[-0-9]*", maxJobThreads)
configContent := RegExReplace(configContent, "(?<=MaxGameCoreThreads\s)[-0-9]*", maxGameCoreThreads)
configContent := RegExReplace(configContent, "(?<=MaxGameCoreUnitMovementThreads\s)[-0-9]*", maxUnitMovementThreads)
configContent := RegExReplace(configContent, "(?<=MaxGameCoreTradeRouteThreads\s)[-0-9]*", maxUnitMovementThreads)

FileDelete, %configFilePath%
FileAppend, %configContent%, %configFilePath%

MsgBox "Changes applied successfully."
return

GuiClose:
ExitApp

; Helper functions to get CPU information
GetCPUThreads()
{
    EnvGet, CPUCount, NUMBER_OF_PROCESSORS
    return CPUCount
}

GetCPUBrand()
{
    SysGet, ProcessorName, 114
    if InStr(ProcessorName, "Intel")
        return "Intel"
    else if InStr(ProcessorName, "AMD")
        return "AMD"
    else
        return "Unknown"
}
