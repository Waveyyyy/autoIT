#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Callum Shanks

 Script Function:
	Automatically navigate to one of my GitHub repos and download a markdown file.

	Just using to learn how to use web handles etc. within autoIT

	v1.1 concatenated multiple Send commmands into one long Send command
	     changed filepath to be universal to any user

	v1.2 removed unused include ("MsgBoxConstants.au3")
	     Program closes windows that it opens, using handles

#ce ----------------------------------------------------------------------------

;################
;#---Includes---#
;################

#include <IE.au3>
#include <StringConstants.au3>

Local $vIE_URL = "https://raw.githubusercontent.com/Waveyyyy/dotfiles/main/README.md"

Local $oIE = _IECreate($vIE_URL)
_IEAction($oIE, "selectall")
_IEAction($oIE, "copy")

Run("notepad.exe")

WinWaitActive("Untitled - Notepad")

Send("^v")

Local $aFilename = StringRegExp(ClipGet(), '(?:# )([a-z].*)', $STR_REGEXPARRAYMATCH)
Local $vFilePath = "C:\Users\%username%\Documents\"

Send("^+s" & $aFilename[0] & ".md" & "{TAB}{DOWN}{DOWN}{ENTER}" & "!d" & $vFilePath & "!s")

Local $hWnd = WinWaitActive("[CLASS:Notepad]")

WinKill($hWnd)

$hWnd = WinWaitActive("[CLASS:IEFrame]")
WinKill($hWnd)
