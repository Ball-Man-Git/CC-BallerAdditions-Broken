if global.secret
{
	with obj_collect
		create_ghost_obj()
	with obj_bigcollect
		create_ghost_obj()
}

if ((room != rank_room))
{
    var r = string_letters(room_get_name(room))
    if ((r == "towertutorial") || (r == "towertutorialN"))
        global.tutorial_room = true
    else
        global.tutorial_room = false
}