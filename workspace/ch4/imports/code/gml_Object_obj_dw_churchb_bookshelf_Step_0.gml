scr_populatechars();

if (!init)
{
    var pos = scr_genmarker("prop2");
    prop = instance_create(pos.x + 150, pos.y + 90, obj_dw_church_prophecy);
    prop.extflag = "roots";
    prop.fade_edges = true;
    
    with (roomglow)
        create_highlight(other.npc2.marker, true, true, -16);
    
    init = 1;
}

with (npc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_churchb_bookshelf_slash_Step_0_gml_26_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_churchb_bookshelf_slash_Step_0_gml_27_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* (There's a peculiar book here. Read it?)/", "obj_dw_churchb_bookshelf_slash_Step_0_gml_31_0");
        msgnext("\\C2 ");
        d_make();
        myinteract = 20;
    }
    
    if (myinteract == 20 && global.choice != -1)
    {
        if (global.choice == 0)
        {
            k_d(1);
            scr_speaker("no_name");
            msgsetloc(0, "* And so wept the fallen star^1, making rivers with its tears./", "obj_dw_churchb_bookshelf_slash_Step_0_gml_44_0");
            msgnextloc("* Then^1, slowly^1, from the bitter water^1, something grew./", "obj_dw_churchb_bookshelf_slash_Step_0_gml_45_0");
            msgnextloc("* It looked like glass./%", "obj_dw_churchb_bookshelf_slash_Step_0_gml_46_0");
            d_make();
            myinteract = 999;
        }
        
        if (global.choice == 1)
        {
            k_d();
            myinteract = 999;
        }
    }
    
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}

with (npc2)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        var texts = [];
        // array_push(texts, "where ");
        // array_push(texts, "the ");
        // array_push(texts, "tail. ");
        // array_push(texts, "pointed ");
        // array_push(texts, "the ");
        // array_push(texts, "children ");
        // array_push(texts, "would ");
        // array_push(texts, "grow,");
        // array_push(texts, "the ");
        // array_push(texts, "Lost ");
        // array_push(texts, "forest ");
        // array_push(texts, "followed ");
        array_push(texts, stringsetloc("where", "obj_dw_churchb_bookshelf_slash_Step_0_gml_90_0"));
        array_push(texts, stringsetloc("the ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_91_0"));
        array_push(texts, stringsetloc("tail. ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_92_0"));
        array_push(texts, stringsetloc("pointed ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_93_0"));
        array_push(texts, stringsetloc("the ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_94_0"));
        array_push(texts, stringsetloc("children ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_95_0"));
        array_push(texts, stringsetloc("would ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_96_0"));
        array_push(texts, stringsetloc("grow,", "obj_dw_churchb_bookshelf_slash_Step_0_gml_97_0"));
        array_push(texts, stringsetloc("the ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_98_0"));
        array_push(texts, stringsetloc("Lost ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_99_0"));
        array_push(texts, stringsetloc("forest ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_100_0"));
        array_push(texts, stringsetloc("followed ", "obj_dw_churchb_bookshelf_slash_Step_0_gml_101_0"));
        //
        if (global.lang == "ja")
        {
            texts = [];
            array_push(texts, stringsetloc("は　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_90_0"));
            array_push(texts, stringsetloc("子ども　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_91_0"));
            array_push(texts, stringsetloc("を　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_92_0"));
            array_push(texts, stringsetloc("森林　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_93_0"));
            array_push(texts, stringsetloc("しっぽ　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_94_0"));
            array_push(texts, stringsetloc("の　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_95_0"));
            array_push(texts, stringsetloc("の　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_96_0"));
            array_push(texts, stringsetloc("場所　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_97_0"));
            array_push(texts, stringsetloc("たどった。　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_98_0"));
            array_push(texts, stringsetloc("迷子　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_99_0"));
            array_push(texts, stringsetloc("とがった　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_100_0"));
            array_push(texts, stringsetloc("で　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_101_0"));
            array_push(texts, stringsetloc("育つ　", "obj_dw_churchb_bookshelf_slash_Step_0_gml_102_0"));
        }
        
        var textshuffle = scr_array_shuffle(texts);
        var str = "";
        var newline = 0;
        
        for (var i = 0; i < array_length(textshuffle); i++)
        {
            if (global.lang == "ja")
            {
                if (newline == 0)
                {
                    if (string_length(str) > 13)
                    {
                        newline = 1;
                        str += "\n　 ";
                    }
                }
                
                if (newline == 1)
                {
                    if (string_length(str) > 26)
                    {
                        newline = 2;
                        str += "\n　 ";
                    }
                }
            }
            
            str += textshuffle[i];
        }
        
        scr_speaker("no_name");
        msgsetloc(0, "* I heard something in between. Something in between./", "obj_dw_churchb_bookshelf_slash_Step_0_gml_127_0");
        msgnextloc("* It was mixed up./", "obj_dw_churchb_bookshelf_slash_Step_0_gml_128_0");
        
        if (global.lang == "ja")
            msgnext("＊ " + str + "/");
        else
            msgnext("* " + str + "/");
        
        msgnextloc("* The poor children!/%", "obj_dw_churchb_bookshelf_slash_Step_0_gml_130_0");
        d_make();
        myinteract = 999;
        talked++;
    }
    
    if (myinteract > 3 && d_ex())
    {
        var trig = 0;
        
        if (!i_ex(obj_writer))
            trig = 1;
        
        with (obj_writer)
        {
            if (halt)
                trig = 1;
        }
        
        if (!trig)
            marker.image_index += 0.25;
    }
    
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}

var act = scr_trigcheck("propact");
roomglow.active = act;
prop.active = act;
