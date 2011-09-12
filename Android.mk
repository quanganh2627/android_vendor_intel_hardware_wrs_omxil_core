ifeq ($(strip $(BOARD_USES_WRS_OMXIL_CORE)),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_COPY_HEADERS := \
    core/inc/khronos/openmax/include/OMX_IndexExt.h \
    core/inc/khronos/openmax/include/OMX_VideoExt.h \

include $(BUILD_COPY_HEADERS)

include $(CLEAR_VARS)

WRS_OMXIL_CORE_ROOT := $(LOCAL_PATH)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/10_wrs_omxil_core.cfg:system/etc/10_wrs_omxil_core.cfg
#$(call add-prebuilt-files, ETC, 10_wrs_omxil_core.cfg)

COMPONENT_SUPPORT_BUFFER_SHARING := false
COMPONENT_SUPPORT_OPENCORE := false

# core
-include $(WRS_OMXIL_CORE_ROOT)/core/src/Android.mk

# base class
-include $(WRS_OMXIL_CORE_ROOT)/base/src/Android.mk

# utility
-include $(WRS_OMXIL_CORE_ROOT)/utils/src/Android.mk

endif
