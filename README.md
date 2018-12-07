#  Return to Castle Wolfenstein for iOS and tvOS for Apple TV

This is my port of Return to Castle Wolfenstein for iOS. I have also made a target and version for tvOS to run on Apple TV.

Features

- Tested and builds without warnings on Xcode 10.1.
- Runs single player campaign at full screen and full speed on iOS
- Multiplayer support, including server browser
- MFi controller support (reccomended) and on-screen control options
- Second project target for tvOS that takes advantage of focus model and removes on-screen controls.
- Limited support for native menus of original game

You will need to provide your own copies of the `Main` directory from an existing instalation of RTCW. You can grab it on [GOG](https://www.gog.com/game/return_to_castle_wolfenstein) or [Steam](https://store.steampowered.com/app/9010/Return_to_Castle_Wolfenstein/).

There are separate projects for single player (`RTCW-SP-iOS.xcodeproj`) and multiplayer (`RTCW-MP.iOS.xcodeproj`). You will need to drag your directories into the project and select "Create Folder References" and add them to both the iOS and tvOS targets. The folders will be blue if you've done it right:

![folders](https://github.com/tomkidd/RTCW-iOS/raw/master/folders-sp.png)

![folders](https://github.com/tomkidd/RTCW-iOS/raw/master/folders-mp.png)

You can read a lengthy blog article on how I did all this [here](https://schnapple.com/return-to-castle-wolfenstein-for-ios-and-tvos-for-apple-tv/).

This repo was based on the work from my previous *Quake III: Arena* port (more info and attributions [here](https://github.com/tomkidd/Quake3-iOS)) and [iortcw](https://github.com/iortcw/iortcw/), a feature-parity copy of ioquake3 with RTCW changes.  On-screen joystick code came from [this repo](https://github.com/bradhowes/Joystick) by Brad Howe. Code to query servers came from [Q3ServerBrowser](https://github.com/andreagiavatto/Q3ServerBrowser) on GitHub by Andrea Giavatto, using protocol 60 instead of 68.

<!--[Video of RTCW running on an iPhone X](https://www.youtube.com/watch?v=4Fu1fmXtcvo)

[Video of RTCW running on an Apple TV](https://www.youtube.com/watch?v=ade-J3RYpsQ)-->

Have fun. For any questions I can be reached at tomkidd@gmail.com
