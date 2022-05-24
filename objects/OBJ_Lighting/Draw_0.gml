/// @description Draw light / shadow

dont_draw_self();

if (global.lighting.ambient < 1) {
	// get necessary global variables
	var camL = global.camera.xFrameskip;
	var camT = global.camera.yFrameskip;
	var camW = global.camera.wd;
	var camH = global.camera.ht;
	var camX = global.camera.xPos;
	var camY = global.camera.yPos;
	var gls = global.lighting.surface;
	var resW = global.resolution.internal.wd;
	var camZoom = global.camera.wd / resW;
	var ambient = (255*0.01)*(global.lighting.ambient*100);
	var ambientColor = make_color_rgb(ambient, ambient, ambient);

	// don't waste computations if not needed
	if (lightUpdateCounter <= 0) {
	
		// get necessary global variables
		var lightingType = global.lighting.lightingType;
		var lightSprite = (lightingType == lightingType.gaussian ? SPR_GaussianLight : (lightingType == lightingType.retroBanded ? SPR_RetroBandedLight : SPR_RetroDitheredLight));
		var divideByCamZoom = 1/camZoom;
		var l, c;
		var _l = array_length(lights);
		var _c = array_length(casters);
		var ls = lights;
		var cs = casters;

		//clear the global lighting surface
		surface_set_target(gls);
		draw_clear(ambientColor);
		surface_reset_target();

		// cycle through every light
		for (l=0; l<_l; l++) {
			with (ls[l].id) {
			
				// set up local variables to avoid recalculations
				var lx, ly, lw, lh, lwd2, lhd2, lwp2, lhp2, imin, imax, i, pdmin, pdmax, minx, miny, maxx, maxy, a_min, a_max, a_test, lightColor, lightStrength, lightDistance, flicker, flickerX, flickerY, lightSurface, lightSurfaceSizeChanged, lightDepth;
		
				lightDistance = self.lighting.distance;
				lw = LIGHT_WD*lightDistance;
				lh = LIGHT_HT*lightDistance;
				lwd2 = lw*0.5;
				lhd2 = lh*0.5;
				lwp2 = round_to_smallest_power_two(lw);
				lhp2 = round_to_smallest_power_two(lh);
				lx = self.x;
				ly = self.y;
			
				lightColor = self.lighting.clr;
				lightStrength = self.lighting.strength;
				flicker = (lightingType == lightingType.gaussian ? self.lighting.flicker : self.lighting.flicker*0.5);
				flickerX = round(random_range(-1*flicker, flicker));
				flickerY = round(random_range(-1*flicker, flicker));
				lightDepth = self.depth;
		
				lightSurface = self.lighting.surface;
				lightSurfaceSizeChanged = (surface_exists(lightSurface) && (surface_get_width(lightSurface) != lwp2 || surface_get_height(lightSurface) != lhp2) ? true : false);
		
				// don't redraw the light's surface if it exists and the light hasn't moved or changed size
				if (!surface_exists(lightSurface) || lx != xprevious || ly != yprevious || lightSurfaceSizeChanged || flicker != 0) {
		
					// if light size has changed or surface no longer exists, recreate surface
					if (lightSurfaceSizeChanged) {
						surface_free(self.lighting.surface);
						self.lighting.surface = surface_create(lwp2, lhp2);
						lightSurface = self.lighting.surface;
					} else if (!surface_exists(lightSurface)) {
						self.lighting.surface = surface_create(lwp2, lhp2);
						lightSurface = self.lighting.surface;
					}
		
					// draw white over entire individual light surface
					surface_set_target(lightSurface);
					draw_clear_alpha(c_white, 1);

					if (global.lighting.shouldShadowCast) {
						// cycle through every shadow caster
						for (c=0; c<_c; c++) {
							with (cs[c].id) {
						
								// determine if shadow caster will be visible in this light
								var px, py, bboxL, bboxR, bboxT, bboxB;
					
								bboxL = sprite_xoffset - sprite_get_bbox_left(sprite_index)*image_xscale;
								bboxR = (sprite_get_bbox_right(sprite_index)+1)*image_xscale - sprite_xoffset;
								bboxT = sprite_yoffset - sprite_get_bbox_top(sprite_index)*image_yscale;
								bboxB = (sprite_get_bbox_bottom(sprite_index)+1)*image_yscale - sprite_yoffset;
					
								px[0] = lengthdir_x(bboxL, image_angle + 180) + lengthdir_x(bboxT, image_angle + 90);
								py[0] = lengthdir_y(bboxL, image_angle + 180) + lengthdir_y(bboxT, image_angle + 90);

								px[1] = lengthdir_x(bboxR, image_angle) + lengthdir_x(bboxT, image_angle + 90);
								py[1] = lengthdir_y(bboxR, image_angle) + lengthdir_y(bboxT, image_angle + 90);

								px[2] = lengthdir_x(bboxR, image_angle) + lengthdir_x(bboxB, image_angle - 90);
								py[2] = lengthdir_y(bboxR, image_angle) + lengthdir_y(bboxB, image_angle - 90);

								px[3] = lengthdir_x(bboxL, image_angle + 180) + lengthdir_x(bboxB, image_angle - 90);
								py[3] = lengthdir_y(bboxL, image_angle + 180) + lengthdir_y(bboxB, image_angle - 90);
						
								// if so, draw shadow
								if (rectangle_in_rectangle(x + px[0], y + py[0], x + px[2], y + py[2], lx - lwd2, ly - lhd2, lx + lwd2, ly + lhd2)) {  
									var pd, shadowDistance, fade, shadowDepth, shadowStrength, shadowColor, casterDistance;
							
									shadowDepth = self.depth;
									shadowDistance = self.lighting.distance;
									fade = (shadowDistance > resW ? true : false);
									casterDistance = point_distance(x, y, lx, ly);
									shadowStrength = ((self.lighting.strength*(1-(abs(shadowDepth)/((abs(LIGHTING_DEPTH_MAX)+abs(LIGHTING_DEPTH_MIN))*0.5)))*lightStrength)*clamp(1-(casterDistance/lwd2), 0.05, 1))*(place_meeting(x, y, ls[l].id) ? 0.25 : 1);
									shadowColor = self.lighting.clr;
							
									minx = px[0];
									miny = py[0];
									maxx = px[0];
									maxy = py[0];
  
									imin = -2;
									imax = -2;
									a_test = point_direction(lx, ly, x, y);
									a_min = -1;
									a_max = -1;
  
									for (i = 0; i < 4; i++) {
										if (px[i] < minx)
											minx = px[i];
										if (px[i] > maxx)
											maxx = px[i];
										if (py[i] < miny)
											miny = py[i];
										if (py[i] > maxy)
											maxy = py[i];
      
										pdmin = (point_direction(lx, ly, x + px[i], y + py[i]) - a_test + 360) mod 360;
										pdmax = (a_test - point_direction(lx, ly, x + px[i], y + py[i]) + 360) mod 360;
				
										if (pdmin > a_min && pdmin <= 180) {
											a_min = pdmin;
											imin = i;
										}
				
										if (pdmax > a_max && pdmax <= 180) {
											a_max = pdmax;
											imax = i;
										}
									}
  
									i = abs(imin);
									draw_primitive_begin(pr_trianglestrip);
			
									do {
										pd = point_direction(lx, ly, x + px[i], y + py[i]);
										draw_vertex_color(x + px[i] - lx + lwd2 - flickerX, y + py[i] - ly + lhd2 - flickerY, shadowColor, shadowStrength);
										draw_vertex_color(x + px[i] + lengthdir_x(shadowDistance, pd) - lx + lwd2 - flickerX, y + py[i] + lengthdir_y(shadowDistance, pd) - ly + lhd2 - flickerY, shadowColor, shadowStrength*fade);
										i += 1;
										i = i mod 4;
									} until (i == (abs(imax) + 1) mod 4)
			
									draw_primitive_end();
							
									gpu_set_blendmode_ext(bm_dest_alpha, bm_one);
									if (sprite_get_bbox_mode(sprite_index) != bboxmode_manual) {
										draw_sprite_ext(SPR_WhitePixel, 0, x + px[0] - lx + lwd2 - flickerX, y + py[0] - ly + lhd2 - flickerY, bboxL + bboxR, bboxT + bboxB, image_angle, c_white, 1);
										draw_sprite_ext(SPR_WhitePixel, 0, x + px[0] - lx + lwd2 - flickerX, y + py[0] - ly + lhd2 - flickerY, bboxL + bboxR, bboxT + bboxB, image_angle, c_white, 1);
									} else {
										draw_sprite_ext(sprite_index, image_index, x - lx + lwd2 - flickerX, y - ly + lhd2 - flickerY, image_xscale, image_yscale, image_angle, c_white, 1);
										draw_sprite_ext(sprite_index, image_index, x - lx + lwd2 - flickerX, y - ly + lhd2 - flickerY, image_xscale, image_yscale, image_angle, c_white, 1);
									}
									gpu_set_blendmode(bm_normal);
								}
							}
						}
					}
			
					// draw the light's sprite over the shadowing on the light's individual surface
					gpu_set_blendmode_ext(bm_dest_color, bm_zero);
					draw_sprite_ext(lightSprite, 0, lwd2, lhd2, lightDistance, lightDistance, 0, c_white, 1); 
					surface_reset_target();
				}
			
				// draw the updated individual light to the main lighting surface
				surface_set_target(gls);
				gpu_set_blendmode(bm_add);
				draw_surface_ext(lightSurface, (x - camL - lwd2 + flickerX)*divideByCamZoom, (y - camT - lhd2 + flickerY)*divideByCamZoom, divideByCamZoom, divideByCamZoom, 0, lightColor, lightStrength);
				gpu_set_blendmode(bm_normal);
				surface_reset_target();
			}
		}
	
		lightUpdateCounter += lightFrameskip;
	}

	// draw lights and shadows to game surface 
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	draw_surface_ext(gls, camL, camT, camZoom, camZoom, 0, c_white, 1);
	
	if (camL != camX || camT != camY) {
		draw_rectangle_color(camX, camY, camL-1, camT+camH+(camT-camY), ambientColor, ambientColor, ambientColor, ambientColor, false);
		draw_rectangle_color(camL, camY, camL+camW, camT-1, ambientColor, ambientColor, ambientColor, ambientColor, false);
	}
	
	gpu_set_blendmode(bm_normal);

}
