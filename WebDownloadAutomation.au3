#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Callum Shanks

 Script Function:
	Automatically navigate to one of my GitHub repos and download a file.

	Just using to learn how to use web handles etc. within autoIT

#ce ----------------------------------------------------------------------------

;################
;#---Includes---#
;################

#include <IE.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Local $vIE_URL = "https://raw.githubusercontent.com/Waveyyyy/dotfiles/main/README.md"

Local $oIE = _IECreate($vIE_URL)
_IEAction($oIE, "selectall")
_IEAction($oIE, "copy")

Run("notepad.exe")

WinWaitActive("Untitled - Notepad")

Send("^v")

Local $aFilename = StringRegExp(ClipGet(), '(?:# )([a-z].*)', $STR_REGEXPARRAYMATCH)
Local $vFilePath = "C:\Users\callumsh\Documents\"

Send("^+s")

Send($aFilename[0] & ".md" & "{TAB}{DOWN}{DOWN}{ENTER}")
Send("!d" & $vFilePath)
Send("!s")