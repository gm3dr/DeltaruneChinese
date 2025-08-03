function scr_weaponinfo(arg0)
{
    weaponchar4temp = 0;
    weaponnametemp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_2_0");
    
    switch (arg0)
    {
        case 0:
            weaponnametemp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_11_0");
            weapondesctemp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_12_0");
            wmessage2temp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_13_0");
            wmessage3temp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_14_0");
            wmessage4temp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_15_0");
            weaponattemp = 0;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 0;
            weaponstyletemp = " ";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponabilitytemp = " ";
            weaponabilityicontemp = 0;
            weaponicontemp = 0;
            value = 0;
            break;
        
        case 1:
            weaponnametemp = stringsetloc("Wood Blade", "scr_weaponinfo_slash_scr_weaponinfo_gml_33_0");
            weapondesctemp = stringsetloc("A wooden practice blade with a carbon-#reinforced core.", "scr_weaponinfo_slash_scr_weaponinfo_gml_34_0");
            wmessage2temp = stringsetloc("What's this!? A CHOPSTICK?", "scr_weaponinfo_slash_scr_weaponinfo_gml_35_0");
            
            if (global.plot < 30 && global.chapter == 1)
                wmessage2tempt = stringsetloc("... You have a SWORD!?", "scr_weaponinfo_slash_scr_weaponinfo_gml_39_0");
            
            wmessage3temp = stringsetloc("That's yours, Kris...", "scr_weaponinfo_slash_scr_weaponinfo_gml_40_0");
            wmessage4temp = stringsetloc("(It has bite marks...)", "scr_weaponinfo_slash_scr_weaponinfo_gml_42_0");
            weaponattemp = 0;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 60;
            break;
        
        case 2:
            weaponnametemp = stringsetloc("Mane Ax", "scr_weaponinfo_slash_scr_weaponinfo_gml_59_0");
            weapondesctemp = stringsetloc("Beginner's ax forged from the#mane of a dragon whelp.", "scr_weaponinfo_slash_scr_weaponinfo_gml_60_0");
            wmessage2temp = stringsetloc("I'm too GOOD for that.", "scr_weaponinfo_slash_scr_weaponinfo_gml_61_0");
            wmessage3temp = stringsetloc("Ummm... it's a bit big.", "scr_weaponinfo_slash_scr_weaponinfo_gml_62_0");
            wmessage4temp = stringsetloc("It... smells nice...", "scr_weaponinfo_slash_scr_weaponinfo_gml_64_0");
            weaponattemp = 0;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponicontemp = 2;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 80;
            break;
        
        case 3:
            weaponnametemp = stringsetloc("Red Scarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_81_0");
            weapondesctemp = stringsetloc("A basic scarf made of lightly#magical fiber.", "scr_weaponinfo_slash_scr_weaponinfo_gml_82_0");
            wmessage2temp = stringsetloc("No. Just... no.", "scr_weaponinfo_slash_scr_weaponinfo_gml_83_0");
            wmessage3temp = stringsetloc("Comfy! Touch it, Kris!", "scr_weaponinfo_slash_scr_weaponinfo_gml_84_0");
            wmessage4temp = stringsetloc("Huh? No, I'm not cold.", "scr_weaponinfo_slash_scr_weaponinfo_gml_86_0");
            weaponattemp = 0;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponicontemp = 3;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 100;
            break;
        
        case 4:
            weaponnametemp = stringsetloc("EverybodyWeapon", "scr_weaponinfo_slash_scr_weaponinfo_gml_105_0");
            weapondesctemp = stringsetloc("It felt right for everyone.", "scr_weaponinfo_slash_scr_weaponinfo_gml_106_0");
            wmessage2temp = stringsetloc("Uhhh... Ok.", "scr_weaponinfo_slash_scr_weaponinfo_gml_107_0");
            wmessage3temp = stringsetloc("A perfect fit!", "scr_weaponinfo_slash_scr_weaponinfo_gml_108_0");
            wmessage4temp = stringsetloc("Wh... what is this?", "scr_weaponinfo_slash_scr_weaponinfo_gml_109_0");
            weaponattemp = 12;
            weapondftemp = 6;
            weaponmagtemp = 8;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 1;
            weaponchar3temp = 1;
            weaponchar4temp = 1;
            weaponicontemp = 0;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 150;
            break;
        
        case 5:
            weaponnametemp = stringsetloc("Spookysword", "scr_weaponinfo_slash_scr_weaponinfo_gml_127_0");
            weapondesctemp = stringsetloc("A black-and-orange sword with a bat hilt.", "scr_weaponinfo_slash_scr_weaponinfo_gml_128_0");
            wmessage2temp = stringsetloc("Ugh, it's too small!", "scr_weaponinfo_slash_scr_weaponinfo_gml_129_0");
            wmessage3temp = stringsetloc("Oh, it's too scary!", "scr_weaponinfo_slash_scr_weaponinfo_gml_130_0");
            wmessage4temp = stringsetloc("(It's kinda cool...)", "scr_weaponinfo_slash_scr_weaponinfo_gml_132_0");
            weaponattemp = 2;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 7;
            weaponabilitytemp = stringsetloc("Spookiness UP", "scr_weaponinfo_slash_scr_weaponinfo_gml_145_0");
            value = 200;
            break;
        
        case 6:
            weaponnametemp = stringsetloc("Brave Ax", "scr_weaponinfo_slash_scr_weaponinfo_gml_149_0");
            weapondesctemp = stringsetloc("A glossy ax from a block warrior.#Suitable for heroes.", "scr_weaponinfo_slash_scr_weaponinfo_gml_150_0");
            wmessage2temp = stringsetloc("Well, if I have to.", "scr_weaponinfo_slash_scr_weaponinfo_gml_151_0");
            wmessage3temp = stringsetloc("It's a bit too heavy...", "scr_weaponinfo_slash_scr_weaponinfo_gml_152_0");
            wmessage4temp = stringsetloc("(W-wow, what presence...)", "scr_weaponinfo_slash_scr_weaponinfo_gml_154_0");
            weaponattemp = 2;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 1;
            weaponchar3temp = 0;
            weaponicontemp = 2;
            weaponabilityicontemp = 7;
            weaponabilitytemp = stringsetloc("Guts Up", "scr_weaponinfo_slash_scr_weaponinfo_gml_167_0");
            value = 150;
            break;
        
        case 7:
            weaponnametemp = stringsetloc("Devilsknife", "scr_weaponinfo_slash_scr_weaponinfo_gml_171_0");
            weapondesctemp = stringsetloc("Skull-emblazoned scythe-ax.#Reduces Rudebuster's cost by 10", "scr_weaponinfo_slash_scr_weaponinfo_gml_172_0");
            wmessage2temp = stringsetloc("Let the games begin!", "scr_weaponinfo_slash_scr_weaponinfo_gml_173_0");
            wmessage3temp = stringsetloc("It's too, um, evil.", "scr_weaponinfo_slash_scr_weaponinfo_gml_174_0");
            wmessage4temp = stringsetloc("...? It smiled at me?", "scr_weaponinfo_slash_scr_weaponinfo_gml_176_0");
            weaponattemp = 5;
            weapondftemp = 0;
            weaponmagtemp = 4;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 1;
            weaponchar3temp = 0;
            weaponicontemp = 2;
            weaponabilityicontemp = 6;
            weaponabilitytemp = stringsetloc("Buster TP DOWN", "scr_weaponinfo_slash_scr_weaponinfo_gml_189_0");
            value = 0;
            break;
        
        case 8:
            weaponnametemp = stringsetloc("Trefoil", "scr_weaponinfo_slash_scr_weaponinfo_gml_194_0");
            weapondesctemp = stringsetloc("Mossy rapier with a clover emblem.#Increases $ found by 5%.", "scr_weaponinfo_slash_scr_weaponinfo_gml_195_0");
            wmessage2temp = stringsetloc("That tacky thing? No!", "scr_weaponinfo_slash_scr_weaponinfo_gml_196_0");
            wmessage3temp = stringsetloc("Not my shade of green...", "scr_weaponinfo_slash_scr_weaponinfo_gml_197_0");
            wmessage4temp = stringsetloc("Okay! ...? What do you mean, unused!?", "scr_weaponinfo_slash_scr_weaponinfo_gml_198_0");
            weaponattemp = 4;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 7;
            weaponabilitytemp = stringsetloc("Money Earned UP", "scr_weaponinfo_slash_scr_weaponinfo_gml_211_0");
            value = 250;
            break;
        
        case 9:
            weaponnametemp = stringsetloc("Ragger", "scr_weaponinfo_slash_scr_weaponinfo_gml_215_0");
            weapondesctemp = stringsetloc("A rugged scarf that cuts enemies like a dagger.", "scr_weaponinfo_slash_scr_weaponinfo_gml_216_0");
            wmessage2temp = stringsetloc("Ow! That can't be comfy!", "scr_weaponinfo_slash_scr_weaponinfo_gml_217_0");
            wmessage3temp = stringsetloc("Feels prickly... Nice!", "scr_weaponinfo_slash_scr_weaponinfo_gml_218_0");
            wmessage4temp = stringsetloc("Ouch! ... kind of nice", "scr_weaponinfo_slash_scr_weaponinfo_gml_220_0");
            weaponattemp = 2;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponicontemp = 3;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 200;
            break;
        
        case 10:
            weaponnametemp = stringsetloc("DaintyScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_237_0");
            weapondesctemp = stringsetloc("Delicate scarf that increases healing#power but has no attack.", "scr_weaponinfo_slash_scr_weaponinfo_gml_238_0");
            wmessage2temp = stringsetloc("IT'S MADE OF DOILIES!", "scr_weaponinfo_slash_scr_weaponinfo_gml_239_0");
            wmessage3temp = stringsetloc("I'll protect everyone!", "scr_weaponinfo_slash_scr_weaponinfo_gml_240_0");
            wmessage4temp = stringsetloc("S-stop covering me with it!", "scr_weaponinfo_slash_scr_weaponinfo_gml_242_0");
            weaponattemp = 0;
            weapondftemp = 0;
            weaponmagtemp = 2;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponicontemp = 3;
            weaponabilityicontemp = 7;
            weaponabilitytemp = stringsetloc("Fluffiness UP", "scr_weaponinfo_slash_scr_weaponinfo_gml_255_0");
            value = 200;
            break;
        
        case 11:
            weaponnametemp = stringsetloc("TwistedSwd", "scr_weaponinfo_slash_scr_weaponinfo_gml_260_0");
            weapondesctemp = stringsetloc("A strange blade", "scr_weaponinfo_slash_scr_weaponinfo_gml_261_0");
            wmessage2temp = stringsetloc("... uhh, looks bad.", "scr_weaponinfo_slash_scr_weaponinfo_gml_262_0");
            wmessage3temp = stringsetloc("It's like a spiral.", "scr_weaponinfo_slash_scr_weaponinfo_gml_263_0");
            wmessage4temp = stringsetloc("It's... kind of scary...", "scr_weaponinfo_slash_scr_weaponinfo_gml_264_0");
            weaponattemp = 16;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 6;
            weaponabilitytemp = stringsetloc("Trance", "scr_weaponinfo_slash_scr_weaponinfo_gml_277_0");
            value = 1;
            break;
        
        case 12:
            weaponnametemp = stringsetloc("SnowRing", "scr_weaponinfo_slash_scr_weaponinfo_gml_282_0");
            weapondesctemp = stringsetloc("A ring with the emblem of the#snowflake", "scr_weaponinfo_slash_scr_weaponinfo_gml_283_0");
            wmessage2temp = stringsetloc("Smells like Noelle", "scr_weaponinfo_slash_scr_weaponinfo_gml_284_0");
            wmessage3temp = stringsetloc("Are you... proposing?", "scr_weaponinfo_slash_scr_weaponinfo_gml_285_0");
            wmessage4temp = stringsetloc("(Thank goodness...)", "scr_weaponinfo_slash_scr_weaponinfo_gml_286_0");
            weaponattemp = 0;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 1;
            weaponicontemp = 14;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 100;
            break;
        
        case 13:
            weaponnametemp = stringsetloc("ThornRing", "scr_weaponinfo_slash_scr_weaponinfo_gml_305_0");
            weapondesctemp = stringsetloc("Wearer takes damage from pain#Reduces the TP cost of ice spells", "scr_weaponinfo_slash_scr_weaponinfo_gml_306_0");
            wmessage2temp = stringsetloc("A torture device?", "scr_weaponinfo_slash_scr_weaponinfo_gml_307_0");
            wmessage3temp = stringsetloc("...", "scr_weaponinfo_slash_scr_weaponinfo_gml_308_0");
            wmessage4temp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_309_0");
            weaponattemp = 14;
            weapondftemp = 0;
            weaponmagtemp = 12;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 1;
            weaponicontemp = 14;
            weaponabilityicontemp = 14;
            weaponabilitytemp = stringsetloc("Trance", "scr_weaponinfo_slash_scr_weaponinfo_gml_323_0");
            value = 0;
            break;
        
        case 14:
            weaponnametemp = stringsetloc("BounceBlade", "scr_weaponinfo_slash_scr_weaponinfo_gml_328_0");
            weapondesctemp = stringsetloc("A pink saber with a rubber blade.#Weak, but increases defence.", "scr_weaponinfo_slash_scr_weaponinfo_gml_329_0");
            wmessage2temp = stringsetloc("What is this, rubber?", "scr_weaponinfo_slash_scr_weaponinfo_gml_330_0");
            wmessage3temp = stringsetloc("Soft and squishy!", "scr_weaponinfo_slash_scr_weaponinfo_gml_331_0");
            wmessage4temp = stringsetloc("S-stop thwacking me!", "scr_weaponinfo_slash_scr_weaponinfo_gml_332_0");
            weaponattemp = 2;
            weapondftemp = 1;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 7;
            weaponabilitytemp = stringsetloc("Defense", "scr_weaponinfo_slash_scr_weaponinfo_gml_346_0");
            value = 250;
            break;
        
        case 15:
            weaponnametemp = stringsetloc("CheerScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_351_0");
            weapondesctemp = stringsetloc("A scarf with colorful you-can-do-it#imagery. Gains more TP from criticals.", "scr_weaponinfo_slash_scr_weaponinfo_gml_352_0");
            wmessage2temp = stringsetloc("Smiley faces? Ecch.", "scr_weaponinfo_slash_scr_weaponinfo_gml_353_0");
            wmessage3temp = stringsetloc("You can do it!", "scr_weaponinfo_slash_scr_weaponinfo_gml_354_0");
            wmessage4temp = stringsetloc("Now THIS is a tacky scarf! Faha!", "scr_weaponinfo_slash_scr_weaponinfo_gml_355_0");
            weaponattemp = 1;
            weapondftemp = 0;
            weaponmagtemp = 2;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponchar4temp = 0;
            weaponicontemp = 3;
            weaponabilityicontemp = 10;
            weaponabilitytemp = stringsetloc("Smiley", "scr_weaponinfo_slash_scr_weaponinfo_gml_369_0");
            value = 250;
            break;
        
        case 16:
            weaponnametemp = stringsetloc("MechaSaber", "scr_weaponinfo_slash_scr_weaponinfo_gml_374_0");
            weapondesctemp = stringsetloc("The blade extends when you press the hilt.#CHA-CHK!", "scr_weaponinfo_slash_scr_weaponinfo_gml_375_0");
            wmessage2temp = stringsetloc("*chk chk chk chk* Nah.", "scr_weaponinfo_slash_scr_weaponinfo_gml_376_0");
            wmessage3temp = stringsetloc("You'd look cool holding it, Kris!", "scr_weaponinfo_slash_scr_weaponinfo_gml_377_0");
            wmessage4temp = stringsetloc("*chk* A-AHH! Scared myself...", "scr_weaponinfo_slash_scr_weaponinfo_gml_378_0");
            weaponattemp = 4;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 13;
            weaponabilitytemp = stringsetloc("Annoying", "scr_weaponinfo_slash_scr_weaponinfo_gml_392_0");
            value = 250;
            break;
        
        case 17:
            weaponnametemp = stringsetloc("AutoAxe", "scr_weaponinfo_slash_scr_weaponinfo_gml_397_0");
            weapondesctemp = stringsetloc("Make sure to charge it by#plugging it into the wall.", "scr_weaponinfo_slash_scr_weaponinfo_gml_398_0");
            wmessage2temp = stringsetloc("*chainsaw noises* Hahaha!!", "scr_weaponinfo_slash_scr_weaponinfo_gml_399_0");
            wmessage3temp = stringsetloc("(Is this a good idea?)", "scr_weaponinfo_slash_scr_weaponinfo_gml_400_0");
            wmessage4temp = stringsetloc("*zrrt* A-AHH! Scared myself...", "scr_weaponinfo_slash_scr_weaponinfo_gml_401_0");
            weaponattemp = 4;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 1;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 2;
            weaponabilityicontemp = 13;
            weaponabilitytemp = stringsetloc("BadIdea", "scr_weaponinfo_slash_scr_weaponinfo_gml_415_0");
            value = 250;
            break;
        
        case 18:
            weaponnametemp = stringsetloc("FiberScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_420_0");
            weapondesctemp = stringsetloc("A scarf made of soft microfiber.#Balances attack and magic.", "scr_weaponinfo_slash_scr_weaponinfo_gml_421_0");
            wmessage2temp = stringsetloc("(Soft...)", "scr_weaponinfo_slash_scr_weaponinfo_gml_422_0");
            wmessage3temp = stringsetloc("Oh! My fur's staticy!", "scr_weaponinfo_slash_scr_weaponinfo_gml_423_0");
            wmessage4temp = stringsetloc("Sure, I'll... huh? It's a weapon?", "scr_weaponinfo_slash_scr_weaponinfo_gml_424_0");
            weaponattemp = 2;
            weapondftemp = 0;
            weaponmagtemp = 2;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponchar4temp = 0;
            weaponicontemp = 3;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 250;
            break;
        
        case 19:
            weaponnametemp = stringsetloc("Ragger2", "scr_weaponinfo_slash_scr_weaponinfo_gml_443_0");
            weapondesctemp = stringsetloc("A sharp and scratchy scarf.#Worse healing, better attack.", "scr_weaponinfo_slash_scr_weaponinfo_gml_444_0");
            wmessage2temp = stringsetloc("This is Ralsei's deal.", "scr_weaponinfo_slash_scr_weaponinfo_gml_445_0");
            wmessage3temp = stringsetloc("I'm a prickly prince!", "scr_weaponinfo_slash_scr_weaponinfo_gml_446_0");
            wmessage4temp = stringsetloc("(It's like Santa's beard?)", "scr_weaponinfo_slash_scr_weaponinfo_gml_447_0");
            weaponattemp = 5;
            weapondftemp = 0;
            weaponmagtemp = -1;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponchar4temp = 0;
            weaponicontemp = 3;
            weaponabilityicontemp = 7;
            weaponabilitytemp = stringsetloc("Prickly", "scr_weaponinfo_slash_scr_weaponinfo_gml_461_0");
            value = 250;
            break;
        
        case 20:
            weaponnametemp = stringsetloc("BrokenSwd", "scr_weaponinfo_slash_scr_weaponinfo_gml_467_0");
            weapondesctemp = stringsetloc("A rejected sword cut into 2 pieces.#Not even you can equip this...", "scr_weaponinfo_slash_scr_weaponinfo_gml_468_0");
            wmessage2temp = stringsetloc("... this is trash.", "scr_weaponinfo_slash_scr_weaponinfo_gml_469_0");
            wmessage3temp = stringsetloc("Should we fix this...?", "scr_weaponinfo_slash_scr_weaponinfo_gml_470_0");
            wmessage4temp = stringsetloc("(Wh... why give this to me?)", "scr_weaponinfo_slash_scr_weaponinfo_gml_471_0");
            weaponattemp = 0;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 6;
            weaponabilitytemp = stringsetloc("Failure", "scr_weaponinfo_slash_scr_weaponinfo_gml_485_0");
            value = 2;
            break;
        
        case 21:
            weaponnametemp = stringsetloc("PuppetScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_490_0");
            weapondesctemp = stringsetloc("A scarf made of strange strings.#For those that abandon healing.", "scr_weaponinfo_slash_scr_weaponinfo_gml_491_0");
            wmessage2temp = stringsetloc("No way, that's creepy.", "scr_weaponinfo_slash_scr_weaponinfo_gml_492_0");
            wmessage3temp = stringsetloc("If I have to fight...", "scr_weaponinfo_slash_scr_weaponinfo_gml_493_0");
            wmessage4temp = stringsetloc("(Feels like guitar strings...)", "scr_weaponinfo_slash_scr_weaponinfo_gml_494_0");
            weaponattemp = 10;
            weapondftemp = 0;
            weaponmagtemp = -6;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponchar4temp = 0;
            weaponicontemp = 3;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 0;
            break;
        
        case 22:
            weaponnametemp = stringsetloc("FreezeRing", "scr_weaponinfo_slash_scr_weaponinfo_gml_513_0");
            weapondesctemp = stringsetloc("A ring with a snowglobe on it.#... is that someone inside?", "scr_weaponinfo_slash_scr_weaponinfo_gml_514_0");
            wmessage2temp = stringsetloc("Heh, you steal this? Heh.", "scr_weaponinfo_slash_scr_weaponinfo_gml_515_0");
            wmessage3temp = stringsetloc("It's beautiful...", "scr_weaponinfo_slash_scr_weaponinfo_gml_516_0");
            wmessage4temp = stringsetloc("...", "scr_weaponinfo_slash_scr_weaponinfo_gml_517_0");
            weaponattemp = 4;
            weapondftemp = 0;
            weaponmagtemp = 4;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 1;
            weaponicontemp = 14;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 1000;
            break;
        
        case 23:
            weaponnametemp = stringsetloc("Saber10", "scr_weaponinfo_slash_scr_weaponinfo_gml_537_0");
            weapondesctemp = stringsetloc("A saber made of 10 cactus needles.#Fortunately, can deal more than 10 damage.", "scr_weaponinfo_slash_scr_weaponinfo_gml_538_0");
            wmessage2temp = stringsetloc("Nah, I'd snap it.", "scr_weaponinfo_slash_scr_weaponinfo_gml_539_0");
            wmessage3temp = stringsetloc("You want to... pierce my ears...?", "scr_weaponinfo_slash_scr_weaponinfo_gml_540_0");
            wmessage4temp = stringsetloc("(I'm not against using it, but...)", "scr_weaponinfo_slash_scr_weaponinfo_gml_541_0");
            weaponattemp = 6;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 710;
            break;
        
        case 24:
            weaponnametemp = stringsetloc("ToxicAxe", "scr_weaponinfo_slash_scr_weaponinfo_gml_560_0");
            weapondesctemp = stringsetloc("An axe used to clear wastelands#in a fetid swamp. Not poison, but gross.", "scr_weaponinfo_slash_scr_weaponinfo_gml_561_0");
            wmessage2temp = stringsetloc("Eat dirt, losers.", "scr_weaponinfo_slash_scr_weaponinfo_gml_562_0");
            wmessage3temp = stringsetloc("Could I wash it off first?", "scr_weaponinfo_slash_scr_weaponinfo_gml_563_0");
            wmessage4temp = stringsetloc("N-no way! Susie wouldn't use that!", "scr_weaponinfo_slash_scr_weaponinfo_gml_564_0");
            weaponattemp = 6;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 1;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 2;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 700;
            break;
        
        case 25:
            weaponnametemp = stringsetloc("FlexScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_583_0");
            weapondesctemp = stringsetloc("A scarf that is warm and fuzzy, but with#a metal core that lets it keep its shape.", "scr_weaponinfo_slash_scr_weaponinfo_gml_584_0");
            wmessage2temp = stringsetloc("Looks like a giant caterpillar.  ", "scr_weaponinfo_slash_scr_weaponinfo_gml_585_0");
            wmessage3temp = stringsetloc("So pliable, like me!", "scr_weaponinfo_slash_scr_weaponinfo_gml_586_0");
            wmessage4temp = stringsetloc("Twist it and... it's a wreath!", "scr_weaponinfo_slash_scr_weaponinfo_gml_587_0");
            weaponattemp = 4;
            weapondftemp = 0;
            weaponmagtemp = 1;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponchar4temp = 0;
            weaponicontemp = 3;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 720;
            break;
        
        case 26:
            weaponnametemp = stringsetloc("BlackShard", "scr_weaponinfo_slash_scr_weaponinfo_gml_606_0");
            weapondesctemp = stringsetloc("A dagger-like shard of the Black Knife.#Strikes the weakness of dark-element enemies.", "scr_weaponinfo_slash_scr_weaponinfo_gml_607_0");
            wmessage2temp = stringsetloc("... how is this a weapon?", "scr_weaponinfo_slash_scr_weaponinfo_gml_608_0");
            wmessage3temp = stringsetloc("I... shouldn't use it.", "scr_weaponinfo_slash_scr_weaponinfo_gml_609_0");
            wmessage4temp = stringsetloc(" ", "scr_weaponinfo_slash_scr_weaponinfo_gml_610_0");
            weaponattemp = 16;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 1;
            weaponicontemp = 18;
            weaponabilityicontemp = 18;
            weaponabilitytemp = /*"SlayDark"*/"黑暗特攻";
            value = 0;
            break;
        
        case 50:
            weaponnametemp = stringsetloc("JingleBlade", "scr_weaponinfo_slash_scr_weaponinfo_gml_629_0");
            weapondesctemp = stringsetloc("A lance-like sword with red-and-white stripes.#Perfect for jousting.", "scr_weaponinfo_slash_scr_weaponinfo_gml_630_0");
            wmessage2temp = stringsetloc("Sleigh the bad guys.", "scr_weaponinfo_slash_scr_weaponinfo_gml_631_0");
            wmessage3temp = stringsetloc("Mmm! Minty and festive!", "scr_weaponinfo_slash_scr_weaponinfo_gml_632_0");
            wmessage4temp = stringsetloc("What is this, a barber pole?", "scr_weaponinfo_slash_scr_weaponinfo_gml_633_0");
            weaponattemp = 7;
            weapondftemp = 1;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 1;
            weaponicontemp = 1;
            weaponabilityicontemp = 10;
            weaponabilitytemp = stringsetloc("Festive", "scr_weaponinfo_slash_scr_weaponinfo_gml_647_0");
            value = 1234;
            break;
        
        case 51:
            weaponnametemp = stringsetloc("ScarfMark", "scr_weaponinfo_slash_scr_weaponinfo_gml_652_0");
            weapondesctemp = stringsetloc("A thin scarf with a deep sheen. Holy writing has#been pressed into it, imbuing it with magic.", "scr_weaponinfo_slash_scr_weaponinfo_gml_653_0");
            wmessage2temp = stringsetloc("Heheh...", "scr_weaponinfo_slash_scr_weaponinfo_gml_654_0");
            wmessage3temp = stringsetloc("I'll keep my place.", "scr_weaponinfo_slash_scr_weaponinfo_gml_655_0");
            wmessage4temp = stringsetloc("Look, ribbon dancing!", "scr_weaponinfo_slash_scr_weaponinfo_gml_656_0");
            weaponattemp = 4;
            weapondftemp = 1;
            weaponmagtemp = 1;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 0;
            weaponchar3temp = 1;
            weaponchar4temp = 0;
            weaponicontemp = 3;
            weaponabilityicontemp = 0;
            weaponabilitytemp = " ";
            value = 900;
            break;
        
        case 52:
            weaponnametemp = stringsetloc("JusticeAxe", "scr_weaponinfo_slash_scr_weaponinfo_gml_675_0");
            weapondesctemp = stringsetloc("It has no special powers. However, in order to#attain this item, you became much stronger!", "scr_weaponinfo_slash_scr_weaponinfo_gml_676_0");
            wmessage2temp = stringsetloc("Watch this, old man!", "scr_weaponinfo_slash_scr_weaponinfo_gml_677_0");
            wmessage3temp = stringsetloc("... isn't Susie amazing?", "scr_weaponinfo_slash_scr_weaponinfo_gml_678_0");
            wmessage4temp = stringsetloc("... Susie beat up an old man!?", "scr_weaponinfo_slash_scr_weaponinfo_gml_679_0");
            weaponattemp = 12;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 1;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 2;
            weaponabilityicontemp = 5;
            weaponabilitytemp = "???";
            value = 0;
            break;
        
        case 53:
            weaponnametemp = stringsetloc("Winglade", "scr_weaponinfo_slash_scr_weaponinfo_gml_698_0");
            weapondesctemp = stringsetloc("A majestic sword with a white feathered hilt.#Slightly increases money won.", "scr_weaponinfo_slash_scr_weaponinfo_gml_699_0");
            wmessage2temp = stringsetloc("Don't make me sneeze!", "scr_weaponinfo_slash_scr_weaponinfo_gml_700_0");
            wmessage3temp = stringsetloc("Th-that tickles!", "scr_weaponinfo_slash_scr_weaponinfo_gml_701_0");
            wmessage4temp = stringsetloc("... whose feather is this?", "scr_weaponinfo_slash_scr_weaponinfo_gml_702_0");
            weaponattemp = 8;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 1;
            weaponchar2temp = 0;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 1;
            weaponabilityicontemp = 7;
            weaponabilitytemp = stringsetloc("$ +5%", "scr_weaponinfo_slash_scr_weaponinfo_gml_716_0");
            value = 999;
            break;
        
        case 54:
            weaponnametemp = stringsetloc("AbsorbAx", "scr_weaponinfo_slash_scr_weaponinfo_gml_721_0");
            weapondesctemp = stringsetloc("A long, curved axe with an indent.#Scoop up HP when you attack.", "scr_weaponinfo_slash_scr_weaponinfo_gml_722_0");
            wmessage2temp = stringsetloc("Scoopin' time.", "scr_weaponinfo_slash_scr_weaponinfo_gml_723_0");
            wmessage3temp = stringsetloc("Don't scoop me!", "scr_weaponinfo_slash_scr_weaponinfo_gml_724_0");
            wmessage4temp = stringsetloc("That red... is that blood?", "scr_weaponinfo_slash_scr_weaponinfo_gml_725_0");
            weaponattemp = 8;
            weapondftemp = 0;
            weaponmagtemp = 0;
            weaponboltstemp = 1;
            weaponstyletemp = "?";
            weapongrazeamttemp = 0;
            weapongrazesizetemp = 0;
            weaponchar1temp = 0;
            weaponchar2temp = 1;
            weaponchar3temp = 0;
            weaponchar4temp = 0;
            weaponicontemp = 2;
            weaponabilityicontemp = 13;
            weaponabilitytemp = stringsetloc("Vampire", "scr_weaponinfo_slash_scr_weaponinfo_gml_739_0");
            value = 1234;
            break;
    }
}
