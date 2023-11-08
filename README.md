## VLC standby

The VLC Media Player does not have a built-in option to automatically standby the computer after the playlist ends.

[This guy](https://github.com/tgbv/vlc-shutdown-after-playback) came up with a watcher process which runs independently from vlc thread and checks when a movie is over/playlist is empty.

I modified his script to go into standby instead to shutdown.

The script is written and compiled for Windows OS using [Autoit3](https://www.autoitscript.com).

## Instructions:

Run bootstrapper.exe and then start VLC.

Now each time your movie/playlist ends, a pop-up will show on your screen, warning you that your PC will go into standby in 20 seconds.

If you hit "Yes" it will go into standby immediately. If you hit "No" it will cancel the standby.

<img src="Screenshot.jpg" />

If you often watch films at night and fall asleep before the playlist ends, you can place the bootstrapper.exe in `%AppData%\Microsoft\Windows\Start Menu\Programs\Startup` so the trigger will be online each time Windows boots up.

This app is tested for VLC 3.0.11, it should work with all minor 3.x.x versions
