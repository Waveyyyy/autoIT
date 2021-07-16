#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Callum Shanks

 Script Function:
	Simple string regex examples

#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>

; Display a message box with an OK button, with a title of SRE Example 1 Result
; and content of what the results of the StringRegExp function is
; (should be 0, as the string test will not be found within the text string)
MsgBox($MB_OK, "SRE Example 1 Result", StringRegExp("text", 'test'))


; Display 2 message boxes with OK buttons, with titles of
; SRE Example 2 Result and content being the results of the StringRegExp functions
; within (first message box compares the string text against the regex 'te[sx]t' and
; the second string compares the string test against the same regex, both should
; display the value 1 as both will be matching the regex)
MsgBox($MB_OK, "SRE Example 2 Result", StringRegExp("text", 'te[sx]t'))
MsgBox($MB_OK, "SRE Example 2 Result", StringRegExp("test", 'te[sx]t'))


; It is possible to use StringRegExp to specify the number of times each character
; will match, or even use a range, the following syntax does this:
; 'character{number of matches}'
; 'character{min, max}'

; Both of the message boxes below should have content of 1 as both strings match
; the regex.
MsgBox($MB_OK, "SRE Example 3 Result", StringRegExp("text", 't{1}e{1}x{1}t{1}'))
MsgBox($MB_OK, "SRE Example 3 Result", StringRegExp("aaaabbbbcccc", 'b{4}'))