#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icon33.ico
#AutoIt3Wrapper_Outfile=bootstrapper.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Constants.au3>
#include <MsgBoxConstants.au3>

Const $ACTION = $SD_STANDBY
Const $TIMEOUT = 20 ; seconds

Const $TITLE = "Standby in progress"
Const $TEXT = "This PC is going into standby in " & $TIMEOUT & " seconds." & @CRLF & @CRLF & "Do you want to continue?"

Func Main()
	; wait for VLC to open
	WinWaitActive("[REGEXPTITLE:.*VLC media player]")

	; wait for vid to be active in VLC
	WinWaitActive("[REGEXPTITLE:.+VLC media player]")

	While 1
		; check title
		If WinGetTitle("[REGEXPTITLE:.*VLC media player]") == "VLC media player" Then
			; halt script to make sure playlist is indeed empty
			Sleep(200)
			If WinGetTitle("[REGEXPTITLE:.*VLC media player]") == "VLC media player" Then
				$CHOICE = MsgBox(BitOr($MB_SYSTEMMODAL, $MB_ICONINFORMATION, $MB_YESNO), $TITLE, $TEXT, $TIMEOUT)

				If $CHOICE = $IDNO Then
					ExitLoop
				EndIf

				WinClose("[REGEXPTITLE:.*VLC media player]")
				Shutdown($ACTION)
				ExitLoop
			EndIf
		EndIf
	WEnd

	Main()
EndFunc

TrayTip("VLC standby bootstrapper", "The bootstrapper is listening for VLC windows...", 10)

Main()
