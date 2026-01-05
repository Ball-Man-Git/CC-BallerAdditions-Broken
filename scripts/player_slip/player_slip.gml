function player_slip()
{
hsp = xscale * movespeed
if grounded
movespeed = approach(movespeed, 0, 0.5)
if anim_ended() && sprite_index != spr_player_rockethitwall
image_speed = 0
else
image_speed = 0.35
if sprite_index == spr_player_slipbanana2
{
	do_slope_momentum()
	if !grounded
	{
		scr_sound_3d(sfx_slipstart, x, y)
		sprite_index = spr_player_slipbanana1
		image_index = 3
	}
}
var slipend_variations = irandom_range(1, 3)
var slipbump_variations = irandom_range(1, 8)
    if grounded && (vsp > -1) && (sprite_index != spr_player_slipbanana2) && (!(place_meeting(x, (y + 1), obj_metalblock))) && (!(place_meeting(x, (y + 1), obj_destroyable)))
    {
        if ((sprite_index == spr_player_rockethitwall))
        {
            scr_sound_3d(asset_get_index(string_concat("sfx_slipend", slipend_variations)), x, y)
			reset_anim(spr_player_slipbanana2)
            image_speed = 0.35
        }
        else
        {
            scr_sound_3d(asset_get_index(string_concat("sfx_slipbump", slipbump_variations)), x, y)
            vsp = -6
            movespeed = approach(movespeed, 0, 3)
            sprite_index = spr_player_rockethitwall
            particle_create(x, y + 43, particles.bang)
        }
    }
	if sprite_index == spr_player_slipbanana2
	{
		if anim_ended() && abs(hsp) <= 2
		state = states.normal
	}
	    if (scr_solid((x + xscale), y) && (!scr_slope((x + sign(hsp)), y)) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destroyable)))
    {
        scr_sound_3d(asset_get_index(string_concat("sfx_slipbump", slipbump_variations)), x, y)
        if ((sprite_index == spr_player_slipbanana1))
            movespeed = approach(movespeed, 0, 3)
        sprite_index = spr_player_rockethitwall
        particle_create(x + 30, y, particles.bang)
        xscale *= -1
        sleep(1)
    }
	if sprite_index != spr_player_slipbanana2 && scr_solid(x, y)
	state = states.crouch
	instakill = true
}