global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fc = 0;
global.fe = 0;
global.interact = 1;
image_speed = 0.2;

if (global.darkzone == 1)
    image_speed = 0.2;

global.msg[0] = stringsetloc("* The gash weaves down as if you cry./%", "obj_npc_room_slash_Other_10_gml_13_0");

if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_npc_room)/%");

if (room == room_krisroom)
{
    if (global.chapter == 1)
    {
        global.msg[0] = stringsetloc("* It's a red wagon with a rusty birdcage in it./", "obj_npc_room_slash_Other_10_gml_20_0");
        global.msg[1] = stringsetloc("* Looks like it's seen quite a few crashes./%", "obj_npc_room_slash_Other_10_gml_21_0");
    }
    
    if (global.chapter == 2)
        msgsetloc(0, "* It's a birdcage. When the door's closed^1, there's no escape./%", "obj_npc_room_slash_Other_10_gml_27_0");
}

if (room == room_torhouse)
{
    global.msg[0] = stringsetloc("* (It's Chairiel^1, the beloved living room chair.)/%", "obj_npc_room_slash_Other_10_gml_32_0");
    
    if (global.plot >= 250)
    {
        global.msc = 455;
        scr_text(global.msc);
        global.typer = 7;
        global.fc = 4;
        global.fe = 0;
    }
}

if (room == room_alphysclass)
{
    global.msc = 100;
    scr_text(global.msc);
    global.fc = 4;
}

if (room == room_castle_tutorial)
{
    global.msg[0] = stringsetloc("* (It's just a dummy.)/%", "obj_npc_room_slash_Other_10_gml_52_0");
    
    if (global.chapter == 2)
    {
        if (global.plot < 12)
        {
            if (global.flag[300] == 0)
            {
                global.msc = 1010;
                scr_text(global.msc);
            }
            else
            {
                msgsetloc(0, "* (You're all hugged out.)/%", "obj_npc_room_slash_Other_10_gml_66_0");
            }
        }
        else
        {
            if (sprite_index == spr_dummynpc)
            {
                if (talked == 0)
                {
                    global.msc = 1093;
                    scr_text(global.msc);
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (It's a mannequin dressed in poor taste.)/%", "obj_npc_room_slash_Other_10_gml_79_0");
                }
            }
            
            if (sprite_index == spr_npc_coody)
            {
                if (global.plot < 200)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Without trees^1, I must gain nutrients by eating clothes.../", "obj_npc_room_slash_Other_10_gml_88_0");
                    msgnextloc("* Such is the way of the worm./%", "obj_npc_room_slash_Other_10_gml_89_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* I'm a worm. I don't understand taxes and values./%", "obj_npc_room_slash_Other_10_gml_93_0");
                }
            }
            
            if (sprite_index == spr_npc_mrelegance)
            {
                if (global.plot < 200)
                {
                    if (talked == 0)
                    {
                        if (global.flag[314] == 1)
                        {
                            scr_speaker("no_name");
                            msgsetloc(0, "* Mr. Society left^1, didn't he..^1. Hm./", "obj_npc_room_slash_Other_10_gml_106_0");
                            msgnextloc("* I reckon I knew'n this would'n happen.../", "obj_npc_room_slash_Other_10_gml_107_0");
                            msgnextloc("* It's not'n no fault of yours./", "obj_npc_room_slash_Other_10_gml_108_0");
                            msgnextloc("* He'll'n be back one day./%", "obj_npc_room_slash_Other_10_gml_109_0");
                        }
                        else
                        {
                            scr_speaker("no_name");
                            msgsetloc(0, "* Whoa^1, horsies. You've'n brought us to a great new place./", "obj_npc_room_slash_Other_10_gml_113_0");
                            msgnextloc("* We'll'n be puttin' our own elbow grease into fixin' it^1, too./", "obj_npc_room_slash_Other_10_gml_114_0");
                            msgnextloc("* Well'n^1, maybe not elbow'n grease. That's gross./", "obj_npc_room_slash_Other_10_gml_115_0");
                            msgnextloc("* Nostril grease?/%", "obj_npc_room_slash_Other_10_gml_116_0");
                        }
                    }
                    else if (global.flag[314] == 1)
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* It's not'n no fault of yours./", "obj_npc_room_slash_Other_10_gml_123_0");
                        msgnextloc("* He'll'n be back one day./%", "obj_npc_room_slash_Other_10_gml_124_0");
                    }
                    else
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* We'll'n be tryin' our best too. Greasily./%", "obj_npc_room_slash_Other_10_gml_128_0");
                    }
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* We're'n building up the area to be a bit'n more board-like./", "obj_npc_room_slash_Other_10_gml_134_0");
                    msgnextloc("* The ponmen'll be happy^1, too./%", "obj_npc_room_slash_Other_10_gml_135_0");
                }
            }
            
            if (sprite_index == spr_mannequin_ralsei)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Looks like it costs money just to have a free sample.)/%", "obj_npc_room_slash_Other_10_gml_142_0");
            }
            
            if (sprite_index == spr_mannequin_ralsei_nugu)
            {
                if (talked == 0)
                {
                    scr_smallface(0, "ralsei", 23, 150, "middle", stringsetloc("Don't yell that from across town!!", "obj_npc_room_slash_Other_10_gml_149_0"));
                    scr_smallface(1, "susie", 7, "middle", "bottom", stringsetloc("Hey Lancer!!", "obj_npc_room_slash_Other_10_gml_150_0"));
                    scr_smallface(2, "lancer", 1, "right", "bottom", stringsetloc("Hi Susie!!", "obj_npc_room_slash_Other_10_gml_151_0"));
                    scr_speaker("ralsei");
                    msgsetloc(0, "\\EL* Wh..^1. who did this to my mannequin!?/", "obj_npc_room_slash_Other_10_gml_154_0");
                    msgnextloc("\\EN* A-as your prince^1, I..^1. I demand someone fix this!!/", "obj_npc_room_slash_Other_10_gml_155_0");
                    msgnextloc("\\EM* .../", "obj_npc_room_slash_Other_10_gml_156_0");
                    msgnextloc("\\EK* Umm^1, is..^1. is anybody listening...?/", "obj_npc_room_slash_Other_10_gml_157_0");
                    scr_anyface_next("lancer", "8");
                    msgnextloc("\\E8* I was listening~!\\f0\\f1\\f2/%", "obj_npc_room_slash_Other_10_gml_159_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\E0* (If Noelle was here...)/", "obj_npc_room_slash_Other_10_gml_163_0");
                    msgnextloc("\\EA* (She'd probably dress it up like a Christmas tree.)/", "obj_npc_room_slash_Other_10_gml_164_0");
                    msgnextloc("\\EK* (..^1. Huh? Why am I thinking that^1, anyway?)/%", "obj_npc_room_slash_Other_10_gml_165_0");
                }
            }
            
            if (sprite_index == spr_npc_addison_blue)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This place is a great deal!^1! All kinds of new customers!!/", "obj_npc_room_slash_Other_10_gml_172_0");
                msgnextloc("* Want a free sample? Just $4.99 to try a bite of these clothes!!/%", "obj_npc_room_slash_Other_10_gml_173_0");
            }
        }
    }
}

if (room == room_dw_castle_area_2)
{
    scr_speaker("susie");
    msgsetloc(0, "\\E0* So Ralsei^1, you're not gonna put your hat back on?/", "obj_npc_room_slash_Other_10_gml_183_0");
    scr_anyface_next("ralsei", "1");
    msgnextloc("\\E1* Why? Did I look cuter before?/", "obj_npc_room_slash_Other_10_gml_185_0");
    scr_anyface_next("susie", "K");
    msgnextloc("\\EK* Uhhhh^1, NO^1, I just mean.../", "obj_npc_room_slash_Other_10_gml_187_0");
    scr_anyface_next("ralsei", 1);
    msgnextloc("\\E1* You..^1. you think I look cuter now?/", "obj_npc_room_slash_Other_10_gml_189_0");
    scr_anyface_next("susie", "H");
    msgnextloc("\\EH* It was just NICER seeing LESS of you! \\f0/%", "obj_npc_room_slash_Other_10_gml_191_0");
    scr_smallface(0, "ralsei", 17, "mid", "bottom", stringsetloc("You're making me blush!", "obj_npc_room_slash_Other_10_gml_192_0"));
    
    if (talked >= 1)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E5* Hurry the hell up^1, Kris./", "obj_npc_room_slash_Other_10_gml_197_0");
        msgnextloc("\\EK* Longer you take^1, longer I gotta spend with THIS weirdo./", "obj_npc_room_slash_Other_10_gml_198_0");
        scr_anyface_next("ralsei", "H");
        msgnextloc("\\EH* If you're bored^1, Susie^1, we could crochet some team scarves.../", "obj_npc_room_slash_Other_10_gml_200_0");
        scr_anyface_next("susie", "6");
        msgnextloc("\\E6* Wait^1, \"Kro-shay?\" Isn't that the^1, uh^1, game with the hammer?/", "obj_npc_room_slash_Other_10_gml_202_0");
        scr_anyface_next("ralsei", 19);
        msgnextloc("\\EJ* Er..^1. it's like knitting./", "obj_npc_room_slash_Other_10_gml_204_0");
        scr_anyface_next("susie", 2);
        msgnextloc("\\E2* Alright. Long as I get to use the hammer./%", "obj_npc_room_slash_Other_10_gml_206_0");
    }
    
    if (global.flag[300] == 1)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E0* .../", "obj_npc_room_slash_Other_10_gml_211_0");
        msgnextloc("\\E1* .../", "obj_npc_room_slash_Other_10_gml_212_0");
        msgnextloc("\\E2* ..^1. so the hell were you hugging that Ralsei Statue?/", "obj_npc_room_slash_Other_10_gml_214_0");
        scr_anyface_next("ralsei", 26);
        msgnextloc("\\EQ* Let Kris do what they want^1, Susie! \\f0/", "obj_npc_room_slash_Other_10_gml_216_0");
        scr_smallface(0, "ralsei", 33, "mid", "bottom", stringsetloc("Also, it's not a statue?", "obj_npc_room_slash_Other_10_gml_217_0"));
        scr_anyface_next("susie", "0");
        msgnextloc("\\E0* The hell you even have a Ralsei statue anyway?/", "obj_npc_room_slash_Other_10_gml_220_0");
        scr_anyface_next("ralsei", 1);
        msgnextloc("\\E1* Susie wants to practice hugging too? \\f1 ^1 /%", "obj_npc_room_slash_Other_10_gml_222_0");
        scr_smallface(1, "susie", 17, "mid", "bottom", stringsetloc("KRIS HURRY UP ALREADY!", "obj_npc_room_slash_Other_10_gml_223_0"));
    }
}

if (room == room_cc_clover)
{
    global.msg[0] = stringsetloc("* Oh^1! Let us take your coat^1!&* And put it in the TOILET^1! HA^1!&* ... which^1, we don't even have./", "obj_npc_room_slash_Other_10_gml_232_0");
    global.msg[1] = stringsetloc("* Please try the baseballs~^1!&* Yeah^1! Eat so many you CHOKE^1!&* ... do they eat sports?/", "obj_npc_room_slash_Other_10_gml_233_0");
    global.msg[2] = stringsetloc("* Then we can all play Twister~^1!&* Just stay OUT OF OUR WAY^1!&* ... we lose even by ourselves./%", "obj_npc_room_slash_Other_10_gml_234_0");
    
    if (global.flag[522] == 1)
    {
        global.msg[0] = stringsetloc("* Were you invited^1?&* YOU WEREN'T!!^1!&* You DID hurt us.../", "obj_npc_room_slash_Other_10_gml_237_0");
        global.msg[1] = stringsetloc("* Awkward..^1.&* You wanna REMATCH!^1?&* You'd better leave.../%", "obj_npc_room_slash_Other_10_gml_238_0");
    }
    
    if (x < 160)
        global.msg[0] = stringsetloc("* I'm the first party member^1.&* I'm in charge of the DPS^1.&* (Dancin' Party Soundtrack.)/%", "obj_npc_room_slash_Other_10_gml_243_0");
    
    if (x > 400)
    {
        global.msg[0] = stringsetloc("* (Hathy is the second party member^1. It's the healer.)/", "obj_npc_room_slash_Other_10_gml_247_0");
        global.msg[1] = stringsetloc("* (She was in charge of catering the party.)/", "obj_npc_room_slash_Other_10_gml_248_0");
        global.msg[2] = stringsetloc("* (Unfortunately the cake she commissioned was destroyed in a field somewhere.)/%", "obj_npc_room_slash_Other_10_gml_249_0");
        
        if (talked >= 1)
            global.msg[0] = stringsetloc("* (That's a risk that one always runs when ordering a cake.)/%", "obj_npc_room_slash_Other_10_gml_252_0");
    }
}

if (room == room_hospital_rudy)
{
    if (global.chapter == 1)
    {
        global.typer = 55;
        global.fc = 15;
        global.fe = 2;
        
        if (global.flag[255] < 2)
            global.msc = 180;
        else
            global.msc = 181;
        
        scr_text(global.msc);
    }
    
    if (global.chapter == 2)
    {
        global.msc = 1047;
        scr_text(global.msc);
    }
}

if (room == room_library)
{
    global.msg[0] = stringsetloc("* I love reading books^1.&* Especially the books upstairs^1.&* You should really./", "obj_npc_room_slash_Other_10_gml_281_0");
    global.msg[1] = stringsetloc("* Read them!/%", "obj_npc_room_slash_Other_10_gml_282_0");
    
    if (talked >= 1)
    {
        global.msg[0] = stringsetloc("* I love reading books^1.&* Especially.../", "obj_npc_room_slash_Other_10_gml_286_0");
        global.msg[1] = stringsetloc("* The books./%", "obj_npc_room_slash_Other_10_gml_287_0");
    }
}

if (room == room_graveyard)
{
    if (sprite_index == spr_npc_bench)
    {
        global.msc = 190;
        scr_text(global.msc);
    }
    
    if (sprite_index == spr_npc_alvin_back)
    {
        global.msc = 1045;
        scr_text(global.msc);
    }
}

if (room == room_townhall)
{
    if (global.chapter == 1)
    {
        global.msg[0] = stringsetloc("* Hey^1 short-stuff^1.&* Why would YOU possibly need to talk to the mayor?/", "obj_npc_room_slash_Other_10_gml_310_0");
        global.msg[1] = stringsetloc("* Your allowance too low^1?&* Ate too much candies^1?&* Lost your frisbee in the wash?/", "obj_npc_room_slash_Other_10_gml_311_0");
        global.msg[2] = stringsetloc("* Hey^1, short-stuff.../", "obj_npc_room_slash_Other_10_gml_312_0");
        global.msg[3] = stringsetloc("* That's what the cops are for./%", "obj_npc_room_slash_Other_10_gml_313_0");
        
        if (talked >= 1)
        {
            global.msg[0] = stringsetloc("* What^1? Don't talk to you like you're a \"kid^1?\" Fine.../", "obj_npc_room_slash_Other_10_gml_317_0");
            global.msg[1] = stringsetloc("* If you need someone to change your diaper^1, go ask the Cop's./%", "obj_npc_room_slash_Other_10_gml_318_0");
        }
        
        if (x > 100)
        {
            global.msg[0] = stringsetloc("* I'm sorry^1, I'm sorry^1.&* The mayor is busy right now./", "obj_npc_room_slash_Other_10_gml_323_0");
            global.msg[1] = stringsetloc("* If you need to see her^1, please try causing some terrible crisis./%", "obj_npc_room_slash_Other_10_gml_324_0");
            
            if (talked >= 1)
            {
                global.msg[0] = stringsetloc("* I'm sorry^1, I'm sorry^1.&* Are you here to complain about your teacher?/", "obj_npc_room_slash_Other_10_gml_328_0");
                global.msg[1] = stringsetloc("* If you don't like her^1, please blame your mother for getting her hired.../%", "obj_npc_room_slash_Other_10_gml_329_0");
            }
        }
        
        if (x > 200)
        {
            global.msg[0] = stringsetloc("* The mayor's charisma is about zero^1.&* No^1, it's negative./", "obj_npc_room_slash_Other_10_gml_335_0");
            global.msg[1] = stringsetloc("* But she works hard and has a good track record^1, so she runs unopposed./", "obj_npc_room_slash_Other_10_gml_336_0");
            global.msg[2] = stringsetloc("* Thaaaaaat's politics^1.&* Rarely./%", "obj_npc_room_slash_Other_10_gml_337_0");
            
            if (talked >= 1)
            {
                global.msg[0] = stringsetloc("* Not only does she act icy^1, she always keeps her office's AC on full blast./", "obj_npc_room_slash_Other_10_gml_341_0");
                global.msg[1] = stringsetloc("* That chill I feel..^1. is..^1.&* Is this what politics feels like?/%", "obj_npc_room_slash_Other_10_gml_342_0");
            }
        }
    }
    
    if (global.chapter == 2)
    {
        if (sprite_index == spr_npc_receptionist)
        {
            msgsetloc(0, "* Oh^1, I'm sorry. You're looking for the mayor./", "obj_npc_room_slash_Other_10_gml_352_0");
            msgnextloc("* She's very^1, very busy preparing for the festival./%", "obj_npc_room_slash_Other_10_gml_353_0");
        }
        
        if (sprite_index == spr_npc_businessguy)
        {
            if (talked == 0)
            {
                msgsetloc(0, "* Well well. If it isn't the teens. Our beloved \"rats of the city.\"/", "obj_npc_room_slash_Other_10_gml_360_0");
                msgnextloc("* You wanna get into Politics? Heh./", "obj_npc_room_slash_Other_10_gml_361_0");
                msgnextloc("* You better graduate from Diaper School first./", "obj_npc_room_slash_Other_10_gml_362_0");
                msgnextloc("* That's what I did. And look at me now./", "obj_npc_room_slash_Other_10_gml_363_0");
                msgnextloc("* I don't even work here./%", "obj_npc_room_slash_Other_10_gml_364_0");
            }
            else
            {
                msgsetloc(0, "* This Briefscase^1, is full of Diapers. Or^1, to the Pro's^1, \"Diaps.\"/", "obj_npc_room_slash_Other_10_gml_366_0");
                msgnextloc("* You're gonna have to level up to understand a Man's World./%", "obj_npc_room_slash_Other_10_gml_367_0");
            }
        }
        
        if (sprite_index == spr_npc_politicsbear)
        {
            msgsetloc(0, "* That bald guy keeps trying to show me something from his briefcase./", "obj_npc_room_slash_Other_10_gml_373_0");
            msgnextloc("* Is it a bribe...? I'm really deep into politics now.../%", "obj_npc_room_slash_Other_10_gml_374_0");
        }
    }
}

if (room == room_diner)
{
    if (global.chapter == 1)
    {
        if (sprite_index == spr_npc_cattiwaitress)
        {
            global.fc = 13;
            global.fe = 0;
            global.msg[0] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_388_0");
            global.msg[1] = stringsetloc("\\E1* You're alive./", "obj_npc_room_slash_Other_10_gml_389_0");
            global.msg[2] = stringsetloc("\\E0* .../", "obj_npc_room_slash_Other_10_gml_390_0");
            global.msg[3] = stringsetloc("\\E2* Nice./", "obj_npc_room_slash_Other_10_gml_391_0");
            global.msg[4] = stringsetloc("\\E1* .../", "obj_npc_room_slash_Other_10_gml_393_0");
            global.msg[5] = stringsetloc("\\E0* .../", "obj_npc_room_slash_Other_10_gml_394_0_b");
            global.msg[6] = stringsetloc("\\E1* I'm working./%", "obj_npc_room_slash_Other_10_gml_394_0");
            
            if (talked >= 1)
            {
                global.msg[0] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_398_0");
                global.msg[1] = stringsetloc("\\E1* This uniform's.../", "obj_npc_room_slash_Other_10_gml_399_0");
                global.msg[2] = stringsetloc("\\E0* Mandatory./%", "obj_npc_room_slash_Other_10_gml_400_0");
            }
        }
        
        if (sprite_index == spr_npc_dragonfamily)
        {
            global.msg[0] = stringsetloc("* Uh^1, we'll take the special^1, and do you have any edible glitter...?/", "obj_npc_room_slash_Other_10_gml_406_0");
            global.msg[1] = stringsetloc("* The youngest one won't eat anything if it doesn't look like treasure.../%", "obj_npc_room_slash_Other_10_gml_407_0");
            
            if (talked >= 1)
                global.msg[0] = stringsetloc("* In a pinch^1, sprinkles will work^1, too.../%", "obj_npc_room_slash_Other_10_gml_409_0");
        }
        
        if (x >= 120 && x <= 140)
        {
            global.msg[0] = stringsetloc("* Don't be a stranger now^1, alright^1, hun?/%", "obj_npc_room_slash_Other_10_gml_415_0");
            
            if (global.flag[261] == 0)
            {
                global.msg[0] = stringsetloc("* Hey there^1!&* Haven't seen you in a while^1, hun./", "obj_npc_room_slash_Other_10_gml_421_0");
                global.msg[1] = stringsetloc("* I remember^1, back on Sundays^1, after service.../", "obj_npc_room_slash_Other_10_gml_423_0");
                global.msg[2] = stringsetloc("* You and your family would come in and order the special./", "obj_npc_room_slash_Other_10_gml_424_0");
                global.msg[3] = stringsetloc("* 'Course^1, things happened^1, and then.../", "obj_npc_room_slash_Other_10_gml_425_0");
                global.msg[4] = stringsetloc("* Y'all..^1.&* Stopped comin' together./", "obj_npc_room_slash_Other_10_gml_426_0");
                global.msg[5] = stringsetloc("* But every Sunday^1, you and your brother'd still come in./", "obj_npc_room_slash_Other_10_gml_427_0");
                global.msg[6] = stringsetloc("* He'd order you a hot chocolate.../", "obj_npc_room_slash_Other_10_gml_428_0");
                global.msg[7] = stringsetloc("* And you two'd sit down at that table in the corner.../", "obj_npc_room_slash_Other_10_gml_429_0");
                global.msg[8] = stringsetloc("* ... drawin' shapes in the window with your breath./", "obj_npc_room_slash_Other_10_gml_430_0");
                global.msg[9] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_431_0");
                global.msg[10] = stringsetloc("* You must really miss him^1, huh?/", "obj_npc_room_slash_Other_10_gml_432_0");
                global.msg[11] = stringsetloc("* ... Here^1, how about this?/", "obj_npc_room_slash_Other_10_gml_433_0");
                global.msg[12] = stringsetloc("* (Kris got the Hot Chocolate.)/", "obj_npc_room_slash_Other_10_gml_434_0");
                global.msg[13] = stringsetloc("* On the house, hun./%", "obj_npc_room_slash_Other_10_gml_435_0");
                global.flag[261] = 1;
                noroom = 0;
                scr_litemget(1);
                
                if (noroom == 1)
                {
                    global.flag[261] = 2;
                    global.msg[11] = stringsetloc("* ... You know^1, I'd give you a hot chocolate on the house.../", "obj_npc_room_slash_Other_10_gml_442_0");
                    global.msg[12] = stringsetloc("* ... But it looks like you've got enough things already./", "obj_npc_room_slash_Other_10_gml_443_0");
                    global.msg[13] = stringsetloc("* Take it easy^1, okay^1, hun?/%", "obj_npc_room_slash_Other_10_gml_444_0");
                }
            }
        }
        
        if (x > 240)
        {
        }
        
        if (y > 140)
        {
            if (x > 180)
            {
                global.msg[0] = stringsetloc("* So^1, for you two girls^1, that'll be the crepes^1, a cinnamon latte.../", "obj_npc_room_slash_Other_10_gml_468_0");
                global.msg[1] = stringsetloc("* Two bunny parfaits, and... a piece of firewood...?/%", "obj_npc_room_slash_Other_10_gml_469_0");
                
                if (talked >= 1)
                    global.msg[0] = stringsetloc("* And^1, how would you like that firewood done?/%", "obj_npc_room_slash_Other_10_gml_472_0");
            }
            
            if (x > 260)
            {
                global.msg[0] = stringsetloc("* Dude^1, remember when we used to skip the first hour of class to come here?/", "obj_npc_room_slash_Other_10_gml_482_0");
                global.msg[1] = stringsetloc("* YOU were fine^1, but I almost had to repeat the year 'cause of it.../", "obj_npc_room_slash_Other_10_gml_483_0");
                global.msg[2] = stringsetloc("* Those crepes were MAD worth^1, though^1! Delinquency is the best condiment!/%", "obj_npc_room_slash_Other_10_gml_484_0");
                
                if (talked >= 1)
                    global.msg[0] = stringsetloc("* Dude^1, if we didn't bring Gerson our leftovers^1, I bet I would have failed HARD.../%", "obj_npc_room_slash_Other_10_gml_487_0");
            }
        }
        
        if (sprite_index == spr_npc_most_improved_1997)
        {
            global.msg[0] = stringsetloc("* Looking at my rugged body^1, you must wonder what kind of secrets I hold.../", "obj_npc_room_slash_Other_10_gml_496_0");
            global.msg[1] = stringsetloc("* My secret is^1, I put all my leftover pancakes in this giant hat./%", "obj_npc_room_slash_Other_10_gml_497_0");
            
            if (talked >= 1)
                global.msg[0] = stringsetloc("* Whew^1!&* I sure love PANCAKE!/%", "obj_npc_room_slash_Other_10_gml_501_0");
        }
        
        if (sprite_index == spr_npc_icewolf)
        {
            global.msg[0] = stringsetloc("* Ice Wolf does not like ice in drink./", "obj_npc_room_slash_Other_10_gml_507_0");
            global.msg[1] = stringsetloc("* Ice Wolf likes ice.../", "obj_npc_room_slash_Other_10_gml_508_0");
            global.msg[2] = stringsetloc("* ... to BE drink!/%", "obj_npc_room_slash_Other_10_gml_509_0");
            
            if (talked >= 1)
                global.msg[0] = stringsetloc("* Ice Wolf also like ice-themed mascots./%", "obj_npc_room_slash_Other_10_gml_513_0");
        }
    }
    
    if (global.chapter == 2)
    {
        if (sprite_index == spr_npc_cattiwaitress)
        {
            if (talked == 0)
            {
                global.msc = 1041;
                scr_text(global.msc);
            }
            else
            {
                global.msc = 1043;
                scr_text(global.msc);
            }
        }
        
        if (sprite_index == spr_npc_qc)
        {
            if (global.flag[261] != 1)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Catti's family is always asking when her next shift is.../", "obj_npc_room_slash_Other_10_gml_542_0");
                    msgnextloc("* So they can come in and cheer her on./", "obj_npc_room_slash_Other_10_gml_543_0");
                    msgnextloc("* Never seen anything like it^1, but it's kind of nice^1, isn't it?/%", "obj_npc_room_slash_Other_10_gml_544_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* How you doin'^1, hon?/", "obj_npc_room_slash_Other_10_gml_548_0");
                    msgnextloc("* ..^1. what? Sorry^1, couldn't hear you over the noise./%", "obj_npc_room_slash_Other_10_gml_549_0");
                }
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Hey hon^1, how did you like the hot chocolate?/", "obj_npc_room_slash_Other_10_gml_563_0");
                msgnextloc("* ..^1. well^1, I'm gonna take it that means you enjoyed it./", "obj_npc_room_slash_Other_10_gml_564_0");
                msgnextloc("* Take it easy^1, okay? I'm sure your brother will be back in no time./%", "obj_npc_room_slash_Other_10_gml_565_0");
            }
        }
        
        if (sprite_index == spr_jockington_lt)
        {
            if (talked == 0)
            {
                scr_speaker("jockington");
                msgsetloc(0, "* Catti's^1, My friend. And./", "obj_npc_room_slash_Other_10_gml_575_0");
                msgnextloc("* I support my friends^1, through thick^1, and thin./", "obj_npc_room_slash_Other_10_gml_576_0");
                msgnextloc("* Long^1, and short. Cold^1, and hot./", "obj_npc_room_slash_Other_10_gml_577_0");
                msgnextloc("* Whatever shape^1, the world takes^1, I'll be there./%", "obj_npc_room_slash_Other_10_gml_578_0");
            }
            else
            {
                scr_speaker("jockington");
                msgsetloc(0, "* Life is a big^1, ballgame^1,/", "obj_npc_room_slash_Other_10_gml_582_0");
                msgnextloc("* And when the man is on the field./", "obj_npc_room_slash_Other_10_gml_583_0");
                msgnextloc("* He does a big dunk./", "obj_npc_room_slash_Other_10_gml_584_0");
                msgnextloc("* Try^1, to be that dunk./%", "obj_npc_room_slash_Other_10_gml_585_0");
            }
        }
        
        if (sprite_index == spr_npc_catti_dad_diner)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Our little Catti^1, she's doin' us proud./", "obj_npc_room_slash_Other_10_gml_595_0");
                msgnextloc("* Workin' hard. Supportin' us./", "obj_npc_room_slash_Other_10_gml_596_0");
                msgnextloc("* Servin' us pickles^1, terrifyin' us with their shape^1,/", "obj_npc_room_slash_Other_10_gml_597_0");
                msgnextloc("* Tryin' to get us to leave./", "obj_npc_room_slash_Other_10_gml_598_0");
                msgnextloc("* Proud of her./%", "obj_npc_room_slash_Other_10_gml_599_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* My favorite meal? Gotta be the catfood pancakes!/", "obj_npc_room_slash_Other_10_gml_602_0");
                msgnextloc("* And the fish with bones that looks like it's from a cartoon./%", "obj_npc_room_slash_Other_10_gml_603_0");
            }
        }
        
        if (sprite_index == spr_npc_ficus)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* To tell you the truth^1, I thought this was the post office.../", "obj_npc_room_slash_Other_10_gml_611_0");
            msgnextloc("* But by the time I realized..^1. I'd already sat down.../", "obj_npc_room_slash_Other_10_gml_612_0");
            msgnextloc("* I'm not hungry^1, so I've just been telling the waitress I'm still deciding for.../", "obj_npc_room_slash_Other_10_gml_613_0");
            msgnextloc("* ..^1. a few hours now. How am I supposed to get out of this one!?/%", "obj_npc_room_slash_Other_10_gml_614_0");
        }
        
        if (sprite_index == spr_npc_most_improved_1997_ch2)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I don't know if you noticed^1, but I've been getting stronger./", "obj_npc_room_slash_Other_10_gml_630_0");
                msgnextloc("* You could say I'm bulking up for the winter./%", "obj_npc_room_slash_Other_10_gml_631_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Oh boy^1! I love BULKING./%", "obj_npc_room_slash_Other_10_gml_635_0");
            }
        }
        
        if (sprite_index == spr_npc_aaron)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This guy next to me^1, he's really bulked up. I admire that./%", "obj_npc_room_slash_Other_10_gml_649_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I don't know if you do that^1, bulking up for the winter.../%", "obj_npc_room_slash_Other_10_gml_645_0");
            }
        }
    }
}

if (room == room_town_south)
{
    if (global.chapter == 1)
    {
        if (sprite_index == spr_npc_donutcar)
        {
            global.msg[0] = stringsetloc("* H-How am I supposed to get past this blue lady...!^1?&* I'm stuck!!/", "obj_npc_room_slash_Other_10_gml_620_0");
            global.msg[1] = stringsetloc("* I-I guess I should just run away.../%", "obj_npc_room_slash_Other_10_gml_621_0");
        }
        
        if (sprite_index == spr_npc_snailcar)
        {
            global.msg[0] = stringsetloc("* Police Chief Undyne is supposed to be directing traffic.../", "obj_npc_room_slash_Other_10_gml_625_0");
            global.msg[1] = stringsetloc("* But all she's doing is standing in the middle of the street yelling \"GET OUT OF MY WAY!!!\"/", "obj_npc_room_slash_Other_10_gml_626_0");
            global.msg[2] = stringsetloc("* She's the best^1, huh!^1?&* I feel really directed!!!/%", "obj_npc_room_slash_Other_10_gml_627_0");
        }
    }
    
    if (global.chapter == 2 && global.plot >= 15 && global.plot <= 200)
    {
        if (sprite_index == spr_npc_snailcar)
        {
            if (talked == 0)
            {
                scr_speaker("none");
                msgsetloc(0, "* Traffic's moving at a snail's pace./", "obj_npc_room_slash_Other_10_gml_680_0");
                msgnextloc("* I love snails. Could today get any better!?/%", "obj_npc_room_slash_Other_10_gml_681_0");
            }
            else
            {
                scr_speaker("none");
                msgsetloc(0, "* Wow^1, my first traffic jam!!/", "obj_npc_room_slash_Other_10_gml_684_0");
                msgnextloc("* I can't help but feel a sense of pride.../%", "obj_npc_room_slash_Other_10_gml_685_0");
            }
        }
        
        if (sprite_index == spr_npc_donutcar)
        {
            if (talked == 0)
            {
                scr_speaker("man");
                msgsetloc(0, "* I heard a dog was doing \"donuts\" so I sped over here./", "obj_npc_room_slash_Other_10_gml_694_0_b");
                msgnextloc("* But I just learned \"Donuts\" is actually the name of a special attack for cars./", "obj_npc_room_slash_Other_10_gml_695_0_b");
                msgnextloc("* Why is my life stuck in a loop of doughy disappointment...?/%", "obj_npc_room_slash_Other_10_gml_696_0_b");
            }
            else
            {
                scr_speaker("man");
                msgsetloc(0, "* My life^1, like a donut^1, is stuck in a loop of doughy disappointment.../%", "obj_npc_room_slash_Other_10_gml_699_0");
            }
        }
        
        cardialogue = 0;
        
        if (sprite_index == spr_lw_car_gray_down)
            cardialogue = 1;
        
        if (sprite_index == spr_lw_car_gray_right)
            cardialogue = 1;
        
        if (sprite_index == spr_lw_car_gray_left)
            cardialogue = 1;
        
        if (sprite_index == spr_lw_car_gray_up)
            cardialogue = 1;
        
        if (cardialogue == 1)
        {
            scr_speaker("none");
            msgsetloc(0, "* (Looks like a car.)/%", "obj_npc_room_slash_Other_10_gml_712_0_b");
            
            if (global.flag[910] == 2 && global.flag[913] == 0)
            {
                msgsetloc(0, "* (Looks like a car.)/", "obj_npc_room_slash_Other_10_gml_715_0");
                msgnextloc("* (There is even a man inside this one.)/", "obj_npc_room_slash_Other_10_gml_716_0");
                msgnextloc("* (He waves at you happily.)/%", "obj_npc_room_slash_Other_10_gml_717_0");
                global.flag[913] = 1;
            }
        }
    }
}

if (room == room_town_mid)
{
    if (sprite_index == spr_npc_burgerpants)
    {
        global.msc = 340;
        scr_text(global.msc);
    }
    
    if (sprite_index == spr_mkid_dt)
    {
        global.msg[0] = stringsetloc("* Yo^1, Kris^1!&* You survived Susie^1, haha!/", "obj_npc_room_slash_Other_10_gml_691_0");
        global.msg[1] = stringsetloc("* I mean^1, I never saw her beat anyone up^1, but^1, uh^1, I'd be careful./", "obj_npc_room_slash_Other_10_gml_692_0");
        global.msg[2] = stringsetloc("* Like^1, one time me^1, Snowy^1, and Jockington were playing handball,/", "obj_npc_room_slash_Other_10_gml_693_0");
        global.msg[3] = stringsetloc("* And she just kept creepily watching us from the corner./", "obj_npc_room_slash_Other_10_gml_694_0");
        global.msg[4] = stringsetloc("* Then^1, when the ball rolled over to her she just^1, uh^1, froze solid.../", "obj_npc_room_slash_Other_10_gml_695_0");
        global.msg[5] = stringsetloc("* ... and kicked the ball as hard as she could^1, right into Officer Undyne's car!/", "obj_npc_room_slash_Other_10_gml_696_0");
        global.msg[6] = stringsetloc("* Then^1, Undyne came out^1, smiling^1, cracked her knuckles^1, and totally wiped us at handball.../", "obj_npc_room_slash_Other_10_gml_697_0");
        global.msg[7] = stringsetloc("* Anyway^1, Susie sucks^1, Kris^1, haha. /%", "obj_npc_room_slash_Other_10_gml_698_0");
        
        if (talked >= 1)
        {
            global.msg[0] = stringsetloc("* Yo^1, Kris^1, you look kind of annoyed^1.&* Everything OK?/", "obj_npc_room_slash_Other_10_gml_702_0");
            global.msg[1] = stringsetloc("* You can calm down now^1, dude^1! Susie's not here^1, haha!/", "obj_npc_room_slash_Other_10_gml_703_0");
            global.msg[2] = stringsetloc("* ... Huh^1?&* You look even more annoyed.../%", "obj_npc_room_slash_Other_10_gml_704_0");
        }
    }
    
    if (sprite_index == spr_snowy_dt)
    {
        global.msg[0] = stringsetloc("* HOOH!^1!&* You're lucky^1, Kris!! /", "obj_npc_room_slash_Other_10_gml_710_0");
        global.msg[1] = stringsetloc("* You got to miss class with Alphys^1! It's not fair^1! Ha ha ha^1!/", "obj_npc_room_slash_Other_10_gml_711_0");
        global.msg[2] = stringsetloc("* If I skipped class^1, my dad'd never let me hear the end of it!!^1! Ha ha ha!!!/", "obj_npc_room_slash_Other_10_gml_712_0");
        global.msg[3] = stringsetloc("* ... That's actually not even remotely funny./%", "obj_npc_room_slash_Other_10_gml_713_0");
    }
    
    if (global.chapter == 2)
    {
        if (sprite_index == spr_npc_snailcar)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This is a great parking place!/", "obj_npc_room_slash_Other_10_gml_765_0");
                msgnextloc("* I can see myself settling down here.../%", "obj_npc_room_slash_Other_10_gml_766_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Home is where the car is!/%", "obj_npc_room_slash_Other_10_gml_770_0");
            }
        }
        
        if (sprite_index == spr_npc_donutcar)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I just wanna go home^1, but I'm still stuck in a traffic jam.../", "obj_npc_room_slash_Other_10_gml_779_0");
                msgnextloc("* ..^1. even though it's only one other person.../%", "obj_npc_room_slash_Other_10_gml_780_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* That's the trouble with cars./", "obj_npc_room_slash_Other_10_gml_784_0");
                msgnextloc("* If you wanna do donuts^1, you have to be prepared for jam!/%", "obj_npc_room_slash_Other_10_gml_785_0");
            }
        }
        
        if (sprite_index == spr_npc_scarflady)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* You kids came out of the library^1, didn't you? Studying..^1. How wonderful./", "obj_npc_room_slash_Other_10_gml_794_0");
                msgnextloc("* Personally^1, I hate libraries^1, but.../%", "obj_npc_room_slash_Other_10_gml_795_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Libraries are outdated. We have things like newspapers now./%", "obj_npc_room_slash_Other_10_gml_799_0");
            }
        }
    }
}

if (room == room_town_north)
{
    if (sprite_index == spr_npc_catty)
    {
        global.fc = 16;
        global.typer = 5;
        global.msc = 215;
        scr_text(global.msc);
    }
    
    if (sprite_index == spr_npc_cattydad)
    {
        if (talked == 0)
        {
            global.msg[0] = stringsetloc("* Hey neighbor-beighbor^1! When's yah brother Doug gonna come by^1? Huh huh huh!/", "obj_npc_room_slash_Other_10_gml_731_0");
            global.msg[1] = stringsetloc("* My girls'd love to see him^1! He's a sweet little man!/", "obj_npc_room_slash_Other_10_gml_732_0");
            global.msg[2] = stringsetloc("* He's just got one problem..^1.&* He doesn't like my wife's cookin'!/", "obj_npc_room_slash_Other_10_gml_733_0");
            global.msg[3] = stringsetloc("* What's wrong^1, Douglas^1?&* You don't like frozen cat food^1? Huh huh huh!/%", "obj_npc_room_slash_Other_10_gml_734_0");
        }
        else
        {
            global.msg[0] = stringsetloc("* Can't blame yah brother for leavin' town./", "obj_npc_room_slash_Other_10_gml_738_0");
            global.msg[1] = stringsetloc("* He's out there^1, gettin' a big brain in the big school./", "obj_npc_room_slash_Other_10_gml_739_0");
            global.msg[2] = stringsetloc("* Hope when he becomes a big shot^1, he remembers us little guys down the street./", "obj_npc_room_slash_Other_10_gml_740_0");
            global.msg[3] = stringsetloc("* Eatin' oranges and gettin' our stomachs pumped./%", "obj_npc_room_slash_Other_10_gml_741_0");
        }
    }
    
    if (sprite_index == spr_npc_bratty)
    {
        global.fc = 17;
        global.typer = 5;
        global.msc = 220;
        scr_text(global.msc);
    }
    
    if (global.chapter == 2)
    {
        if (sprite_index == spr_smallfrog)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ribbit^1, ribbit./", "obj_npc_room_slash_Other_10_gml_848_0");
                msgnextloc("* (I sometimes hear beautiful singing from that house over there.)/", "obj_npc_room_slash_Other_10_gml_849_0");
                msgnextloc("* (How eerie..^1. could it be a ghost?)/%", "obj_npc_room_slash_Other_10_gml_850_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ribbit./", "obj_npc_room_slash_Other_10_gml_854_0");
                msgnextloc("* (That would make sense. A ghost lives there.)/%", "obj_npc_room_slash_Other_10_gml_855_0");
            }
        }
        
        if (sprite_index == spr_npc_bunbun)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* My brother's too old to take for a walk anymore..^1. hm.../", "obj_npc_room_slash_Other_10_gml_862_0");
            msgnextloc("* I'm aimless..^1. wish I had someone to whip me into shape./%", "obj_npc_room_slash_Other_10_gml_863_0");
        }
        
        if (sprite_index == spr_npc_mikewazowski)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I wanted to buy flowers^1, but the store's closed./", "obj_npc_room_slash_Other_10_gml_871_0");
                msgnextloc("* The door around back's unlocked^1, but I don't think I should go in.../%", "obj_npc_room_slash_Other_10_gml_872_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I saw a bed through the back window..^1. Wonder what the deal is./%", "obj_npc_room_slash_Other_10_gml_876_0");
            }
        }
    }
}

if (room == room_town_church)
{
    if (global.chapter == 1)
    {
        global.msc = 345;
        scr_text(global.msc);
    }
    
    if (global.chapter == 2)
    {
        if (sprite_index == spr_npc_terry)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm not Jerry. I'm Terry./", "obj_npc_room_slash_Other_10_gml_895_0");
            msgnextloc("* I'm super cool./", "obj_npc_room_slash_Other_10_gml_896_0");
            msgnextloc("* I totally DON'T have to go to the bathroom./%", "obj_npc_room_slash_Other_10_gml_897_0");
        }
        
        if (sprite_index == spr_npc_icecap_r || sprite_index == spr_npc_icecap_g || sprite_index == spr_npc_icecap_b)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh!!^1! Terry!^1! Say it again!!/", "obj_npc_room_slash_Other_10_gml_903_0");
            msgnextloc("* Say you don't have to go to the bathroom again!!/%", "obj_npc_room_slash_Other_10_gml_904_0");
        }
        
        if (sprite_index == spr_npc_rgbun)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Nothing like admiring the great paint job^1, me and my bro did on our church./%", "obj_npc_room_slash_Other_10_gml_910_0");
        }
        
        if (sprite_index == spr_npc_rgdragon)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ...^1. missed a spot./%", "obj_npc_room_slash_Other_10_gml_916_0");
        }
        
        if (sprite_index == spr_npc_rabbitkid)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* We tried to play baseball^1, but that kid kept dancing in the middle of the lot./", "obj_npc_room_slash_Other_10_gml_924_0");
                msgnextloc("* I..^1. don't feel like there's any way to stop him.../%", "obj_npc_room_slash_Other_10_gml_925_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* If I can't stop him..^1. Should I join him? No..^1. no./%", "obj_npc_room_slash_Other_10_gml_929_0");
            }
        }
    }
}

if (room == room_hospital_lobby)
{
    if (global.chapter == 1)
    {
        global.msg[0] = stringsetloc("* Oh^1, it's you^1.&* Are you here to play the piano again?/", "obj_npc_room_slash_Other_10_gml_796_0");
        global.msg[1] = stringsetloc("* The patients can't hear it well from here^1, but I personally enjoy it./%", "obj_npc_room_slash_Other_10_gml_797_0");
        
        if (talked >= 1)
        {
            global.msg[0] = stringsetloc("* Sometimes the police chief comes in to play the piano./", "obj_npc_room_slash_Other_10_gml_801_0");
            global.msg[1] = stringsetloc("* Her playing is nice^1, but when she starts singing.../", "obj_npc_room_slash_Other_10_gml_802_0");
            global.msg[2] = stringsetloc("* We have to ask her to leave./%", "obj_npc_room_slash_Other_10_gml_803_0");
        }
        
        if (tempvar >= 1)
        {
            global.msg[0] = stringsetloc("* Hmmm..^1. you usually play the piano a bit more..^1. beautifully./", "obj_npc_room_slash_Other_10_gml_809_0");
            global.msg[1] = stringsetloc("* Is everything OK^1?&* You DO seem a little sick.../%", "obj_npc_room_slash_Other_10_gml_810_0");
        }
    }
    
    if (global.chapter == 2)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Here to make an appointment...?/", "obj_npc_room_slash_Other_10_gml_962_0");
            scr_anyface_next("susie", "0");
            msgnextloc("\\E0* Nah^1, just here to hang out./", "obj_npc_room_slash_Other_10_gml_964_0");
            scr_anyface_next("no_name", 0);
            msgnextloc("* ..^1. I see./%", "obj_npc_room_slash_Other_10_gml_966_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Should I pencil you in for hanging out?/%", "obj_npc_room_slash_Other_10_gml_970_0");
        }
    }
}

if (room == room_beach)
{
    if (global.chapter == 1)
    {
        if (sprite_index == spr_npc_rgbun)
        {
            global.msg[0] = stringsetloc("* Nothin' better than hangin' at the lake with my best bro.../", "obj_npc_room_slash_Other_10_gml_821_0");
            global.msg[1] = stringsetloc("* Watchin' the waves go by.../%", "obj_npc_room_slash_Other_10_gml_822_0");
        }
        
        if (sprite_index == spr_npc_rgdragon)
        {
            global.msg[0] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_826_0");
            global.msg[1] = stringsetloc("* ... true./%", "obj_npc_room_slash_Other_10_gml_827_0");
        }
    }
}

if (room == room_lw_icee_pizza)
{
    if (sprite_index == spr_burgerpants_sit_phone)
    {
        global.msc = 1020;
        scr_text(global.msc);
    }
    
    if (sprite_index == spr_npc_nicecream_mop)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Wow^1, my co-worker seems so energetic lately!!/", "obj_npc_room_slash_Other_10_gml_1031_0");
        msgnextloc("* I don't know what's happened^1, but..../", "obj_npc_room_slash_Other_10_gml_1032_0");
        msgnextloc("* Seeing him happy makes me happy too!!/", "obj_npc_room_slash_Other_10_gml_1033_0");
        msgnextloc("* Oh!!^1! A customer!^1! Would you like a blue soft-serve!?/%", "obj_npc_room_slash_Other_10_gml_1034_0");
    }
    
    if (sprite_index == spr_npc_icewolf)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Double-Ice pizza..^1. great!/", "obj_npc_room_slash_Other_10_gml_1042_0");
            msgnextloc("* Ice Wolf^1, big customer!/", "obj_npc_room_slash_Other_10_gml_1043_0");
            msgnextloc("* ..^1. Ice Wolf^1, maybe only customer./%", "obj_npc_room_slash_Other_10_gml_1044_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ice Wolf^1, thinks ICE-E is cute./", "obj_npc_room_slash_Other_10_gml_1048_0");
            msgnextloc("* Ice Wolf^1, big fan.../%", "obj_npc_room_slash_Other_10_gml_1049_0");
        }
    }
}

if (room == room_lw_police)
{
    if (sprite_index == spr_npc_napstablook_police_down)
    {
        var dogchase = global.flag[317] != 0;
        
        if (dogchase)
        {
            if (global.flag[317] != 2)
            {
                with (obj_npc_napstablook_cop)
                    con = 0;
                
                scr_speaker("napstablook");
                msgsetloc(0, "* oh....^1. jailbreak..../", "obj_npc_room_slash_Other_10_gml_1067_0");
                msgnextloc("* i'll sound the alarm..../%", "obj_npc_room_slash_Other_10_gml_1068_0");
            }
            else
            {
                scr_speaker("napstablook");
                msgsetloc(0, "* i made the jailbreak alarm my mixtape.../", "obj_npc_room_slash_Other_10_gml_1071_0");
                msgnextloc("* it's a nice beat to study or relax to while you escape from prison/%", "obj_npc_room_slash_Other_10_gml_1072_0");
            }
        }
        else if (talked == 0)
        {
            scr_speaker("napstablook");
            msgsetloc(0, "* (oh no...^1. i accidentally ended up as a police officer...)/", "obj_npc_room_slash_Other_10_gml_1078_0");
            msgnextloc("* (oh no...^1. i can't quit because my cousins are relying on me...)/", "obj_npc_room_slash_Other_10_gml_1079_0");
            msgnextloc("* oh..^1. hey.../", "obj_npc_room_slash_Other_10_gml_1080_0");
            msgnextloc("* don't do anything illegal..^1. please.../%", "obj_npc_room_slash_Other_10_gml_1081_0");
        }
        else
        {
            scr_speaker("napstablook");
            msgsetloc(0, "* oh..^1. sorry..^1. did i intimidate you too much.../", "obj_npc_room_slash_Other_10_gml_1085_0");
            msgnextloc("* oh..../", "obj_npc_room_slash_Other_10_gml_1086_0");
            msgnextloc("* it's ok to do a little crime sometimes./", "obj_npc_room_slash_Other_10_gml_1087_0");
            msgnextloc("* like if you eat candy off the floor.../", "obj_npc_room_slash_Other_10_gml_1088_0");
            msgnextloc("* even after 5 seconds.../", "obj_npc_room_slash_Other_10_gml_1089_0");
            msgnextloc("* i won't arrest you./%", "obj_npc_room_slash_Other_10_gml_1090_0");
        }
    }
}

if (room == room_lw_conbini)
{
    if (x > 150)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Yea i'm tha sicko that looks at all the milks to find the best expiration date/", "obj_npc_room_slash_Other_10_gml_1103_0");
            msgnextloc("* You got something about it?/%", "obj_npc_room_slash_Other_10_gml_1104_0");
        }
        else if (global.flag[308] == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Don't talk to me unless you want to look at milk/%", "obj_npc_room_slash_Other_10_gml_1110_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Can your family not come in here when I'm looking at milk/%", "obj_npc_room_slash_Other_10_gml_1114_0");
        }
    }
    
    if (sprite_index == spr_npc_diamond_tallboy)
    {
        msgsetloc(0, "* Sometimes the hoofed girl comes here^1,/", "obj_npc_room_slash_Other_10_gml_1121_0");
        msgnextloc("* Opens the freezer door.../", "obj_npc_room_slash_Other_10_gml_1122_0");
        msgnextloc("* Then stands in front of it^1, lost in thought./", "obj_npc_room_slash_Other_10_gml_1123_0");
        msgnextloc("* Guess she really likes the cold. Or waffles./%", "obj_npc_room_slash_Other_10_gml_1124_0");
    }
}

if (room == room_alphysalley)
{
    global.msc = 1037;
    scr_text(global.msc);
}

if (room == room_cc_lancer)
{
    if (global.plot >= 200)
    {
        if (talked == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E9* Lancer!^1! Hey^1, Lancer!^1! How you feeling!?/", "obj_npc_room_slash_Other_10_gml_1106_0");
            scr_anyface_next("lancer", 3);
            msgnextloc("\\E3* (huff^1, puff...) One-hundred percent^1, my purplish pal!/", "obj_npc_room_slash_Other_10_gml_1108_0");
            scr_anyface_next("susie", 20);
            msgnextloc("\\EK* Uhh^1, you sure? You're breathing kinda heavy./", "obj_npc_room_slash_Other_10_gml_1110_0_b");
            scr_anyface_next("lancer", 2);
            msgnextloc("\\E2* Haha^1! Just a little winded from jumping from Kris's POCKET!/", "obj_npc_room_slash_Other_10_gml_1112_0");
            msgnextloc("\\E3* Feel free to clown around town. I'll be in your ITEMs!/", "obj_npc_room_slash_Other_10_gml_1113_0");
            scr_anyface_next("susie", 10);
            msgnextloc("\\EA* No idea what you mean^1, but^1, sure./%", "obj_npc_room_slash_Other_10_gml_1115_0");
        }
        else
        {
            scr_speaker("lancer");
            
            if (scr_sideb_get_phase() > 0)
                msgsetloc(0, "\\E3* Susie^1, Susie^1! Can you carry me on your back?/", "obj_npc_room_slash_Other_10_gml_1121_0_c");
            else
                msgsetloc(0, "\\E3* Susie^1, Susie^1! Can you carry me on your back again?/", "obj_npc_room_slash_Other_10_gml_1119_0");
            
            scr_anyface_next("susie", 34);
            msgnextloc("\\EY* Heh^1, sure^1! If you can stay on when I'm at full speed!/", "obj_npc_room_slash_Other_10_gml_1121_0_b");
            scr_anyface_next("lancer", 1);
            msgnextloc("\\E1* Wow!^1! The Susie-train!^1! Castle Town's most exciting attraction!!!/", "obj_npc_room_slash_Other_10_gml_1123_0_b");
            scr_anyface_next("ralsei", 19);
            msgnextloc("\\EJ* .../", "obj_npc_room_slash_Other_10_gml_1125_0");
            scr_anyface_next("susie", 17);
            msgnextloc("\\EH* YOU AND KRIS STOP FORMING A LINE!!/%", "obj_npc_room_slash_Other_10_gml_1127_0");
        }
    }
    else
    {
        if (global.plot >= 15)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E9* Lancer^1, you aren't gonna believe how sick my room is!/", "obj_npc_room_slash_Other_10_gml_1139_0");
            scr_anyface_next("lancer", 2);
            msgnextloc("\\E2* A room as sick as you?^1! Woah!^1! I want to see!!/", "obj_npc_room_slash_Other_10_gml_1141_0");
            msgnextloc("* I'll keep digging holes until I reach your room!!/", "obj_npc_room_slash_Other_10_gml_1142_0");
            scr_anyface_next("susie", "K");
            msgnextloc("\\EK* Uhh^1, it's got a door^1, y'know./", "obj_npc_room_slash_Other_10_gml_1144_0");
            scr_anyface_next("lancer", 1);
            msgnextloc("\\E1* A door!? Wow^1, peachboy^1, you went all out!!!/%", "obj_npc_room_slash_Other_10_gml_1146_0");
        }
        else
        {
            scr_speaker("lancer");
            msgsetloc(0, "\\E1* This is the best room ever!!!/", "obj_npc_room_slash_Other_10_gml_1150_0");
            msgnextloc("\\E2* How'd you know what I like??/", "obj_npc_room_slash_Other_10_gml_1151_0");
            scr_anyface_next("ralsei", "2");
            msgnextloc("\\E2* Err^1, I just sort of^1, had a hunch.../", "obj_npc_room_slash_Other_10_gml_1153_0");
            scr_anyface_next("lancer", 1);
            msgnextloc("\\E1* The quasimodo of kindness^1, people!!/%", "obj_npc_room_slash_Other_10_gml_1155_0");
        }
        
        if (talked >= 1)
        {
            scr_speaker("lancer");
            msgsetloc(0, "\\E1* I love that my floor is full of holes!/%", "obj_npc_room_slash_Other_10_gml_1124_0_b");
        }
    }
}

if (room == room_dw_castle_dungeon)
{
    if (sprite_index == spr_npc_gouldensam && x > 60 && x < 100)
        msgsetloc(0, "* (I'm Goulden Sam.)/%", "obj_npc_room_slash_Other_10_gml_975_0");
    
    if (sprite_index == spr_npc_gouldensam && x > 100)
        msgsetloc(0, "* (This is a nice prison!)/%", "obj_npc_room_slash_Other_10_gml_1168_0");
    
    if (sprite_index == spr_npc_cage_king_castle)
    {
        msgsetloc(0, "* We're still behind bars for some reason^1, but it's OK!/", "obj_npc_room_slash_Other_10_gml_1173_0");
        msgnextloc("* We've grown to love this hellish place^1, where we dress as animals!/%", "obj_npc_room_slash_Other_10_gml_1174_0");
    }
    
    if (sprite_index == spr_npc_cage_animals_castle)
        msgsetloc(0, "* (We decided to dress as kings. It's cultural exchange.)/%", "obj_npc_room_slash_Other_10_gml_1179_0");
}

if (room == room_dw_mansion_krisroom)
{
    if (sprite_index == spr_dw_mansion_room_kris_bathbomb)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's dozens and dozens of bath bombs.)/", "obj_npc_room_slash_Other_10_gml_1188_0");
        msgnextloc("* (From search query: diy bath bomb)/%", "obj_npc_room_slash_Other_10_gml_1189_0");
    }
    
    if (sprite_index == spr_dw_mansion_room_kris_monitor)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It seems to have been overloaded by shovel requests.)/", "obj_npc_room_slash_Other_10_gml_1210_0");
        msgnextloc("* (This is known as a Dozens and Dozens of Shovels attack.)/%", "obj_npc_room_slash_Other_10_gml_1211_0");
    }
}

if (room == room_dw_mansion_susieroom)
{
    if (sprite_index == spr_dw_mansion_room_susie_computer)
    {
        if (scr_havechar(2))
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E2* Look^1, I know what you're thinking./", "obj_npc_room_slash_Other_10_gml_1220_0");
            msgnextloc("\\EA* And NO^1, the skateboard game doesn't work on this./%", "obj_npc_room_slash_Other_10_gml_1221_0");
        }
        else
        {
            msgsetloc(0, "* (Susie's computer.^1)&* (Doesn't seem compatible with the skateboard game.)/%", "obj_npc_room_slash_Other_10_gml_1220_0_b");
        }
    }
    
    if (sprite_index == spr_dw_mansion_room_susie_easter_egg)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a painted egg..^1. It's warm.)/", "obj_npc_room_slash_Other_10_gml_1227_0");
        msgnextloc("* (From search query: can harboil eggs hatch)/%", "obj_npc_room_slash_Other_10_gml_1228_0");
    }
    
    if (sprite_index == spr_dw_mansion_room_susie_talk_tube)
    {
        if (scr_havechar(2))
        {
            scr_smallface(0, "ralsei", 30, "middle", "bottom", stringsetloc("(Why are you using that face now?)", "obj_npc_room_slash_Other_10_gml_1233_0"));
            var sentenceEnd = scr_havechar(3) ? "\\f0/%" : "/%";
            var susie_text = stringsetsubloc("\\E8* You think it would torch the other side?~1", sentenceEnd, "obj_npc_room_slash_Other_10_gml_1236_0");
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Hey Kris^1, if you blasted flames down this horn thing.../", "obj_npc_room_slash_Other_10_gml_1239_0");
            msgnext(susie_text);
        }
        else
        {
            msgsetloc(0, "* (Susie's talk tube thing. Looks a bit bigger for her larger head.)/%", "obj_npc_room_slash_Other_10_gml_1248_0");
        }
    }
}

if (room == room_dw_city_traffic_1)
{
    if (sprite_index == spr_npc_werewire)
    {
        if (talked == 0)
        {
            if (global.plot < 100)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I heard the rollercoasters are undergoing maintenance./", "obj_npc_room_slash_Other_10_gml_1253_0");
                msgnextloc("* That's a pain because it's our only form of public transit./%", "obj_npc_room_slash_Other_10_gml_1254_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Are the roller coasters still broken? Too bad./", "obj_npc_room_slash_Other_10_gml_1258_0");
                msgnextloc("* I keep petitioning for a public merry-go-round^1, but.../%", "obj_npc_room_slash_Other_10_gml_1259_0");
            }
        }
        else if (global.plot < 100)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Yes. The teacup ride is privately owned./%", "obj_npc_room_slash_Other_10_gml_1267_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* There was some ex-famous guy^1, some salesman-lobbyist-type.../", "obj_npc_room_slash_Other_10_gml_1271_0");
            msgnextloc("* He was afraid of clowns^1, so he kept it from happening./%", "obj_npc_room_slash_Other_10_gml_1272_0");
        }
    }
}

if (room == room_dw_city_big_1)
{
    if (global.plot < 85)
    {
        var anytalked = false;
        
        with (obj_npc_room)
        {
            if (talked > 0)
                anytalked = true;
        }
        
        if (!anytalked)
        {
            scr_smallface(0, "empty", 1, "middle", "bottom", stringsetloc("Advertisements now only $9.99!", "obj_npc_room_slash_Other_10_gml_1293_0"));
            scr_speaker("no_name");
            msgsetloc(0, "* We are Addisons^1! All we do is advertise!!/", "obj_npc_room_slash_Other_10_gml_1296_0");
            msgnextloc("* This is an advertisement too!\\f0/%", "obj_npc_room_slash_Other_10_gml_1297_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Don't like advertisements? Block ads for only $9.99!/", "obj_npc_room_slash_Other_10_gml_1300_0");
            msgnextloc("* Change your mind? Bring them back for only $9.99!/%", "obj_npc_room_slash_Other_10_gml_1301_0");
        }
    }
    else if (y > 270)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Spamton? ..^1. Haven't heard that name in a long time./%", "obj_npc_room_slash_Other_10_gml_1308_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Spamton? ..^1. We don't talk about that around here./%", "obj_npc_room_slash_Other_10_gml_1312_0");
    }
    
    if (sprite_index == spr_npc_plugboy_static_outline)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I wanted to buy something.../", "obj_npc_room_slash_Other_10_gml_1321_0");
            msgnextloc("* But I think all of the shopkeepers went to the trash dump.../%", "obj_npc_room_slash_Other_10_gml_1322_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* That's a shame..^1. I wanted to get ripped off./%", "obj_npc_room_slash_Other_10_gml_1326_0");
        }
    }
}

if (room == room_dw_city_traffic_2)
{
    if (global.plot < 100)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Since everyone else got plugged they're a lot more agreeable./", "obj_npc_room_slash_Other_10_gml_1336_0");
        msgnextloc("* It's nice./%", "obj_npc_room_slash_Other_10_gml_1337_0");
    }
    else if (talked == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Pretty much everyone else is a Werewire now./", "obj_npc_room_slash_Other_10_gml_1343_0");
        msgnextloc("* Kind of wondering if I'm holding everything back.../%", "obj_npc_room_slash_Other_10_gml_1344_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* I'm not even sure I would make a good Werewire./%", "obj_npc_room_slash_Other_10_gml_1348_0");
    }
}

if (room == room_dw_city_mirrorfriend)
{
    scr_speaker("no_name");
    msgsetloc(0, "* Hey^1, got any way to deal with crushing^1, existential dread?/", "obj_npc_room_slash_Other_10_gml_1356_0");
    msgnextloc("* Asking for a friend./", "obj_npc_room_slash_Other_10_gml_1357_0");
    msgnextloc("* A friend that looks^1, and sounds^1, exactly like me./%", "obj_npc_room_slash_Other_10_gml_1358_0");
    
    if (instance_exists(obj_ch2_room_city_susie_ralsei_fun_2))
    {
        with (obj_ch2_room_city_susie_ralsei_fun_2)
            con = 1;
    }
}

if (room == room_dw_city_big_2)
{
    if (scr_havechar(4))
    {
        var anytalked = false;
        
        with (obj_npc_room)
        {
            if (talked > 0)
                anytalked = true;
        }
        
        if (!anytalked && global.flag[441] == 0)
        {
            global.flag[441] = 1;
            global.msc = 1069;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ah^1, you two don't look together!/", "obj_npc_room_slash_Other_10_gml_1382_0");
            msgnextloc("* Can I interest you in some brand new Divorcing Shoes...?/%", "obj_npc_room_slash_Other_10_gml_1383_0");
        }
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Ah^1, you three look together^1! How about some marriage shoes?/%", "obj_npc_room_slash_Other_10_gml_1364_0");
    }
}

if (room == room_dw_city_big_3)
{
    if (sprite_index == spr_npc_addison_blue)
    {
        if (global.plot < 85)
        {
            global.msc = 1073;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Spamton? ..^1. No idea who you're talking about./%", "obj_npc_room_slash_Other_10_gml_1398_0");
        }
    }
    
    if (sprite_index == spr_npc_addison_orange)
    {
        if (global.plot < 85)
        {
            if (scr_armorcheck_inventory(16) == 1 || scr_armorcheck_equipped(1, 16) == 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Buy^1! Buy^1! Buy^1! We're sold out^1! Buy!/%", "obj_npc_room_slash_Other_10_gml_1385_0");
            }
            else
            {
                global.msc = 1075;
                scr_text(global.msc);
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Spamton? ..^1. We don't talk about that around here./%", "obj_npc_room_slash_Other_10_gml_1411_0");
        }
    }
    
    if (sprite_index == spr_npc_addison_pink)
    {
        global.msc = 1077;
        scr_text(global.msc);
    }
}

if (room == room_dw_ralsei_castle_front)
{
    if (sprite_index == spr_ballperson)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a bit scary moving to a new place. But^1, as a ball...)/", "obj_npc_room_slash_Other_10_gml_1427_0");
        msgnextloc("* (There's nothing to sphere except sphere itself.)/%", "obj_npc_room_slash_Other_10_gml_1428_0");
    }
    
    if (sprite_index == spr_npc_ballperson_wig)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (With this windfall^1, I've ceased to be spherical.)/", "obj_npc_room_slash_Other_10_gml_1434_0");
        msgnextloc("* (Nubert..^1. you're one-of-a-kind.)/%", "obj_npc_room_slash_Other_10_gml_1435_0");
    }
    
    if (sprite_index == spr_npc_jackperson_hat)
    {
        if (global.plot < 200)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Prince Ralsei^1, I will keep your hat a-racked until you need it!/%", "obj_npc_room_slash_Other_10_gml_1445_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Until then^1, please allow me to pretend to be a wizard^1! Hi-ya!/%", "obj_npc_room_slash_Other_10_gml_1449_0");
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ho ho!^1! Who is this guy!^1! He's scary!!/%", "obj_npc_room_slash_Other_10_gml_1455_0");
        }
    }
    
    if (sprite_index == spr_npc_nubert)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Nubert's had a wild ride. Time to settle down./", "obj_npc_room_slash_Other_10_gml_1462_0");
        msgnextloc("* Give my riches to the weak.../%", "obj_npc_room_slash_Other_10_gml_1463_0");
    }
}

if (room == room_dw_castle_area_2_transformed)
{
    if (sprite_index == spr_rurus_idle)
    {
        if (talked == 0)
        {
            scr_speaker("rouxls");
            msgsetloc(0, "* Ah^1! Thou hast Transplantedeth us to Thine Castle Towne.../", "obj_npc_room_slash_Other_10_gml_1481_0");
            msgnextloc("\\E2* And^1, Trulye^1, a maginificenth Towne of Castles^1, it art!/", "obj_npc_room_slash_Other_10_gml_1482_0");
            msgnextloc("\\E6* But ho^1! Hmmm..^1. Something art..^1. Lackingth^1, it Feeleth./", "obj_npc_room_slash_Other_10_gml_1483_0");
            msgnextloc("\\E1* Couldth thou guys..^1. Perhapsth.../", "obj_npc_room_slash_Other_10_gml_1484_0");
            msgnextloc("\\E6* Bringe in an Evil Rulere...^1. Or some Thinge...?/%", "obj_npc_room_slash_Other_10_gml_1485_0");
        }
        else
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E0* Lancer hath benounced me \"Vice Fathere...\"/", "obj_npc_room_slash_Other_10_gml_1489_0");
            msgnextloc("\\E5* Forthhence^1, I do All the Cookinge and Cleaninge./", "obj_npc_room_slash_Other_10_gml_1490_0");
            msgnextloc("\\E6* Perhapsth^1, I shouldst seeketh a New Employere.../%", "obj_npc_room_slash_Other_10_gml_1491_0");
        }
    }
    
    if (sprite_index == spr_diamond_overworld)
    {
        if (x > 620 && x < 630 && y > 770 && y < 780)
        {
            if (talked == 0)
            {
                if (global.plot < 200)
                {
                    scr_speaker("no_name");
                    msgsetsubloc(0, "* Oho. Welcome to&~1Town!/", global.truename, "obj_npc_room_slash_Other_10_gml_1504_0");
                    msgnextloc("* Or so I heard it's called./%", "obj_npc_room_slash_Other_10_gml_1505_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Oho. Welcome home./", "obj_npc_room_slash_Other_10_gml_1509_0");
                    msgnextsubloc("* Things have changed again here in&~1Town!/%", global.truename, "obj_npc_room_slash_Other_10_gml_1510_0");
                }
            }
            else if (global.plot < 200)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Come to think of it^1,/", "obj_npc_room_slash_Other_10_gml_1517_0");
                msgnextloc("* Welcome to me too^1! Haha!/", "obj_npc_room_slash_Other_10_gml_1518_0");
                msgnextloc("* I think we're gonna like living here!/%", "obj_npc_room_slash_Other_10_gml_1519_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This is a dream that grows with love and care./", "obj_npc_room_slash_Other_10_gml_1523_0");
                msgnextloc("* Don't be afraid to dream!/%", "obj_npc_room_slash_Other_10_gml_1524_0");
            }
        }
        
        if (x > 310 && x < 330 && y > 910 && y < 930)
        {
            if (global.flag[635] == 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ha ha^1! That's right^1! They took so long on their turn.../", "obj_npc_room_slash_Other_10_gml_1541_0");
                msgnextloc("* What!? A horned girl? I never got to see her!/%", "obj_npc_room_slash_Other_10_gml_1542_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This guy always seems like he's enjoying life more than me./", "obj_npc_room_slash_Other_10_gml_1535_0");
                msgnextloc("* Maybe it's because he's a higher level...?/%", "obj_npc_room_slash_Other_10_gml_1536_0");
                
                if (global.plot < 200 && global.flag[248] == 1)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Is this guy seriously sucking up to you already^1? Even though you hurt us?/", "obj_npc_room_slash_Other_10_gml_1574_0_b");
                    msgnextloc("* He could at least wait until later today!/%", "obj_npc_room_slash_Other_10_gml_1575_0_b");
                }
            }
        }
    }
    
    if (sprite_index == spr_heartenemy_overworld)
    {
        if (global.plot < 200 || scr_get_total_recruits(2) < 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Seems like Hathy likes this place.)/", "obj_npc_room_slash_Other_10_gml_1560_0");
            msgnextloc("* (She hopes you'll like it too.)/%", "obj_npc_room_slash_Other_10_gml_1561_0");
            
            if (global.plot < 200 && global.flag[248] == 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Seems like Hathy likes this place.)/", "obj_npc_room_slash_Other_10_gml_1594_0");
                msgnextloc("* (You feel an aura of forgiveness...)/%", "obj_npc_room_slash_Other_10_gml_1595_0_b");
            }
            
            if (global.flag[252] == 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Seems Hathy likes this place.)/", "obj_npc_room_slash_Other_10_gml_1554_0");
                msgnextloc("* (She hopes you'll find enough beds to inspect.)/", "obj_npc_room_slash_Other_10_gml_1555_0");
                msgnextloc("* (You'll lose your bed inspector title if you don't inspect enough beds.)/%", "obj_npc_room_slash_Other_10_gml_1556_0");
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Hathy's happy to see so many new faces.)/", "obj_npc_room_slash_Other_10_gml_1566_0");
            msgnextloc("* (Happy's hathy.)/%", "obj_npc_room_slash_Other_10_gml_1567_0");
        }
    }
    
    if (sprite_index == spr_npc_rabbick_clean)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a clean start for us here!/", "obj_npc_room_slash_Other_10_gml_1574_0");
        msgnextloc("* (Sukkiri...)/%", "obj_npc_room_slash_Other_10_gml_1575_0");
    }
    
    if (sprite_index == spr_npc_werewire)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Thanks for getting rid of Queen!/", "obj_npc_room_slash_Other_10_gml_1581_0");
        msgnextloc("* ..^1. yeah^1, this form is much cooler^1, so I'm keeping it.../%", "obj_npc_room_slash_Other_10_gml_1582_0");
    }
    
    if (sprite_index == spr_daimond_knight_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Thanks to you^1, commander^1, we've been liberated!/", "obj_npc_room_slash_Other_10_gml_1588_0");
        msgnextloc("* I hereby declare today National Ham Sandwich Day of Independence!/%", "obj_npc_room_slash_Other_10_gml_1589_0");
    }
    
    if (sprite_index == spr_npc_plugboy_static_outline)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Wh..^1. what a wonderful place..^1. thank you.../", "obj_npc_room_slash_Other_10_gml_1595_0");
        msgnextloc("* This town^1, not that restaurant. It looks weird. I'm not going in.../%", "obj_npc_room_slash_Other_10_gml_1596_0");
    }
    
    if (sprite_index == spr_blockler_b)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Bow bow./", "obj_npc_room_slash_Other_10_gml_1604_0");
            msgnextloc("* (I'm bjust a block.)/%", "obj_npc_room_slash_Other_10_gml_1605_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (I don't bget it.)/", "obj_npc_room_slash_Other_10_gml_1609_0");
            msgnextloc("* (Did bwe go somebwhere?)/%", "obj_npc_room_slash_Other_10_gml_1610_0");
        }
    }
    
    if (sprite_index == spr_lancer_rt)
    {
        if (talked == 0)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EK* I..^1. thought you were racing?/", "obj_npc_room_slash_Other_10_gml_1604_0_b");
            scr_anyface_next("lancer", 2);
            msgnextloc("\\E2* Yeah^1! I wanna be the egg!!/%", "obj_npc_room_slash_Other_10_gml_1606_0");
        }
        else
        {
            scr_speaker("lancer");
            msgsetloc(0, "\\E1* You won't get through your teen years without at least one Egg./%", "obj_npc_room_slash_Other_10_gml_1610_0_b");
        }
    }
}

if (room == room_dw_castle_cafe)
{
    if (sprite_index == spr_topchef)
    {
        global.msc = 1099;
        scr_text(global.msc);
    }
    
    if (sprite_index == spr_diamond_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Hey^1, boss^1! I'll have a Dark Candy Starfait!/%", "obj_npc_room_slash_Other_10_gml_1626_0");
    }
    
    if (sprite_index == spr_heartenemy_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Hathy is going to order a heart-foam latte.)/%", "obj_npc_room_slash_Other_10_gml_1632_0");
    }
    
    if (sprite_index == spr_jigsawry_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Lemonade? ..^1. Please./%", "obj_npc_room_slash_Other_10_gml_1638_0");
    }
    
    if (sprite_index == spr_ponman_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it wants to osmose some flavorful cubes.)/%", "obj_npc_room_slash_Other_10_gml_1644_0");
    }
    
    if (sprite_index == spr_npc_rabbick_clean)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it wants to be dabbed with rubbing alcohol.)/%", "obj_npc_room_slash_Other_10_gml_1650_0");
    }
    
    if (sprite_index == spr_blockguy_spared)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Everything tastes better with a normally-shaped body!/%", "obj_npc_room_slash_Other_10_gml_1656_0");
    }
    
    if (sprite_index == spr_diamond_knight_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Boss...? You're treating me...? Oh^1, you shouldn't have^1! (smile)/%", "obj_npc_room_slash_Other_10_gml_1662_0");
    }
    
    if (sprite_index == spr_hathyx_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Head Hathy drinks an ice tea in silence...)/%", "obj_npc_room_slash_Other_10_gml_1668_0");
    }
    
    if (global.chapter == 2)
    {
        if (sprite_index == spr_npc_swatchling_cafe)
        {
            global.msc = 1135;
            scr_text(global.msc);
        }
        
        if (sprite_index == spr_npc_swatchling_down)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Good evening^1, boss^1. Today's meal is Crisped `#E23D28./", "obj_npc_room_slash_Other_10_gml_1722_0");
            msgnextloc("* It's been deep-fried with the finest JPEG artifacting.../", "obj_npc_room_slash_Other_10_gml_1723_0");
            msgnextloc("* I hope it suits your palette..^1. er^1, palate./%", "obj_npc_room_slash_Other_10_gml_1724_0");
        }
        
        if (sprite_index == spr_npc_tasquemanager)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Boss^1, this Cafe is so unrefined. So plain./", "obj_npc_room_slash_Other_10_gml_1729_0");
            msgnextloc("* Why don't we make it into an animal cafe?/", "obj_npc_room_slash_Other_10_gml_1730_0");
            msgnextloc("* ..^1. you can be one of the animals^1, too^1, boss./%", "obj_npc_room_slash_Other_10_gml_1731_0");
            
            if (i_ex(obj_npc_castle_cafe))
            {
                with (obj_npc_castle_cafe)
                    tm_con = 1;
            }
        }
        
        if (sprite_index == spr_maus_idle)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Seems well behaved.)/%", "obj_npc_room_slash_Other_10_gml_1737_0");
        }
        
        if (sprite_index == spr_tasque_idle)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Seems well behaved.)/%", "obj_npc_room_slash_Other_10_gml_1743_0");
            
            if (i_ex(obj_npc_castle_cafe))
            {
                with (obj_npc_castle_cafe)
                    t_con = 1;
            }
        }
        
        if (sprite_index == spr_poppup_idle)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* RIKO RIKO!/%", "obj_npc_room_slash_Other_10_gml_1749_0");
        }
    }
}

if (room == room_dw_castle_restaurant)
{
    if (sprite_index == spr_lancer_lt_mustache)
    {
        global.msc = 1103;
        scr_text(global.msc);
    }
    
    if (sprite_index == spr_topchef)
    {
        global.msc = 1099;
        scr_text(global.msc);
    }
}

if (room == room_dw_castle_west_cliff)
{
    if (sprite_index == spr_npc_mrsociety)
    {
        global.flag[314] = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Oh^1, it's quite a wonderful town^1, really. Thank you!/", "obj_npc_room_slash_Other_10_gml_1777_0");
        msgnextloc("* ..^1. so..^1. why am I alone here?/", "obj_npc_room_slash_Other_10_gml_1778_0");
        msgnextloc("* A bit of self-reflection^1, I suppose./", "obj_npc_room_slash_Other_10_gml_1779_0");
        msgnextloc("* I do realize I was quite a coward before.../", "obj_npc_room_slash_Other_10_gml_1780_0");
        msgnextloc("* So..^1. I wanted to say..^1. well.../", "obj_npc_room_slash_Other_10_gml_1781_0");
        msgnextloc("* I STILL AM!!!!/", "obj_npc_room_slash_Other_10_gml_1782_0");
        msgnextloc("* My cards^1, I cannot handle society!/", "obj_npc_room_slash_Other_10_gml_1783_0");
        msgnextloc("* For now^1, I'll be living at the top of this cliff!/", "obj_npc_room_slash_Other_10_gml_1784_0");
        msgnextloc("* When I'm ready to meet society again^1, I will be back!/", "obj_npc_room_slash_Other_10_gml_1785_0");
        msgnextloc("* Thank you^1, thank you for the wonderful home^1! I will NOT use it!/%", "obj_npc_room_slash_Other_10_gml_1786_0");
        
        with (obj_npc_castle_cliff)
            con = 1;
    }
    
    if (sprite_index == spr_npc_cursor_walk_right)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Thanks a lot for the lovely city./", "obj_npc_room_slash_Other_10_gml_1748_0");
            msgnextloc("* It's nearly as good as the one I made in Minecrap./%", "obj_npc_room_slash_Other_10_gml_1749_0_b");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I need to mine ten-hundred blocks of Bubsidian to make my dog 3 colors./%", "obj_npc_room_slash_Other_10_gml_1753_0");
        }
    }
}

if (room == room_dw_castle_east_door)
{
    if (sprite_index == spr_blockguy_pants3)
    {
        if (global.plot < 200)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. I like being like this./", "obj_npc_room_slash_Other_10_gml_1801_0");
            msgnextloc("* Don't tell anybody./%", "obj_npc_room_slash_Other_10_gml_1802_0");
        }
        else if (talked == 0 && scr_get_total_recruits(2) > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* These animals are stray...?/", "obj_npc_room_slash_Other_10_gml_1808_0");
            msgnextloc("* No^1, they are practicing a special loneliness style./", "obj_npc_room_slash_Other_10_gml_1809_0");
            msgnextloc("* ..^1. Just like me./", "obj_npc_room_slash_Other_10_gml_1810_0");
            msgnextloc("* Lone wolves have to stick together./%", "obj_npc_room_slash_Other_10_gml_1811_0");
            
            if (i_ex(obj_npc_castle_door))
            {
                with (obj_npc_castle_door)
                    howl_con = 1;
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Train at the party dojo? Ha.../", "obj_npc_room_slash_Other_10_gml_1817_0");
            msgnextloc("* We will make our own dojo..^1. for introverts./%", "obj_npc_room_slash_Other_10_gml_1818_0");
        }
    }
    
    if (sprite_index == spr_blockguy_pants4)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. I've been training./", "obj_npc_room_slash_Other_10_gml_1828_0");
            msgnextloc("* ..^1. Don't ask what I've been training^1, though./%", "obj_npc_room_slash_Other_10_gml_1829_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. are you impressed...?/%", "obj_npc_room_slash_Other_10_gml_1833_0");
        }
    }
}

if (room == room_dw_castle_dojo)
{
    if (sprite_index == spr_clubs_idle)
    {
        if (global.flag[640] != 1 || global.plot < 200)
        {
            if (talked == 0)
            {
                scr_miniface_init_clover();
                msgsetloc(0, "\\m1*\t\tWow^1, our house is a dojo?!&\\m2\tMakes me wanna FIGHT...&\\m3\t(Can't we go to sleep?)/%", "obj_npc_room_slash_Other_10_gml_1848_0");
            }
            else
            {
                scr_miniface_init_clover();
                msgsetloc(0, "\\m1*\t\tIt's a PARTY every day!&\\m2\tAnd I'M the oldest!&\\m3\t(We're the same age...)/%", "obj_npc_room_slash_Other_10_gml_1852_0");
            }
        }
        else if (talked == 0)
        {
            scr_miniface_init_clover();
            msgsetloc(0, "\\m1*\t\tWho's that tall-dark-and...&\\m2\tKinda creepy person!?&\\m3\tYou mean the... Werewire?/%", "obj_npc_room_slash_Other_10_gml_1860_0");
        }
        else
        {
            scr_miniface_init_clover();
            msgsetloc(0, "\\m1*\t\tTheir neck just&\tlooks so...fluffy~&\\m2\tSo!? Like I care!?/", "obj_npc_room_slash_Other_10_gml_1864_0");
            msgnextloc("\\m3*\t\t(She wants to rub her face&\tin it...)/%", "obj_npc_room_slash_Other_10_gml_1865_0");
        }
    }
    
    if (sprite_index == spr_npc_pippins)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* He he he... Looks like fighting wasn't in the cards for us./", "obj_npc_room_slash_Other_10_gml_1875_0");
        msgnextloc("* Lucky for you... Just hope you don't meet my friends!/%", "obj_npc_room_slash_Other_10_gml_1876_0");
    }
    
    if (sprite_index == spr_werewerewire_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it won't forgive you for sparing it...)/", "obj_npc_room_slash_Other_10_gml_1882_0");
        msgnextloc("* (Unless you can beat it in a fight.)/%", "obj_npc_room_slash_Other_10_gml_1883_0");
    }
    
    if (sprite_index == spr_blockguy_idleFriendly)
    {
        if (global.plot < 200)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Finally a dojo for people that are normal-shaped/", "obj_npc_room_slash_Other_10_gml_1928_0");
            msgnextloc("* I will train my self for the tournament/%", "obj_npc_room_slash_Other_10_gml_1929_0");
        }
        else
        {
            scr_speaker("d");
            msgsetloc(0, "* My power level is falling behind the others/", "obj_npc_room_slash_Other_10_gml_1938_0");
            msgnextloc("* All I can do now is gasp and comment on the battle/%", "obj_npc_room_slash_Other_10_gml_1939_0");
        }
    }
}

if (room == room_dw_cyber_keyboard_puzzle_1)
{
    if (sprite_index == spr_npc_nubert)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Looks like you got past Nubert's forcefield./", "obj_npc_room_slash_Other_10_gml_1959_0");
            msgnextloc("* Nubert doesn't know how that forcefield got there./", "obj_npc_room_slash_Other_10_gml_1960_0");
            msgnextloc("* But it's Nubert's forcefield./", "obj_npc_room_slash_Other_10_gml_1961_0");
            msgnextloc("* As a prize, have Nubert's treasure./", "obj_npc_room_slash_Other_10_gml_1962_0");
            msgnextloc("* Nubert doesn't know what's inside./", "obj_npc_room_slash_Other_10_gml_1963_0");
            msgnextloc("* But Nubert will give it to you./%", "obj_npc_room_slash_Other_10_gml_1964_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* That's Nubert's treasure./", "obj_npc_room_slash_Other_10_gml_1968_0");
            msgnextloc("* Remember. You're just borrowing it./", "obj_npc_room_slash_Other_10_gml_1969_0");
            msgnextloc("* Forever./%", "obj_npc_room_slash_Other_10_gml_1970_0");
        }
    }
}

if (room == room_dw_cyber_maze_queenscreen)
{
    if (talked == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* All my friends turned into Werewires^1, but it's no big deal./", "obj_npc_room_slash_Other_10_gml_1980_0");
        msgnextloc("* I've been on Queen's side since the beginning^1, so I'm safe!/%", "obj_npc_room_slash_Other_10_gml_1981_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Complain about Queen^1, but she gets a lot done!/%", "obj_npc_room_slash_Other_10_gml_1985_0");
    }
}

if (room == room_dw_cyber_battle_maze_2)
{
    if (extflag == "capn")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Heh^1, good luck figuring out which ride to take!/%", "obj_npc_room_slash_Other_10_gml_1994_0");
    }
    
    if (extflag == "kk")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* This right ride is the right one./%", "obj_npc_room_slash_Other_10_gml_2000_0");
    }
}

if (room == room_lw_library_upstairs)
{
    if (sprite_index == spr_normalnpc)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I love reading books./", "obj_npc_room_slash_Other_10_gml_2011_0");
            msgnextloc("* Especially the books upstairs./%", "obj_npc_room_slash_Other_10_gml_2012_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I love reading./", "obj_npc_room_slash_Other_10_gml_2016_0");
            msgnextloc("* Especially books./%", "obj_npc_room_slash_Other_10_gml_2017_0");
        }
    }
}

if (room == room_dw_mansion_bridges_funny)
{
    image_index = 0;
    
    if (instance_exists(obj_controller_dw_mansion_bridges_funny))
    {
        if (obj_controller_dw_mansion_bridges_funny.swatchLines == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Thank you for your help./", "obj_npc_room_slash_Other_10_gml_2030_0");
            msgnextloc("* I had gone up there to do \n\\cYa little house cleaning\\cW and got stuck./%", "obj_npc_room_slash_Other_10_gml_2031_0");
        }
        
        if (obj_controller_dw_mansion_bridges_funny.swatchLines == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* .../%", "obj_npc_room_slash_Other_10_gml_2037_0");
        }
    }
}

if (room == room_dw_mansion_entrance)
{
    if (sprite_index == spr_npc_wig_robot)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's terrible... The butlers are all trapped in the cafe.../", "obj_npc_room_slash_Other_10_gml_2026_0");
        msgnextloc("* Queen is nowhere to be found^1, and.../", "obj_npc_room_slash_Other_10_gml_2027_0");
        msgnextloc("* With no one to defend it^1, a strange force has taken over the mansion!/%", "obj_npc_room_slash_Other_10_gml_2028_0");
    }
}

if (room == room_dw_mansion_east_2f_a)
{
    if (sprite_index == spr_npc_swatchling_down)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Welcome to the 2F Dinner Party Section A./", "obj_npc_room_slash_Other_10_gml_2049_0");
            msgnextloc("* Please help yourself to anybody's food./%", "obj_npc_room_slash_Other_10_gml_2050_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Normally I'm terrified of mice^1, but it's OK because that one is wearing a wig./%", "obj_npc_room_slash_Other_10_gml_2054_0");
        }
    }
    
    if (sprite_index == spr_npc_mousemillian)
    {
        if (global.flag[374] == 0 && global.flag[375] == 0)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I am Mousemillian. I stand leagues and inches above all the other mice./", "obj_npc_room_slash_Other_10_gml_2063_0");
                msgnextloc("* Only Nubert remains above me still.../%", "obj_npc_room_slash_Other_10_gml_2064_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Only Nubert remains above me still.../%", "obj_npc_room_slash_Other_10_gml_2068_0");
            }
        }
        else
        {
            var miceGold = (global.flag[374] * 20) + global.flag[375];
            scr_speaker("no_name");
            msgsetloc(0, "* (What have you done!?)/", "obj_npc_room_slash_Other_10_gml_2041_0");
            msgnextsubloc("* (You gave the other mice $~1 during that puzzle!)/", string(miceGold), "obj_npc_room_slash_Other_10_gml_2042_0");
            msgnextloc("* (At this rate^1, EVERY mouse is going to be wearing a wig...)/%", "obj_npc_room_slash_Other_10_gml_2043_0");
        }
    }
    
    if (sprite_index == spr_npc_nubert_aristocrat)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Nubert's movin' up in the world./%", "obj_npc_room_slash_Other_10_gml_2075_0");
    }
    
    if (sprite_index == spr_npc_yesman_ponytail)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Yes^1! Yes^1! Queen is right^1!&* Send error report^1!&* Send error report!/%", "obj_npc_room_slash_Other_10_gml_2081_0");
    }
    
    if (sprite_index == spr_npc_yesman)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Couldn't agree more^1!&* Send error report^1!&* Send error report!/%", "obj_npc_room_slash_Other_10_gml_2089_0");
    }
    
    if (sprite_index == spr_npc_cursor_wig)
    {
        if (global.flag[339] == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Psst..^1. Hey^1, it's me^1, the Hacker. No one figured it out but it's me./", "obj_npc_room_slash_Other_10_gml_2097_0");
            msgnextloc("* Keep it on the download./%", "obj_npc_room_slash_Other_10_gml_2098_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Psst..^1. I'm the Hacker. Nobody figured it out yet but it's me./", "obj_npc_room_slash_Other_10_gml_2076_0");
            msgnextloc("* There's an east treasure's hallway leading to BASEMENT on 1F.../", "obj_npc_room_slash_Other_10_gml_2077_0");
            msgnextloc("* Come down there and I'll help you crack the code./%", "obj_npc_room_slash_Other_10_gml_2078_0");
        }
    }
    
    if (sprite_index == spr_npc_wig_robot)
    {
        if (global.flag[357] == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* This guy keeps telling everyone at the party he's a hacker./", "obj_npc_room_slash_Other_10_gml_2106_0");
            msgnextloc("* I don't know what to do with this information./%", "obj_npc_room_slash_Other_10_gml_2107_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* There's supposed to be another guest here^1, but they're late./", "obj_npc_room_slash_Other_10_gml_2111_0");
            msgnextloc("* They called and said something about blue checkmarks.../%", "obj_npc_room_slash_Other_10_gml_2112_0");
        }
    }
}

if (room == room_dw_mansion_dining_a)
{
    if (sprite_index == spr_npc_swatchling_down)
    {
        if (x < 600)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This downstairs table will be for our special guests./", "obj_npc_room_slash_Other_10_gml_2126_0");
                msgnextloc("* There's a dinner party on the 2nd floor for everyone else./%", "obj_npc_room_slash_Other_10_gml_2127_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Combined^1, we have enough seats for everyone in the world./%", "obj_npc_room_slash_Other_10_gml_2131_0");
            }
        }
        else if (global.plot < 120)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Everything here is tailored for you..^1. right?/%", "obj_npc_room_slash_Other_10_gml_2138_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ralsei^1, good luck./", "obj_npc_room_slash_Other_10_gml_2142_0");
            msgnextloc("* Although you only joined us for minutes^1, we'll miss you./%", "obj_npc_room_slash_Other_10_gml_2143_0");
        }
    }
    
    if (sprite_index == spr_cutscene_20_lancer_stone_bib)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (He seems to be well-taken care of.)/%", "obj_npc_room_slash_Other_10_gml_2153_0");
    }
}

if (room == room_dw_mansion_east_3f)
{
    if (sprite_index == spr_npc_iconman)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* When are they gonna be done in there?/%", "obj_npc_room_slash_Other_10_gml_2167_0");
    }
}

if (room == room_dw_mansion_east_3f_toilet)
{
    if (global.flag[345] == 0)
    {
        global.flag[345] = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (The statue of Berdly is wedged in the toilet.)/", "obj_npc_room_slash_Other_10_gml_2177_0");
        msgnextloc("* (You glanced back at the bathroom door sign.)/", "obj_npc_room_slash_Other_10_gml_2178_0");
        msgnextloc("* (The sign has a silhouette of a Berdly statue.)/", "obj_npc_room_slash_Other_10_gml_2179_0");
        msgnextloc("* (Everything checks out.)/%", "obj_npc_room_slash_Other_10_gml_2180_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (No problem here.)/%", "obj_npc_room_slash_Other_10_gml_2184_0");
    }
}

if (room == room_dw_mansion_east_3f_projection)
{
    if (x > 100)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* This is today's dinner entertainment./", "obj_npc_room_slash_Other_10_gml_2195_0");
            msgnextloc("* I've heard it's called \"The Birth of a Fountain.\"/", "obj_npc_room_slash_Other_10_gml_2196_0");
            msgnextloc("* What an elegant name./%", "obj_npc_room_slash_Other_10_gml_2197_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* How elegantly quixotic!/%", "obj_npc_room_slash_Other_10_gml_2201_0");
        }
    }
    
    if (x > 200)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* The QUEEN has been very interested in this video recently./", "obj_npc_room_slash_Other_10_gml_2210_0");
            msgnextloc("* Where the KNIGHT creates the Fountain by its own hand.../", "obj_npc_room_slash_Other_10_gml_2211_0");
            msgnextloc("* Well^1, it's that and Cyber City's Funniest Home Videos./%", "obj_npc_room_slash_Other_10_gml_2212_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* We are often forced to star in those videos./%", "obj_npc_room_slash_Other_10_gml_2216_0");
        }
    }
    
    if (x > 350)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* The KNIGHT created the FOUNTAIN^1, and this WORLD./", "obj_npc_room_slash_Other_10_gml_2225_0");
            msgnextloc("* It might be even more powerful than Queen./", "obj_npc_room_slash_Other_10_gml_2226_0");
            msgnextloc("* ..^1. for now./%", "obj_npc_room_slash_Other_10_gml_2227_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. for now./%", "obj_npc_room_slash_Other_10_gml_2231_0");
        }
    }
}

if (room == room_dw_city_savepoint)
{
    if (extflag == 0)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I came to support the rebels^1, but they aren't here./", "obj_npc_room_slash_Other_10_gml_2241_0");
            msgnextloc("* ..^1. Not really sure how I would support them^1, though./%", "obj_npc_room_slash_Other_10_gml_2242_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I don't really want to eat bagels./%", "obj_npc_room_slash_Other_10_gml_2246_0");
        }
    }
    
    if (extflag == "left" || extflag == "mid")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a box.)/%", "obj_npc_room_slash_Other_10_gml_2219_0");
    }
    
    if (extflag == "right")
    {
        if (global.flag[423] >= 4 && scr_sideb_get_phase() > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There aren't any bagels left in the box.)/%", "scr_text_slash_scr_text_gml_7378_0");
        }
        else
        {
            global.msc = 1220;
            scr_text(global.msc);
        }
    }
}

if (room == room_dw_city_intro)
{
    if (!scr_havechar(2) && !scr_havechar(3) && !scr_havechar(4))
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Don't look sad. You're never alone./", "obj_npc_room_slash_Other_10_gml_2255_0");
        msgnextloc("* You got Nubert./%", "obj_npc_room_slash_Other_10_gml_2256_0");
    }
    
    if (scr_havechar(2) && scr_havechar(3))
    {
        scr_speaker("no_name");
        msgsetloc(0, "* I'm Nubert. Everybody loves me./", "obj_npc_room_slash_Other_10_gml_2262_0");
        msgnextloc("* That's why I live in the trash./%", "obj_npc_room_slash_Other_10_gml_2263_0");
    }
    
    if (scr_havechar(4))
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Nuelle^1, eh? Not a bad name^1, says Nubert./%", "obj_npc_room_slash_Other_10_gml_2269_0");
    }
}

if (room == room_dw_cyber_intro_2)
{
    if (x > 250)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* ..^1. e-everyone else has been.../%", "obj_npc_room_slash_Other_10_gml_2278_0");
    }
    
    if (x > 350)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* S-save us^1, she's going to.../%", "obj_npc_room_slash_Other_10_gml_2284_0");
    }
}

if (room == room_dw_cyber_music_bullet)
{
    if (global.plot < 65)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I was running from Queen's control plugs^1, and got stuck up here./", "obj_npc_room_slash_Other_10_gml_2295_0");
            msgnextloc("* I'm..^1. I'm too scared to go down the slide./", "obj_npc_room_slash_Other_10_gml_2296_0");
            msgnextloc("* ..^1. But you know what? Talking to you has increased my confidence!/%", "obj_npc_room_slash_Other_10_gml_2297_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I now have less social anxiety./", "obj_npc_room_slash_Other_10_gml_2301_0");
            msgnextloc("* But^1, I'm afraid of slides./%", "obj_npc_room_slash_Other_10_gml_2302_0");
        }
    }
    else if (talked == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* You came back from pretty far just to talk to me./", "obj_npc_room_slash_Other_10_gml_2309_0");
        msgnextloc("* That's really increasing my confidence./", "obj_npc_room_slash_Other_10_gml_2310_0");
        msgnextloc("* I bet I could be a hit at parties..^1. the slide? That's not happening./%", "obj_npc_room_slash_Other_10_gml_2311_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Now that I think about it^1, I don't think I could go to parties./", "obj_npc_room_slash_Other_10_gml_2315_0");
        msgnextloc("* Someone might put on a slideshow.../%", "obj_npc_room_slash_Other_10_gml_2316_0");
    }
}

if (room == room_dw_cyber_tasque_battle)
{
    if (sprite_index == spr_npc_plugboy_girl)
    {
        if (global.plot < 65)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Recently^1, something called \"Internet\" is having an \"outage\"./", "obj_npc_room_slash_Other_10_gml_2330_0");
                msgnextloc("* Some say it was the secret to Queen's know-how./", "obj_npc_room_slash_Other_10_gml_2331_0");
                msgnextloc("* Since then^1, it seems like she's become quite extreme.../%", "obj_npc_room_slash_Other_10_gml_2332_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I'm really only interested in cute digital cats./", "obj_npc_room_slash_Other_10_gml_2336_0");
                msgnextloc("* I don't think the \"Internet\" has anything to do with that!/%", "obj_npc_room_slash_Other_10_gml_2337_0");
            }
        }
        else if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I like cats the best^1, but I heard \"Poppup\" is cute^1, too./", "obj_npc_room_slash_Other_10_gml_2344_0");
            msgnextloc("* What? It's considered a household pest? No way.../%", "obj_npc_room_slash_Other_10_gml_2345_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Next you are gonna tell me that mice are vermin!/%", "obj_npc_room_slash_Other_10_gml_2349_0");
        }
    }
    
    if (sprite_index == spr_npc_plugboy_hat)
    {
        if (global.plot < 65)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Lightners^1! I haven't seen many of you recently./", "obj_npc_room_slash_Other_10_gml_2361_0");
                msgnextloc("* If you didn't know^1, an evil ruler is taking over this world./", "obj_npc_room_slash_Other_10_gml_2362_0");
                msgnextloc("* I don't really like politics^1, so I have no opinion on this./%", "obj_npc_room_slash_Other_10_gml_2363_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* If you try to talk to me about politics^1,/", "obj_npc_room_slash_Other_10_gml_2367_0");
                msgnextloc("* We will have no choice but to cross swords.../%", "obj_npc_room_slash_Other_10_gml_2368_0");
            }
        }
        else if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Did Queen take over the world yet? I wouldn't know.../%", "obj_npc_room_slash_Other_10_gml_2375_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm not asking you to tell me. Actually^1, if you do^1,/", "obj_npc_room_slash_Other_10_gml_2379_0");
            msgnextloc("* We will have no choice but to cross swords..../%", "obj_npc_room_slash_Other_10_gml_2380_0");
        }
    }
}

if (room == room_dw_cyber_musical_door)
{
    if (sprite_index == spr_npc_plugboy_bandana)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I heard there's a rebel team resisting Queen.../", "obj_npc_room_slash_Other_10_gml_2393_0");
            msgnextloc("* So far all I found are overpriced bagels.../%", "obj_npc_room_slash_Other_10_gml_2394_0");
        }
        else
        {
            scr_miniface_init_sweet();
            scr_speaker("no_name");
            msgsetloc(0, "* Bagels^1, doughnuts .../", "obj_npc_room_slash_Other_10_gml_2399_0");
            msgnextloc("* Why is it round dough is always so overpriced?/", "obj_npc_room_slash_Other_10_gml_2400_0");
            msgnextloc("\\m2\t\t*The hole is expensive!/%", "obj_npc_room_slash_Other_10_gml_2401_0");
        }
    }
    
    if (sprite_index == spr_npc_plugboy_static)
    {
        if (global.plot < 60)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I want to go back to the city^1, but the way is blocked.../", "obj_npc_room_slash_Other_10_gml_2412_0");
                msgnextloc("* I'm no country boy^1! Let me out of Cyber Field!/%", "obj_npc_room_slash_Other_10_gml_2413_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Cuisine is so unrefined out here in the (memory) sticks./%", "obj_npc_room_slash_Other_10_gml_2417_0");
            }
        }
        else if (global.plot < 65)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* The way to the city is now open./", "obj_npc_room_slash_Other_10_gml_2426_0");
                msgnextloc("* I think I'll stay in the countryside a bit longer though./%", "obj_npc_room_slash_Other_10_gml_2427_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Everything is so naturally green here./", "obj_npc_room_slash_Other_10_gml_2431_0");
                msgnextloc("* I'm charmed by the local music and flavors./%", "obj_npc_room_slash_Other_10_gml_2432_0");
            }
        }
        else if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I really got used to the countryside./", "obj_npc_room_slash_Other_10_gml_2439_0");
            msgnextloc("* Perhaps I'm just a farmboy at heart.../%", "obj_npc_room_slash_Other_10_gml_2440_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Plus^1, I haven't seen a single Poppup yet./%", "obj_npc_room_slash_Other_10_gml_2444_0");
        }
    }
}

if (room == room_dw_cyber_musical_shop)
{
    if (talked == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* I heard this unassuming store is the rebel base.../", "obj_npc_room_slash_Other_10_gml_2456_0");
        msgnextloc("* But^1, I realized I don't really know how I would help them.../%", "obj_npc_room_slash_Other_10_gml_2457_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* I don't really want to buy any more bagels.../%", "obj_npc_room_slash_Other_10_gml_2461_0");
    }
}

if (room == room_dw_mansion_lightner_hallway)
{
    if (x > 1050)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Did you enjoy your room?/", "obj_npc_room_slash_Other_10_gml_2503_0");
            msgnextloc("* There was a mint under your electric cage.../%", "obj_npc_room_slash_Other_10_gml_2504_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Don't make a mistake^1, this is not a hotel./%", "obj_npc_room_slash_Other_10_gml_2508_0");
        }
    }
    
    if (x > 1290)
    {
        if (global.flag[309] == 9)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Spamton? This used to be his room.../", "obj_npc_room_slash_Other_10_gml_2474_0");
                msgnextloc("* Though it's not like he used it^1, after a while./", "obj_npc_room_slash_Other_10_gml_2475_0");
                msgnextloc("* Eventually^1, he just spent all his time in the basement..^1. praying./%", "obj_npc_room_slash_Other_10_gml_2476_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* When things went downhill^1, he became obsessed with that artifact./", "obj_npc_room_slash_Other_10_gml_2480_0");
                msgnextloc("* Maybe he thought it would give him another big break?/%", "obj_npc_room_slash_Other_10_gml_2481_0");
            }
        }
        else if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* This mansion used to be a luxurious home for upper class citizens./", "obj_npc_room_slash_Other_10_gml_2488_0");
            msgnextloc("* Your room? It belonged to a prestigious big shot.../%", "obj_npc_room_slash_Other_10_gml_2489_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Sadly^1, his name has been erased from the records.../%", "obj_npc_room_slash_Other_10_gml_2493_0");
        }
    }
}

if (room == room_dw_city_spamton_house)
{
    if (x > 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* The day he was to be evicted from the Queen's mansion^1,/", "obj_npc_room_slash_Other_10_gml_2518_0");
        msgnextloc("* I went to his room to check on him.../", "obj_npc_room_slash_Other_10_gml_2519_0");
        msgnextloc("* But he wasn't there./", "obj_npc_room_slash_Other_10_gml_2520_0");
        msgnextloc("* There was only a phone hanging off the handle./", "obj_npc_room_slash_Other_10_gml_2521_0");
        msgnextloc("* He must've left in the middle of a conversation^1,/", "obj_npc_room_slash_Other_10_gml_2522_0");
        msgnextloc("* Because I could still hear someone on the other end.../", "obj_npc_room_slash_Other_10_gml_2523_0");
        msgnextloc("* .../", "obj_npc_room_slash_Other_10_gml_2524_0");
        msgnextloc("* But when I put the receiver to my ear.../", "obj_npc_room_slash_Other_10_gml_2525_0");
        msgnextloc("* There was nothing but garbage noise./%", "obj_npc_room_slash_Other_10_gml_2526_0");
    }
    
    if (x > 500)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Even so^1, he only got more and more successful./", "obj_npc_room_slash_Other_10_gml_2532_0");
        msgnextloc("* He moved into a luxurious room in the Queen's mansion.../", "obj_npc_room_slash_Other_10_gml_2533_0");
        msgnextloc("* He started bragging about big TV deals^1, big cars^1, big commercials.../", "obj_npc_room_slash_Other_10_gml_2534_0");
        msgnextloc("* But then things started to crack./", "obj_npc_room_slash_Other_10_gml_2535_0");
        msgnextloc("* It seems like whatever was helping him.../", "obj_npc_room_slash_Other_10_gml_2536_0");
        msgnextloc("* Disappeared./", "obj_npc_room_slash_Other_10_gml_2537_0");
        msgnextloc("* His sales dropped to zero.../", "obj_npc_room_slash_Other_10_gml_2538_0");
        msgnextloc("* And everything came crashing down./%", "obj_npc_room_slash_Other_10_gml_2539_0");
    }
    
    if (x > 600)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Suddenly^1, he got really good at his job./", "obj_npc_room_slash_Other_10_gml_2545_0");
        msgnextloc("* The clicks started piling up.../", "obj_npc_room_slash_Other_10_gml_2546_0");
        msgnextloc("* What? What did he do?/", "obj_npc_room_slash_Other_10_gml_2547_0");
        msgnextloc("* Why did HE deserve this?/", "obj_npc_room_slash_Other_10_gml_2548_0");
        msgnextloc("* We were all so jealous of him^1,/", "obj_npc_room_slash_Other_10_gml_2549_0");
        msgnextloc("* We stopped going out with him./", "obj_npc_room_slash_Other_10_gml_2550_0");
        msgnextloc("* I mean^1, wasn't he a big shot?/", "obj_npc_room_slash_Other_10_gml_2551_0");
        msgnextloc("* He didn't need us anymore^1, did he...?/%", "obj_npc_room_slash_Other_10_gml_2552_0");
    }
    
    if (x > 750)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* He started to get a little desperate./", "obj_npc_room_slash_Other_10_gml_2558_0");
        msgnextloc("* I heard he started looking for any way to become more popular./", "obj_npc_room_slash_Other_10_gml_2559_0");
        msgnextloc("* Somehow^1, he made the right phone call^1, and found someone./", "obj_npc_room_slash_Other_10_gml_2560_0");
        msgnextloc("* Or^1, was he..^1. found BY someone?/", "obj_npc_room_slash_Other_10_gml_2561_0");
        msgnextloc("* They must have been helping him^1, because suddenly^1,/", "obj_npc_room_slash_Other_10_gml_2562_0");
        msgnextloc("* He was on the phone all the time.../%", "obj_npc_room_slash_Other_10_gml_2563_0");
    }
    
    if (x > 850)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Night after night^1, when we all went to the same cyber grill^1,/", "obj_npc_room_slash_Other_10_gml_2569_0");
        msgnextloc("* He'd shoot his mouth about making it big someday./", "obj_npc_room_slash_Other_10_gml_2570_0");
        msgnextloc("* \"You just watch!\"/", "obj_npc_room_slash_Other_10_gml_2571_0");
        msgnextloc("* \"Someday^1,/", "obj_npc_room_slash_Other_10_gml_2572_0");
        msgnextloc("* I'm gonna be a big shot!\"/%", "obj_npc_room_slash_Other_10_gml_2573_0");
    }
    
    if (x > 950)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* He was..^1. Like the rest of us./", "obj_npc_room_slash_Other_10_gml_2579_0");
        msgnextloc("* Just..^1. a little unlucky./", "obj_npc_room_slash_Other_10_gml_2580_0");
        msgnextloc("* For some reason^1, his products never seemed to hit.../", "obj_npc_room_slash_Other_10_gml_2581_0");
        msgnextloc("* ..^1. and the Lightners never even looked his way./", "obj_npc_room_slash_Other_10_gml_2582_0");
        msgnextloc("* ..^1. Poor guy./%", "obj_npc_room_slash_Other_10_gml_2583_0");
    }
}

if (room == room_dw_city_mice2)
{
    scr_speaker("noelle");
    msgsetloc(0, "\\E5* I wonder what we did wrong..^1. The forcefield is still up./%", "obj_npc_room_slash_Other_10_gml_2590_0");
}

if (room == room_dw_mansion_east_1f_e)
{
    if (talked == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* I'm retiring from hacking the main frame./", "obj_npc_room_slash_Other_10_gml_2598_0");
        msgnextloc("* I decided to use my powers for the good of society./", "obj_npc_room_slash_Other_10_gml_2599_0");
        msgnextloc("* I'm going to reverse engineer the code to Super SMashing Fighters./", "obj_npc_room_slash_Other_10_gml_2600_0");
        msgnextloc("* So I can put my favorite cartoon characters into the game./%", "obj_npc_room_slash_Other_10_gml_2579_0_b");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Hacking is hard work. Whoof. I need to drink a jpeg of water./", "obj_npc_room_slash_Other_10_gml_2604_0");
        msgnextloc("* (He's using the app that lets you drink water from your phone.)/%", "obj_npc_room_slash_Other_10_gml_2605_0");
    }
}

if (room == room_dw_cyber_intro_connector)
{
    scr_speaker("no_name");
    msgsetloc(0, "* I saw you stand up to Queen^1! That was amazing!/", "obj_npc_room_slash_Other_10_gml_2612_0");
    msgnextloc("* I'll definitely become a Werewire if you can just free me!/%", "obj_npc_room_slash_Other_10_gml_2613_0");
}

if (room == room_dw_mansion_acid_tunnel_loop_rouxls)
{
    scr_speaker("no_name");
    msgsetloc(0, "* I was fishing for lost pottery in the acid when I found this photo./", "obj_npc_room_slash_Other_10_gml_2619_0");
    msgnextloc("* Please take a look./", "obj_npc_room_slash_Other_10_gml_2620_0");
    
    if (global.flag[325] == 1)
    {
        scr_anyface_next("ralsei", 1);
        msgnextloc("\\E1* U-umm^1, it sure is a nice photo.../", "obj_npc_room_slash_Other_10_gml_2625_0");
        msgnextloc("\\E2* Susie^1, do you want it for your room?/", "obj_npc_room_slash_Other_10_gml_2626_0");
        scr_anyface_next("susie", 17);
        msgnextloc("\\EH* The hell would I want this for!?/%", "obj_npc_room_slash_Other_10_gml_2628_0");
    }
    
    if (global.flag[325] == 2)
    {
        scr_anyface_next("ralsei", 2);
        msgnextloc("\\E2* Kris^1, you look nice in this one!/%", "obj_npc_room_slash_Other_10_gml_2634_0");
    }
    
    if (global.flag[325] == 3)
    {
        scr_anyface_next("susie", "Y");
        msgnextloc("\\EY* Hahaha!^1! That's awesome^1, Kris!/%", "obj_npc_room_slash_Other_10_gml_2640_0");
    }
}

if (room == room_dw_mansion_potBalance)
{
    alt = 0;
    
    if (i_ex(obj_controller_dw_mansion_potBalance))
        alt = obj_controller_dw_mansion_potBalance.readtrigger;
    
    scr_speaker("no_name");
    
    if (alt == 0)
        msgsetloc(0, "* Please do not race the pottery./%", "obj_npc_room_slash_Other_10_gml_2643_0");
    
    if (alt == 1)
        msgsetloc(0, "* Yes, we see you. You are the master of balance./%", "obj_npc_room_slash_Other_10_gml_2678_0");
}

if (room == room_dw_city_postbaseball_1)
{
    if (sprite_index == spr_noelle_walk_right_dw)
    {
        scr_speaker("noelle");
        msgsetloc(0, "\\E4* (Kris^1, don't take too long^1, okay?)/%", "obj_npc_room_slash_Other_10_gml_2686_0");
    }
}

remanimspeed = image_speed;
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
mydialoguer.jpspecial = jpspecial;
talked += 1;
