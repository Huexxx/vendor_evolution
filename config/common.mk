PRODUCT_BRAND ?= aosp

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Enforce privapp-permissions whitelist
#PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
#    ro.control_privapp_permissions=enforce

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/custom-power-whitelist.xml:system/etc/sysconfig/custom-power-whitelist.xml

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    SystemUI \
    NexusLauncherRelease

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/aosp/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/aosp/overlay/common

# Accents
PRODUCT_PACKAGES += \
    BlackAccent \
    BlueAccent \
    BrownAccent \
    CyanAccent \
    GreenAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    YellowAccent

# Fonts & Customizations
PRODUCT_PACKAGES += \
    BlackTheme \
    LatoFont \
    NavigationBarNoHint \
    RubikFont

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    ThemesStub \
    WallpapersOverlay

# Face Unlock
ifeq ($(TARGET_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_COPY_FILES += \
    vendor/apps/FaceUnlock/prebuilt/product/etc/default-permissions/facesense-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/facesense-default-permissions.xml

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.sense_service=true
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.sense_service=false
endif

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# TouchGestures
PRODUCT_PACKAGES += \
    TouchGestures

# Charger images
include vendor/aosp/config/charger-res.mk

# Branding
include vendor/aosp/config/branding.mk

-include $(WORKSPACE)/build_env/image-auto-bits.mk

# Lawnchair
-include vendor/huexxx-prebuilts/packages/apps/Lawnchair/lawnchair.mk
-include vendor/huexxx-prebuilts/packages/apps/Lawnicons/lawnicons.mk
