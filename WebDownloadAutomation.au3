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

	v1.3 added comments to each section
	     changed some of the code formatting

#ce ----------------------------------------------------------------------------

;################
;#---Includes---#
;################

#include <IE.au3>
#include <StringConstants.au3>


; variable with the url as the string param, create a new IE window at the URL.
; select all text on the page and then copy to clipboard.
Local $vIE_URL = "https://raw.githubusercontent.com/Waveyyyy/dotfiles/main/README.md"
Local $oIE = _IECreate($vIE_URL)
_IEAction($oIE, "selectall")
_IEAction($oIE, "copy")


; open a new notepad window and wait until the window is open.
; once the window is open paste clipboard contents to the file.
Run("notepad.exe")
WinWaitActive("Untitled - Notepad")
Send("^v")


; get the filename from the first Markdown header (single '#' char) by using regex.
; create a filepath variable that will work for any user due to use of %username%
; environment variable.
; long Send function to save the file with filename found through regex and a md extension
; appended, then do some finagling with tab and arrow keys to change from .txt to all file types
; alt-d shortcut to change to address bar then enter contents of filepath variable
; into it and then use alt+s to save.
Local $aFilename = StringRegExp(ClipGet(), '(?:# )([a-z].*)', $STR_REGEXPARRAYMATCH)
Local $vFilePath = "C:\Users\%username%\Documents\"
Send("^+s" & $aFilename[0] & ".md" & "{TAB}{DOWN}{DOWN}{ENTER}" & "!d" & $vFilePath & "{ENTER}!s")


; get the handle of the notepad and Internet explorer windows and kill each using said handles.
Local $hWnd = WinWaitActive("[CLASS:Notepad]")
WinKill($hWnd)
$hWnd = WinWaitActive("[CLASS:IEFrame]")
WinKill($hWnd)
