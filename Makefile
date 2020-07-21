CXX := nvcc
TARGET := cudnn_conv
CUDNN_PATH := /usr/local/cuda-10.1
HEADERS := -I $(CUDNN_PATH)/include -I../third_party/nccl/build/include
LIBS := -L $(CUDNN_PATH)/lib64 -L/usr/local/lib -L../third_party/nccl/build/lib
LIBDEVICE := --dont-use-profile -ldir $(CUDNN_PATH)/nvvm/libdevice
CXXFLAGS := -arch=sm_70 -std=c++11 -O2

all: conv

conv: $(TARGET).cu comm.cpp
	$(CXX) $(CXXFLAGS) $(LIBDEVICE) $(HEADERS) $(LIBS) $(TARGET).cu comm.cpp -o $(TARGET) \
	-lcudnn -lpthread -lnccl

.phony: clean

clean:
	rm $(TARGET) || echo -n ""