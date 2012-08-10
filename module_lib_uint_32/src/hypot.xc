// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include <xclib.h>
#include <xs1.h>
#include <stdio.h>
#include <mathuint.h>
#include <mathuint64.h>

unsigned hypot(int x, int y) {
    int h;
    unsigned l;
    {h,l} = macs(x, x, 0, 0);
    {h,l} = macs(y, y, h, l);
    return sqrt2(h, l);
}
