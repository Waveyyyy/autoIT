#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Callum Shanks

 Script Function:
	Script that prints Hello World in a Message Box

#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>


; MsgBox takes 3(Three) required parameters and 2 Optional
; MsgBox(flag, Title, Message, timeout = 0, hwnd)

;-------------------------- Required --------------------------
; Flag is a number that changes the method of displaying MsgBox
; Title and Message are both String parameters

;-------------------------- Optional --------------------------
; Timeout, is a value in seconds, after timout has elapsed
; the Message Box will close (default value is zero)
; hWnd, is the windows handle to use as a parent for
; the dialog box

;------------------------ Documentation -----------------------
; https://www.autoitscript.com/autoit3/docs/functions/MsgBox.htm


; $MB_OK as used below, displays a Message Box with an OK button.
MsgBox($MB_OK, "Tutorial", "Hello World!")

; $MB_ICONINFORMATION will display in the same way, BUT with an information icon.
MsgBox($MB_ICONINFORMATION, "Tutorial", "Hello World!")


Local $iTimeout = 10

; $MB_SYSTEMMODAL displays a Message Box with an OK button, this option
; will block the user from working in the window defined by hWnd parameter
; until they respond to the message.
; Usually used for critical errors.
MsgBox($MB_SYSTEMMODAL, "Tutorial", "This Message will timeout afer " & $iTimeout & " seconds, or the OK button is pressed", $iTimeout)