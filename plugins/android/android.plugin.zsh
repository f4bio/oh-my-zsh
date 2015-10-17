# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

androidscreencap() {
	mkdir -p "$(pwd)/android-screencap"
	TMPIMAGE="$(date +"%Y-%m-%d_%H-%M-%S").png"
	adb shell screencap -p "/sdcard/$TMPIMAGE"
	adb pull "/sdcard/$TMPIMAGE" "$(pwd)/android-screencap" > /dev/null
	adb shell rm "/sdcard/$TMPIMAGE"
	echo "done! $(pwd)/android-screencap/$TMPIMAGE"
}
