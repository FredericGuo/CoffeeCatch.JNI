LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := coffeecatch

SRC_PATH := ../SRC/

LOCAL_CFLAGS += -g -funwind-tables


#LOCAL_CFLAGS += \
#    -O3 -g3 \
#    -funwind-tables \
#    -Wl,--no-merge-exidx-entries

#LOCAL_CFLAGS += -O3 -g3 -funwind-tables -Wl,--no-merge-exidx-entries
LOCAL_CFLAGS += -fPIC -O3 -Wl,-O1 -Wl,--no-undefined, -Wl,--no-merge-exidx-entries

LOCAL_C_INCLUDES := $(SRC_PATH)

LOCAL_SRC_FILES := \
    $(SRC_PATH)coffeecatch.c

include $(BUILD_SHARED_LIBRARY)