/*
 * imgdelta
 *
 *   Copyright (C) 2023 Olaf Kirch <okir@suse.de>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */


#ifndef IMGDELTA_H
#define IMGDELTA_H

#include "util.h"

struct imgdelta_config {
	unsigned int		debug;
	bool			force;
	bool			create_base_layer;

	char *			image_root;
	char *			layer_root;

	struct strutil_array	layers_used;

	struct strutil_array	copydirs;
	struct strutil_array	excldirs;
};

#endif /* IMGDELTA_H */
