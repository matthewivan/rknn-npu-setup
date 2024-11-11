# rknn-npu-setup
Quick Environment Setup Guide for Rockchip NPU Boards

# RKNN Board Environment Setup
[rknn toolkit 2 documentation](https://github.com/airockchip/rknn-toolkit2/tree/master/doc)

You can create a virtual environment for this if u want but it isn't necessary for the board (makes it easier to remove if u mess up though)

1. run `dmesg | grep -i rknpu`. check if `initialized rknpu` driver is >= 0.9.2. If not, update driver/firmware [[Radxa Zero 3W with NPU Setup]]
2. move `librknnrt.so` to `/usr/lib` from the [rknn-toolkit2/rknpu2 dir](https://github.com/airockchip/rknn-toolkit2/tree/master/rknpu2/runtime/Linux/librknn_api/aarch64) (this is necessary)
3. query librknnrt.so library version (use `uname -s` or `uname -m` to check system type)
	- `strings /usr/lib/librknnrt.so | grep -i "librknnrt version"`
4. install these libraries *(sudo apt install)*, do *sudo apt update* before this:
	- python3-pip
	- cmake
	- libxslt1-dev
	- libglib2.0-0
	- libgl1-mesa-glx -> this might be needed to run the normal yolo model without the npu on python 3.8 and possibly older versions
	- libprotobuf-dev
	- pkg-config
	- libhdf5-dev

	after this use rknn toolkit 2 lite from my laptop (ver. 2.0.0 not 2.1.0, I hope 2.0.0 works with the librknnrt.so of the built in rk3588 for opi 5 plus which is 1.4.0)

5. install requirements under [rknn-toolkit2/rknn-toolkit2](https://github.com/airockchip/rknn-toolkit2/tree/master/rknn-toolkit2/packages) and choose the appropriate python version, cp38 for python 3.8. Additional requirements: ^footnote2
	- if u get an error when installing tensorflow=2.8.0, just use `pip install tensorflow` instead
	- `pip install opencv-python`
6. install the package wheel based on your python version, cp38 for python38
7. test library by typing `python` then `from rknnlite.api import RKNNLite`

