///lightweightr music script
  if global.music = 0
        {
            global.music = 1
            ini_open("config.ini");
            ini_write_real("configs", "music", 1);
            ini_close(); 
            
                 if !audio_is_playing(clair_de_lune)
                    {
                    audio_play_sound(clair_de_lune,0,1)
                    }
            exit
        }

        if global.music = 1
        {
            global.music = 0
            
            ini_open("config.ini");
            ini_write_real("configs", "music", 0);
            ini_close(); 
            audio_stop_sound(clair_de_lune)
            exit
        }
