# seed-previewer
All the code for my twitter bot that posts images of Minecraft seeds

The python code should run fine anywhere. I made it on Windows, so it may have issues elsewhere. Realistically it can be used to post any images from a folder since that code is fairly generic. The real Minecraft stuff is in the AutoHotKey script.

My AutoHotKey script:
Deletes the top world
Creates a new Creative world
Creates a new folder in the given directory named after the seed
Takes four screenshots
Moves those screenshots into the seed folder
Exits to the main menu

The loop at the top can be changed to create as many worlds as you like. Given the nature of AutoHotKey and Minecraft, some inputs can be missed due to lag or system hangs. It's best to check in on the script when running it for long periods of time as it can occasionally get stuck.
