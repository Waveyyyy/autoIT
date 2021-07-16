#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Callum Shanks

 Script Function:
	Slightly more advanced regex examples

#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

; Local is used to declare an array, constant or variable with a local scope.
; Can be switched for global (defines variable etc. with a global scope) / dim
; (defines variable etc. with a local scope if it doesnt already exist globally)
; Const declarations must have an initializer value.
Local $aResult = StringRegExp("This is a test example", '(test)', $STR_REGEXPARRAYMATCH)

; this expression matches any groups () and places them within the array,
; for this test strnig the only array entry should be test
If Not @error Then
	MsgBox($MB_OK, "SRE Example 4 Result", $aResult[0])
EndIf


; expression will grab groups of text that match the specifications and store them
; in the return array, this can be done with multiple captures as seen in the
; snippet below.
$aResult = StringRegExp("This is a test example", '(te)(st)', $STR_REGEXPARRAYMATCH)
If Not @error Then
	MsgBox($MB_OK, "SRE Example 4 Result", $aResult[0] & ',' & $aResult[1])
EndIf