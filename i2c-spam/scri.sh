#!/bin/sh
	i2cget -y 0 0x47 0x06 >> i2c_res.txt
	sleep 60
exit 0
