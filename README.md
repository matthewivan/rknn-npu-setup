# rknn-npu-setup
Quick Environment Setup Guide for Rockchip NPU Boards

# RKNN Board Environment Setup
[rknn toolkit 2 documentation](https://github.com/airockchip/rknn-toolkit2/tree/master/doc)

You can create a virtual environment for this if u want but it isn't necessary for the board (makes it easier to remove if u mess up though)

1. run `dmesg | grep -i rknpu`. check if `initialized rknpu` driver is >= 0.9.2. If not, update driver/firmware [[Radxa Zero 3W with NPU Setup]]
2. move `librknnrt.so` to `/usr/lib` from the [rknn-toolkit2/rknpu2 dir](https://github.com/airockchip/rknn-toolkit2/tree/master/rknpu2/runtime/Linux/librknn_api/aarch64) (this is necessary)
3. query librknnrt.so library version (use `uname -s` or `uname -m` to check system type)
	- `strings /usr/lib/librknnrt.so | grep -i "librknnrt version"`
4. run `chmod +x install_dependencies.sh` and `./install_dependecies.sh` when you're in the rknntoolkit directory to install all the dependencies
5. test library by typing `python` then `from rknnlite.api import RKNNLite`

# Reinstall Rockchip Drivers
```python
sudo cp /usr/lib/linux-image-5.10.160-26-rk356x/rockchip/overlays/rk3568-npu-enable.dtbo /boot/dtbo
sudo u-boot-update
sudo reboot
```

# Setup i2c, PWM, etc.
1. run `sudo rsetup`
2. pick overlays
3. tick the boxes of the overlays you want to enable (i2c, PWM, etc.)

# Max out NPU clock speed/frequency (this has only been tested on a RADXA Zero 3W)
```bash
sudo su
echo userspace > /sys/class/devfreq/fde40000.npu/governor
echo 900000000 > /sys/class/devfreq/fde40000.npu/userspace/set_freq
```
