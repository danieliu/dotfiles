# Run handler. Argv contains parameters passed to osascript at the command line
on run argv
    # We only care about the first parameter, which is the app name.
    set theApp to the first item of argv

    # Get a list of lists with the primary display bounds.
    # set thePrimaryDisplay to current application's NSScreen's screens()'s firstObject()'s frame()
    # Save the crucial list values.
    # set screenWidth to item 1 of item 2 of thePrimaryDisplay as integer
    # set screenHeight to item 2 of item 2 of thePrimaryDisplay as integer

    # 0.78125 centers the app nicely on the display.
    # set appWidth to screenWidth * 0.78125 as integer
    # We want a 16x9 app window, and set the height accordingly.
    # set appHeight to appWidth / 16 * 9 as integer

    # Set the top left window pixel horizontal coordinate to
    # center the app.
    # set xPos to (screenWidth - appWidth) / 2 as integer
    # Set the top left window pixel vertical coordinate to be
    # closer to the top.
    # Divide by 2 instead of 4 to center the app in the display.
    # set yPos to (screenHeight - appHeight) / 4 as integer

    #
    # This nested tell block puts the upper left corner of the
    # app where it belongs, then resizes the window to 16x9.
    tell application theApp
        activate
        re
        set bounds of window 1 to {0, 0, 1280, 720}
    end tell
end run
