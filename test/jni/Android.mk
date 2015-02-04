LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LIB_PATH := ../../libs/armeabi-v7a/
LOCAL_MODULE    := libcoffeecatch
LOCAL_SRC_FILES := $(LIB_PATH)libcoffeecatch.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := testcoffee

LOCAL_CFLAGS += -g -funwind-tables

#LOCAL_CFLAGS += \
#    -O3 -g3 \
#    -funwind-tables \
#    -Wl,--no-merge-exidx-entries

LOCAL_CFLAGS += -fPIC -O3 -g3 -Wl,-O1 -g3 -funwind-tables -Wl,--no-merge-exidx-entries
 
SRC_PATH := ../
LOCAL_C_INCLUDES := ../src/

LOCAL_SRC_FILES := $(SRC_PATH)sample.cpp

LOCAL_SHARED_LIBRARIES := libcoffeecatch
	
include $(BUILD_EXECUTABLE)