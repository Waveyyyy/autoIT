#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Callum Shanks

 Script Function:
	Regex examples that could deal with info from a log file.

#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>


; string variable mimicking a log file, using random to provide a random value
; between 0 and 500 for the number of paper sheets left as would be present
; within a logfile.
Local $vPaperLeft = "There were " & Random(0,500) & " sheets left in the ream of paper."


; array that contains the number of sheets left, picked out of the above created
; variable by use of regex.
; the outside bracket indicates to take a group of text
; the [0-9] indicates what range of numbers that will be present, in this case all digits
; the {1,3} indicates the length of which the group can be, in this case betwen 1 and 3
; characters long
Local $aResult = StringRegExp($vPaperLeft, '([0-9]{1,3})', $STR_REGEXPARRAYMATCH)
If Not @error Then
	MsgBox($MB_OK, "SRE Example 5 Result", $aResult[0])
EndIf


; reassigning the vPaperLeft variable to a new string value
$vPaperLeft = "You used 36 of 279 pages."

; The previously used regex would not work in this scenario and would pick out the
; first value '36' instead of the desired value '279'.
; its noted that 279 is followed by a space and then the word 'pages', we can check
; for this with our regex by adding a 'non-capturing group' [ (?:) instead of () ]
$aResult = StringRegExp($vPaperLeft, '([0-9]{1,3})(?: pages)', $STR_REGEXPARRAYMATCH)
If Not @error Then
	MsgBox($MB_OK, "SRE Example 6 Result", $aResult[0])
EndIf