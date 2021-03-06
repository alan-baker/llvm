// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sve < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d -mattr=+sve - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

cmplo   p0.b, p0/z, z0.b, z1.b
// CHECK-INST: cmphi	p0.b, p0/z, z1.b, z0.b
// CHECK-ENCODING: [0x30,0x00,0x00,0x24]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 30 00 00 24 <unknown>

cmplo   p0.h, p0/z, z0.h, z1.h
// CHECK-INST: cmphi	p0.h, p0/z, z1.h, z0.h
// CHECK-ENCODING: [0x30,0x00,0x40,0x24]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 30 00 40 24 <unknown>

cmplo   p0.s, p0/z, z0.s, z1.s
// CHECK-INST: cmphi	p0.s, p0/z, z1.s, z0.s
// CHECK-ENCODING: [0x30,0x00,0x80,0x24]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 30 00 80 24 <unknown>

cmplo   p0.d, p0/z, z0.d, z1.d
// CHECK-INST: cmphi	p0.d, p0/z, z1.d, z0.d
// CHECK-ENCODING: [0x30,0x00,0xc0,0x24]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 30 00 c0 24 <unknown>

cmplo   p0.b, p0/z, z0.b, z0.d
// CHECK-INST: cmplo p0.b, p0/z, z0.b, z0.d
// CHECK-ENCODING: [0x00,0xe0,0x00,0x24]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 e0 00 24 <unknown>

cmplo   p0.h, p0/z, z0.h, z0.d
// CHECK-INST: cmplo p0.h, p0/z, z0.h, z0.d
// CHECK-ENCODING: [0x00,0xe0,0x40,0x24]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 e0 40 24 <unknown>

cmplo   p0.s, p0/z, z0.s, z0.d
// CHECK-INST: cmplo p0.s, p0/z, z0.s, z0.d
// CHECK-ENCODING: [0x00,0xe0,0x80,0x24]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 e0 80 24 <unknown>
