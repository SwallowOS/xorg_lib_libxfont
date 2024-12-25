LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#LOCAL_SDK_VERSION := 23

LOCAL_MODULE := libXfont2

LOCAL_C_INCLUDES := \
	swallow/xorg/proto/xorgproto/include \
	swallow/xorg/lib/libfontenc/include \
	swallow/xorg/lib/libxtrans \
	$(LOCAL_PATH)/ \
	$(LOCAL_PATH)/include \
	external/freetype/include \
	$(LOCAL_PATH)/src/stubs \

LOCAL_CFLAGS := -DHAVE_CONFIG_H -DNOFILES_MAX=256 -DNO_LOCALE

LOCAL_SRCS := 	\
	src/bitmap/*.c \
	src/builtins/*.c \
	src/fc/*.c \
	src/FreeType/*.c \
	src/stubs/*.c \
	src/util/*.c \

LOCAL_SRC_FILES := \
	$(foreach F, $(LOCAL_SRCS), $(addprefix $(dir $(F)),$(notdir $(wildcard $(LOCAL_PATH)/$(F))))) \
	src/fontfile/bitsource.c		\
	src/fontfile/bufio.c			\
	src/fontfile/decompress.c		\
	src/fontfile/defaults.c		\
	src/fontfile/dirfile.c		\
	src/fontfile/fileio.c		\
	src/fontfile/filewr.c		\
	src/fontfile/fontdir.c		\
	src/fontfile/fontencc.c		\
	src/fontfile/fontfile.c		\
	src/fontfile/fontscale.c		\
	src/fontfile/gunzip.c		\
	src/fontfile/register.c		\
	src/fontfile/renderers.c		\
	src/fontfile/catalogue.c


LOCAL_SHARED_LIBRARIES := libft2 libfontenc libz libpng


include $(BUILD_SHARED_LIBRARY)


