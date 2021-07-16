#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Example of how to automatically create a file and input text into said file.

#ce ----------------------------------------------------------------------------

; Starts the external program "notepad.exe", thus opening a
; new notepad window.
Run("notepad.exe")

; Checks for window title and pauses script execution until
; the requested window is open, this is used to ensure the
; correct window is being edited.
WinWaitActive("Untitled - Notepad")

; Send's simulated keystrokes to the currently active window
; can even send key combinations, e.g. shift-a (+a), alt-a (!a) etc.
Send("This is some text.")

; Closes the window with the matching title
WinClose("*Untitled - Notepad")

; Waits for a window titled Notepad to open with the text Save visible
WinWaitActive("Notepad", "Save")

; This will send Alt+n to the window, selecting the Don't Save option
; (the key combination can be found by which key the ampersand(&)
; symbol is next to in the Visible Text section of the Window Info Tool
; or by pressing Alt when the window is open)
Send("!n")