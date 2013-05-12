# Do not use genlock on msm8660 and msm8960
ifneq ($(filter msm8960 msm8660,$(TARGET_BOARD_PLATFORM)),)
	TARGET_USES_GENLOCK := false
else
	TARGET_USES_GENLOCK := true
endif
LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := libgenlock
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := $(common_includes)
LOCAL_SHARED_LIBRARIES        := liblog libcutils
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"libgenlock\"
ifneq ($(TARGET_USES_GENLOCK), false)
	LOCAL_CFLAGS += -DUSE_GENLOCK
endif
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps)
LOCAL_SRC_FILES               := genlock.cpp
include $(BUILD_SHARED_LIBRARY)
