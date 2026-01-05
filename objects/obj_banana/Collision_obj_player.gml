with (other)
{
	scr_sound_3d(sfx_slipstart, x, y)
	reset_anim(spr_player_slipbanana1)
	other.drop = true
	vsp = -11
	movespeed += 2
	if movespeed > 14
	movespeed = 14
	hsp = movespeed * xscale
	state = states.slip
	instance_destroy(other)
}