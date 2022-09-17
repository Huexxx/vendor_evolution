echo "# start AospExtended build properties"

echo "ro.aex.device=$AOSP_DEVICE"
echo "ro.extended.version=$EXTENDED_VERSION"
echo "ro.extended.releasetype=$EXTENDED_BUILD_TYPE"
echo "ro.modversion=AospExtended-$EXTENDED_VERSION-`$DATE +%Y%m%d-%H%M`-$EXTENDED_BUILD_TYPE"
echo "ro.extended.display.version=AospExtended-$EXTENDED_VERSION-$EXTENDED_BUILD_TYPE"
echo "ro.extended.fingerprint=AospExtended/$EXTENDED_VERSION/$PLATFORM_VERSION/$AOSP_DEVICE/$PACKAGE_BUILD_TYPE/`$DATE +%Y%m%d-%H%M`"
echo "ro.extended.build_date_utc=`$DATE +%s`"

echo "# end AospExtended build properties"
