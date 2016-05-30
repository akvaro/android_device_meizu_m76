# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := audio.primary.m76
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SRC_FILES += tfa/Tfa98xx.c tfa/initTfa9890.c tfa/i2c/NXP_I2C.c
LOCAL_C_INCLUDES += tfa tfa/i2c
LOCAL_SRC_FILES += ril/ril_interface.c
LOCAL_C_INCLUDE += ril
LOCAL_SRC_FILES += audio_hw.c
LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	$(call include-path-for, audio-utils) \
	$(call include-path-for, audio-effects) \
	$(call include-path-for, audio-route)
LOCAL_CFLAGS += -std=c11
LOCAL_SHARED_LIBRARIES := liblog libcutils libtinyalsa libaudioutils libdl libaudioroute
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)