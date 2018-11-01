///display init

//sets variables for display height and width, to read from for setting up other variables
global.screenh = display_get_height();
global.screenw = display_get_width();

//Sets size of the window to be the same dimensions as the screen

//sets view height and width to screen height and width
view_hview[0] = global.screenh;
view_wview[0] = global.screenw;

//Sets the drawing surface to the new size. Shouldn't be needed but its a failsafe
surface_resize(application_surface, global.screenw, global.screenh); 

//sets GUI layer to the same size as the screen
display_set_gui_size(global.screenw,global.screenh);

//view setting
if !view_enabled
    {
    view_visible[0] = true;
    view_enabled = true;
    view_object[0] = ofrog;
    view_hborder[0] = view_wview[0] / 2;
    view_vborder[0] = view_hview[0] / 2;
    }
    

