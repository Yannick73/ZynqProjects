Small fixes in module pkg, which seemed to violate Vivado syntax.

# Spacewire Light
SpaceWire Light is a SpaceWire encoder-decoder with FIFO interface.

Original Project page at OpenCores:  http://opencores.org/project,spacewire_light

The SpaceWire Light core was adapted to the ÖAW / IWF coding guidelines by Jorge Tonfat (jorge.tonfat at oeaw dot ac dot at)

A detailed list of function changes to the original code can be found in the dedicated VHDL file.

Overview
--------

SpaceWire Light is a SpaceWire encoder-decoder.
It is synthesizable for FPGA targets (up to 200 Mbit on Spartan-3).
Application interfaces include a simple FIFO interface, as well as
an AMBA bus interface for LEON3 system-on-chip designs.

The goal is to provide a complete, reliable, fast implementation
of a SpaceWire encoder-decoder according to ECSS-E-ST-50-12C.
The core is "light" in the sense that it does not provide additional
features such as RMAP, routing etc.

SpaceWire Light supports two application interfaces. One interface
provides FIFO-style access to RX/TX buffers in the core (spwstream).
This interface can be easily integrated into most digital designs.

Alternatively, an AMBA bus interface (spwamba) may be used to integrate
SpaceWire Light into a LEON3 embedded system. This interface supports
DMA-based data transfers. The code for the AMBA interface depends on GRLIB,
a VHDL library from Aeroflex Gaisler. The source of GRLIB must be downloaded
separately from http://www.gaisler.com/.

See doc/Manual.pdf for more information.


License
-------

Copyright 2009-2011 Joris van Rantwijk

Copyright 2021 IWF

SpaceWire Light is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

SpaceWire Light is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with the SpaceWire Light package. If not, see <http://www.gnu.org/licenses/>.

In addition, the parts of SpaceWire Light which do not depend on GRLIB
may be distributed under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1 of the
License, or (at your option) any later version.

You should have received a copy of the GNU Lesser General Public License along
with the SpaceWire Light package. If not, see <http://www.gnu.org/licenses/>.
