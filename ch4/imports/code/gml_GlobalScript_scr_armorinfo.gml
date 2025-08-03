function scr_armorinfo(arg0)
{
    armorchar4temp = 1;
    armornametemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_2_0");
    armorelementtemp = 0;
    armorelementamounttemp = 0;
    
    switch (arg0)
    {
        case 0:
            armornametemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_7_0");
            armordesctemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_8_0_b");
            amessage2temp = stringsetloc("Hey, hands off!", "scr_armorinfo_slash_scr_armorinfo_gml_8_0");
            amessage3temp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_10_0");
            amessage4temp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_11_0");
            armorattemp = 0;
            armordftemp = 0;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_22_0");
            armorabilityicontemp = 0;
            armoricontemp = 0;
            value = 0;
            break;
        
        case 1:
            armornametemp = stringsetloc("Amber Card", "scr_armorinfo_slash_scr_armorinfo_gml_28_0");
            armordesctemp = stringsetloc("A thin square charm that sticks#to you, increasing defense.", "scr_armorinfo_slash_scr_armorinfo_gml_29_0");
            amessage2temp = stringsetloc("... better than nothing.", "scr_armorinfo_slash_scr_armorinfo_gml_30_0");
            amessage3temp = stringsetloc("It's sticky, huh, Kris...", "scr_armorinfo_slash_scr_armorinfo_gml_31_0");
            amessage4temp = stringsetloc("It's like a name-tag!", "scr_armorinfo_slash_scr_armorinfo_gml_33_0");
            armorattemp = 0;
            armordftemp = 1;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_43_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 100;
            break;
        
        case 2:
            armornametemp = stringsetloc("Dice Brace", "scr_armorinfo_slash_scr_armorinfo_gml_49_0");
            armordesctemp = stringsetloc("A bracelet made out of various#symbol-inscribed cubes.", "scr_armorinfo_slash_scr_armorinfo_gml_50_0");
            amessage2temp = stringsetloc("... okay.", "scr_armorinfo_slash_scr_armorinfo_gml_51_0");
            amessage3temp = stringsetloc("It says \"Friendship!\"", "scr_armorinfo_slash_scr_armorinfo_gml_52_0");
            amessage4temp = stringsetloc("Hey, y-you jumbled it...", "scr_armorinfo_slash_scr_armorinfo_gml_54_0");
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_64_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 150;
            break;
        
        case 3:
            armornametemp = stringsetloc("Pink Ribbon", "scr_armorinfo_slash_scr_armorinfo_gml_70_0");
            armordesctemp = stringsetloc("A cute hair ribbon that increases#the range bullets increase tension.", "scr_armorinfo_slash_scr_armorinfo_gml_71_0");
            amessage2temp = stringsetloc("Nope. Not in 1st grade anymore.", "scr_armorinfo_slash_scr_armorinfo_gml_72_0");
            amessage3temp = stringsetloc("Um... D-do I look cute...?", "scr_armorinfo_slash_scr_armorinfo_gml_73_0");
            amessage4temp = stringsetloc("... feels familiar.", "scr_armorinfo_slash_scr_armorinfo_gml_75_0");
            
            if (global.chapter == 2)
            {
                amessage2temp = stringsetloc("I said NO! C'mon already!", "scr_armorinfo_slash_scr_armorinfo_gml_78_0");
                amessage3temp = stringsetloc("It's nice dressing up...", "scr_armorinfo_slash_scr_armorinfo_gml_79_0");
            }
            
            armorattemp = 0;
            armordftemp = 1;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 20;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("GrazeArea", "scr_armorinfo_slash_scr_armorinfo_gml_91_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 100;
            break;
        
        case 4:
            armornametemp = stringsetloc("White Ribbon", "scr_armorinfo_slash_scr_armorinfo_gml_98_0");
            armordesctemp = stringsetloc("A crinkly hair ribbon that slightly#increases your defense.", "scr_armorinfo_slash_scr_armorinfo_gml_99_0");
            amessage2temp = stringsetloc("Nope. Not in 1st grade anymore.", "scr_armorinfo_slash_scr_armorinfo_gml_100_0");
            amessage3temp = stringsetloc("Um... D-do I look cute...?", "scr_armorinfo_slash_scr_armorinfo_gml_101_0");
            
            if (global.chapter == 2)
            {
                amessage2temp = stringsetloc("I said NO! C'mon already!", "scr_armorinfo_slash_scr_armorinfo_gml_105_0");
                amessage3temp = stringsetloc("It's nice being dressed up...", "scr_armorinfo_slash_scr_armorinfo_gml_106_0");
            }
            
            amessage4temp = stringsetloc("... feels familiar.", "scr_armorinfo_slash_scr_armorinfo_gml_108_0");
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc("Cuteness", "scr_armorinfo_slash_scr_armorinfo_gml_118_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 90;
            break;
        
        case 5:
            armornametemp = stringsetloc("IronShackle", "scr_armorinfo_slash_scr_armorinfo_gml_125_0");
            armordesctemp = stringsetloc("Shackle that ironically increases#your attack and defense.", "scr_armorinfo_slash_scr_armorinfo_gml_126_0");
            amessage2temp = stringsetloc("(Damn, it's actually cool...)", "scr_armorinfo_slash_scr_armorinfo_gml_127_0");
            amessage3temp = stringsetloc("*jingle jangle* Haha!", "scr_armorinfo_slash_scr_armorinfo_gml_128_0");
            amessage4temp = stringsetloc("I'm the ghost of holidays past!", "scr_armorinfo_slash_scr_armorinfo_gml_130_0");
            armorattemp = 1;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_140_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 150;
            break;
        
        case 6:
            armornametemp = stringsetloc("MouseToken", "scr_armorinfo_slash_scr_armorinfo_gml_146_0");
            armordesctemp = stringsetloc("A golden coin with a once-powerful mousewizard engraved on it.", "scr_armorinfo_slash_scr_armorinfo_gml_147_0");
            amessage2temp = stringsetloc("This guy's... familiar?", "scr_armorinfo_slash_scr_armorinfo_gml_148_0");
            amessage3temp = stringsetloc("Chu! Healing power UP!", "scr_armorinfo_slash_scr_armorinfo_gml_149_0");
            amessage4temp = stringsetloc("... from the family entertainment center?", "scr_armorinfo_slash_scr_armorinfo_gml_151_0");
            armorattemp = 0;
            armordftemp = 0;
            armormagtemp = 2;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_161_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 120;
            armorelementtemp = 7;
            armorelementamounttemp = 0.5;
            break;
        
        case 7:
            armornametemp = stringsetloc("Jevilstail", "scr_armorinfo_slash_scr_armorinfo_gml_167_0");
            armordesctemp = stringsetloc("A J-shaped tail that gives you devilenergy.", "scr_armorinfo_slash_scr_armorinfo_gml_168_0");
            amessage2temp = stringsetloc("Figured I'd grow one someday.", "scr_armorinfo_slash_scr_armorinfo_gml_169_0");
            amessage3temp = stringsetloc("I'm a good devil, OK?", "scr_armorinfo_slash_scr_armorinfo_gml_170_0");
            amessage4temp = stringsetloc("... (I like it...)", "scr_armorinfo_slash_scr_armorinfo_gml_172_0");
            armorattemp = 2;
            armordftemp = 2;
            armormagtemp = 2;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_182_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 0;
            break;
        
        case 8:
            armornametemp = stringsetloc("Silver Card", "scr_armorinfo_slash_scr_armorinfo_gml_189_0");
            armordesctemp = stringsetloc("A square charm that increases#dropped money by 5%", "scr_armorinfo_slash_scr_armorinfo_gml_190_0");
            amessage2temp = stringsetloc("Money, that's what I need.", "scr_armorinfo_slash_scr_armorinfo_gml_191_0");
            amessage3temp = stringsetloc("Do they take credit?", "scr_armorinfo_slash_scr_armorinfo_gml_192_0");
            amessage4temp = stringsetloc("It goes with my watch!", "scr_armorinfo_slash_scr_armorinfo_gml_193_0");
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc("$ +5%", "scr_armorinfo_slash_scr_armorinfo_gml_203_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 200;
            break;
        
        case 9:
            armornametemp = stringsetloc("TwinRibbon", "scr_armorinfo_slash_scr_armorinfo_gml_210_0");
            armordesctemp = stringsetloc("Two ribbons. You'll have to put#your hair into pigtails.", "scr_armorinfo_slash_scr_armorinfo_gml_211_0");
            amessage2temp = stringsetloc("... it gets worse and worse.", "scr_armorinfo_slash_scr_armorinfo_gml_212_0");
            amessage3temp = stringsetloc("Try around my horns!", "scr_armorinfo_slash_scr_armorinfo_gml_213_0");
            amessage4temp = stringsetloc("... nostalgic, huh.", "scr_armorinfo_slash_scr_armorinfo_gml_214_0");
            armorattemp = 0;
            armordftemp = 3;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 20;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("GrazeArea", "scr_armorinfo_slash_scr_armorinfo_gml_225_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 400;
            break;
        
        case 10:
            armornametemp = stringsetloc("GlowWrist", "scr_armorinfo_slash_scr_armorinfo_gml_232_0");
            armordesctemp = stringsetloc("A tough bracelet made of green wires,#and studded with sharp glowing lights.", "scr_armorinfo_slash_scr_armorinfo_gml_233_0");
            amessage2temp = stringsetloc("Whoops, it's tangled.", "scr_armorinfo_slash_scr_armorinfo_gml_234_0");
            amessage3temp = stringsetloc("Let me just untangle this...", "scr_armorinfo_slash_scr_armorinfo_gml_235_0");
            amessage4temp = stringsetloc("It's like holiday lights...", "scr_armorinfo_slash_scr_armorinfo_gml_236_0");
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_247_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 200;
            break;
        
        case 11:
            armornametemp = stringsetloc("ChainMail", "scr_armorinfo_slash_scr_armorinfo_gml_254_0");
            armordesctemp = stringsetloc("Chain-armor. Send it to 10 others#or it'll lose its defensive rating", "scr_armorinfo_slash_scr_armorinfo_gml_255_0");
            amessage2temp = stringsetloc("Damn, guess I'm cursed.", "scr_armorinfo_slash_scr_armorinfo_gml_256_0");
            amessage3temp = stringsetloc("A letter?... For me...?", "scr_armorinfo_slash_scr_armorinfo_gml_257_0");
            amessage4temp = stringsetloc("Armor? (It's cool...)", "scr_armorinfo_slash_scr_armorinfo_gml_258_0");
            armorattemp = 0;
            armordftemp = 3;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_269_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 300;
            break;
        
        case 12:
            armornametemp = stringsetloc("B.ShotBowtie", "scr_armorinfo_slash_scr_armorinfo_gml_276_0");
            armordesctemp = stringsetloc("A handsome bowtie. Looks like the brand#name has been cut off.", "scr_armorinfo_slash_scr_armorinfo_gml_277_0");
            amessage2temp = stringsetloc("Ugh, I look like a nerd.", "scr_armorinfo_slash_scr_armorinfo_gml_278_0");
            amessage3temp = stringsetloc("Can I have suspenders?", "scr_armorinfo_slash_scr_armorinfo_gml_279_0");
            amessage4temp = stringsetloc("... do I put it in my hair?", "scr_armorinfo_slash_scr_armorinfo_gml_280_0");
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 1;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_291_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 300;
            break;
        
        case 13:
            armornametemp = stringsetloc("SpikeBand", "scr_armorinfo_slash_scr_armorinfo_gml_298_0");
            armordesctemp = stringsetloc("A black wristband covered in spikes.#Has the tendency to get stuck to itself.", "scr_armorinfo_slash_scr_armorinfo_gml_299_0");
            amessage2temp = stringsetloc("Can't say no to spikes.", "scr_armorinfo_slash_scr_armorinfo_gml_300_0");
            amessage3temp = stringsetloc("Um, do I... look tough?", "scr_armorinfo_slash_scr_armorinfo_gml_301_0");
            amessage4temp = stringsetloc("(Maybe Susie would like this look?)", "scr_armorinfo_slash_scr_armorinfo_gml_302_0");
            armorattemp = 2;
            armordftemp = 1;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_313_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 300;
            break;
        
        case 14:
            armornametemp = stringsetloc("Silver Watch", "scr_armorinfo_slash_scr_armorinfo_gml_320_0");
            armordesctemp = stringsetloc("Grazing bullets affects#the turn length by 10% more", "scr_armorinfo_slash_scr_armorinfo_gml_321_0");
            amessage2temp = stringsetloc("It's clobbering time.", "scr_armorinfo_slash_scr_armorinfo_gml_322_0");
            amessage3temp = stringsetloc("I'm late, I'm late!", "scr_armorinfo_slash_scr_armorinfo_gml_323_0");
            amessage4temp = stringsetloc("(Th-this was mine...)", "scr_armorinfo_slash_scr_armorinfo_gml_324_0");
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("GrazeTime", "scr_armorinfo_slash_scr_armorinfo_gml_342_0_b");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 1000;
            break;
        
        case 15:
            armornametemp = stringsetloc("TensionBow", "scr_armorinfo_slash_scr_armorinfo_gml_342_0");
            armordesctemp = stringsetloc("Gain 10% more tension from#grazing bullets", "scr_armorinfo_slash_scr_armorinfo_gml_343_0");
            amessage2temp = stringset(" ");
            amessage3temp = stringset(" ");
            amessage4temp = stringset(" ");
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("TPGain", "scr_armorinfo_slash_scr_armorinfo_gml_364_0_b");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 400;
            break;
        
        case 16:
            armornametemp = stringsetloc("Mannequin", "scr_armorinfo_slash_scr_armorinfo_gml_364_0");
            armordesctemp = stringsetloc("It's a mannequin with the clothes#permanently attached. Useless", "scr_armorinfo_slash_scr_armorinfo_gml_365_0");
            amessage2temp = stringsetloc("Not even gonna ask.", "scr_armorinfo_slash_scr_armorinfo_gml_366_0");
            amessage3temp = stringsetloc("Um, the d-dress is cute...", "scr_armorinfo_slash_scr_armorinfo_gml_367_0");
            amessage4temp = stringsetloc("(Why did they spend $300 on this!?)", "scr_armorinfo_slash_scr_armorinfo_gml_368_0");
            armorattemp = 0;
            armordftemp = 0;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 0;
            armorchar4temp = 0;
            armorabilitytemp = stringsetloc("???", "scr_armorinfo_slash_scr_armorinfo_gml_386_0_b");
            armorabilityicontemp = 4;
            armoricontemp = 0;
            value = 300;
            armorelementtemp = 6;
            armorelementamounttemp = 0.35;
            break;
        
        case 17:
            armornametemp = stringsetloc("DarkGoldBand", "scr_armorinfo_slash_scr_armorinfo_gml_386_0");
            armordesctemp = stringsetloc("A black metal with a golden shine.", "scr_armorinfo_slash_scr_armorinfo_gml_387_0");
            amessage2temp = stringsetloc("Not even gonna ask.", "scr_armorinfo_slash_scr_armorinfo_gml_388_0");
            amessage3temp = stringsetloc("Um, the d-dress is cute...", "scr_armorinfo_slash_scr_armorinfo_gml_389_0");
            amessage4temp = stringsetloc("(Why did they spend $300 on this!?)", "scr_armorinfo_slash_scr_armorinfo_gml_390_0");
            armorattemp = 0;
            armordftemp = 0;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 0;
            armorchar4temp = 0;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_401_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = (global.chapter * 200) + ((global.chapter - 1) * 220);
            break;
        
        case 18:
            armornametemp = stringsetloc("SkyMantle", "scr_armorinfo_slash_scr_armorinfo_gml_408_0");
            armordesctemp = stringsetloc("A cape that shimmers fluorescently.#Protects against Elec and Holy attacks.", "scr_armorinfo_slash_scr_armorinfo_gml_409_0");
            amessage2temp = stringset(" ");
            amessage3temp = stringset(" ");
            amessage4temp = stringset(" ");
            armorattemp = 0;
            armordftemp = 1;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("Elec/Holy", "scr_armorinfo_slash_scr_armorinfo_gml_433_0_b");
            armorabilityicontemp = 4;
            armoricontemp = 4;
            value = 1;
            armorelementtemp = 1;
            armorelementamounttemp = 0.5;
            break;
        
        case 19:
            armornametemp = stringsetloc("SpikeShackle", "scr_armorinfo_slash_scr_armorinfo_gml_430_0");
            armordesctemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_431_0");
            amessage2temp = stringsetloc("Get a load of THIS!", "scr_armorinfo_slash_scr_armorinfo_gml_432_0");
            amessage3temp = stringsetloc("Looking SHARP!", "scr_armorinfo_slash_scr_armorinfo_gml_433_0");
            amessage4temp = stringsetloc("(It's tearing my sleeves...)", "scr_armorinfo_slash_scr_armorinfo_gml_434_0");
            armorattemp = 3;
            armordftemp = 1;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("Attack", "scr_armorinfo_slash_scr_armorinfo_gml_459_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 300;
            break;
        
        case 20:
            armornametemp = stringsetloc("FrayedBowtie", "scr_armorinfo_slash_scr_armorinfo_gml_452_0");
            armordesctemp = stringsetloc("An old bowtie. It seems to have#lost much of its defensive value.", "scr_armorinfo_slash_scr_armorinfo_gml_453_0");
            amessage2temp = stringsetloc("Look. I have standards.", "scr_armorinfo_slash_scr_armorinfo_gml_454_0");
            amessage3temp = stringsetloc("It's still wearable!", "scr_armorinfo_slash_scr_armorinfo_gml_455_0");
            amessage4temp = stringsetloc("(Reminds me of Asgore...)", "scr_armorinfo_slash_scr_armorinfo_gml_456_0");
            armorattemp = 1;
            armordftemp = 1;
            armormagtemp = 1;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_467_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 100;
            armorelementtemp = 6;
            armorelementamounttemp = 0.15;
            break;
        
        case 21:
            armornametemp = stringsetloc("Dealmaker", "scr_armorinfo_slash_scr_armorinfo_gml_491_0");
            armordesctemp = stringsetloc("Fashionable pink and yellow glasses.#Greatly increase $ gained, and...?", "scr_armorinfo_slash_scr_armorinfo_gml_492_0");
            amessage2temp = stringsetloc("Money, that's what I need.", "scr_armorinfo_slash_scr_armorinfo_gml_493_0");
            amessage3temp = stringsetloc("Two pairs of glasses?", "scr_armorinfo_slash_scr_armorinfo_gml_494_0");
            amessage4temp = stringsetloc("(Seems... familiar?)", "scr_armorinfo_slash_scr_armorinfo_gml_495_0");
            armorattemp = 0;
            armordftemp = 5;
            armormagtemp = 5;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorabilitytemp = stringsetloc("$ +30%", "scr_armorinfo_slash_scr_armorinfo_gml_505_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 0;
            armorelementtemp = 6;
            armorelementamounttemp = 0.4;
            break;
        
        case 22:
            armornametemp = stringsetloc("RoyalPin", "scr_armorinfo_slash_scr_armorinfo_gml_516_0");
            armordesctemp = stringsetloc("A brooch engraved with Queen's face.#Careful of the sharp part.", "scr_armorinfo_slash_scr_armorinfo_gml_517_0");
            amessage2temp = stringsetloc("ROACH? Oh, brooch. Heh.", "scr_armorinfo_slash_scr_armorinfo_gml_518_0");
            amessage3temp = stringsetloc("I'm a cute little corkboard!", "scr_armorinfo_slash_scr_armorinfo_gml_519_0");
            amessage4temp = stringsetloc("Queen... gave this to me.", "scr_armorinfo_slash_scr_armorinfo_gml_520_0");
            armorattemp = 0;
            armordftemp = 3;
            armormagtemp = 1;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_291_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 1000;
            break;
        
        case 23:
            armornametemp = stringsetloc("ShadowMantle", "scr_armorinfo_slash_scr_armorinfo_gml_538_0");
            armordesctemp = stringsetloc("Shadows slip off like water.#Greatly protects against Dark and Star attacks.", "scr_armorinfo_slash_scr_armorinfo_gml_539_0");
            amessage2temp = stringsetloc("Hell yeah, what's this?", "scr_armorinfo_slash_scr_armorinfo_gml_540_0");
            amessage3temp = stringsetloc("Sh-should I wear this...?", "scr_armorinfo_slash_scr_armorinfo_gml_541_0");
            amessage4temp = stringsetloc("No... it's for someone... taller.", "scr_armorinfo_slash_scr_armorinfo_gml_542_0");
            armorattemp = 0;
            armordftemp = global.chapter;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 0;
            armorabilitytemp = stringsetloc("Dark/Star", "scr_armorinfo_slash_scr_armorinfo_gml_553_0");
            armorabilityicontemp = 4;
            armoricontemp = 4;
            value = 0;
            armorelementtemp = 5;
            armorelementamounttemp = 0.66;
            break;
        
        case 24:
            armornametemp = stringsetloc("LodeStone", "scr_armorinfo_slash_scr_armorinfo_gml_564_0");
            var desc_text = stringsetloc("A lodestone token shaped like a snail's shell.#Enemy bullets give a bit more TP.", "scr_armorinfo_slash_scr_armorinfo_gml_565_0");
            
            if (global.flag[1036] == 1)
                desc_text = stringsetloc("A lodestone token inscribed with the record of#a legend athlete. Enemy bullets give a bit more TP.", "scr_armorinfo_slash_scr_armorinfo_gml_568_0");
            else if (global.flag[1036] == 2)
                desc_text = stringsetloc("A lodestone token in the shape of a pizza.#Enemy bullets give a bit more TP.", "scr_armorinfo_slash_scr_armorinfo_gml_571_0");
            
            armordesctemp = desc_text;
            var sus_text = stringsetloc("Escargot? ... escargross.", "scr_armorinfo_slash_scr_armorinfo_gml_575_0");
            
            if (global.flag[1036] == 1)
                sus_text = stringsetloc("Consolation prize, nice.", "scr_armorinfo_slash_scr_armorinfo_gml_578_0");
            else if (global.flag[1036] == 2)
                sus_text = stringsetloc("I'm going to eat this.", "scr_armorinfo_slash_scr_armorinfo_gml_581_0");
            
            var ral_text = stringsetloc("I have no opinions on snails!", "scr_armorinfo_slash_scr_armorinfo_gml_584_0");
            
            if (global.flag[1036] == 1)
                ral_text = stringsetloc("A reward... just for me?", "scr_armorinfo_slash_scr_armorinfo_gml_587_0");
            else if (global.flag[1036] == 2)
                ral_text = stringsetloc("If I wear it, Susie won't eat it!", "scr_armorinfo_slash_scr_armorinfo_gml_590_0");
            
            var noe_text = stringsetloc("Did your mom eat the non-shell part?", "scr_armorinfo_slash_scr_armorinfo_gml_593_0");
            
            if (global.flag[1036] == 1)
                noe_text = stringsetloc("Thanks, but, this is Azzy's...?", "scr_armorinfo_slash_scr_armorinfo_gml_596_0");
            else if (global.flag[1036] == 2)
                noe_text = stringsetloc("D-don't eat that! I'll wear it!", "scr_armorinfo_slash_scr_armorinfo_gml_599_0");
            
            amessage2temp = sus_text;
            amessage3temp = ral_text;
            amessage4temp = noe_text;
            armorattemp = 0;
            armordftemp = 2;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("TPGain", "scr_armorinfo_slash_scr_armorinfo_gml_614_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 220;
            break;
        
        case 25:
            armornametemp = stringsetloc("GingerGuard", "scr_armorinfo_slash_scr_armorinfo_gml_621_0");
            armordesctemp = stringsetloc("A steel bangle tempered by extreme flame.#Its shape is humanoid in nature.", "scr_armorinfo_slash_scr_armorinfo_gml_622_0");
            amessage2temp = stringsetloc("Look! I punched through a guy!", "scr_armorinfo_slash_scr_armorinfo_gml_623_0");
            amessage3temp = stringsetloc("A bigger one could make Kris!", "scr_armorinfo_slash_scr_armorinfo_gml_624_0");
            amessage4temp = stringsetloc("This smells amazing! Um, sorry.", "scr_armorinfo_slash_scr_armorinfo_gml_625_0");
            armorattemp = 0;
            armordftemp = 3;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringset(" ");
            armorabilityicontemp = 0;
            armoricontemp = 19;
            value = 862;
            break;
        
        case 26:
            armornametemp = stringsetloc("BlueRibbon", "scr_armorinfo_slash_scr_armorinfo_gml_643_0");
            armordesctemp = stringsetloc("A blue cheer bow. When the user uses a#healing move, it recovers slightly more HP.", "scr_armorinfo_slash_scr_armorinfo_gml_644_0");
            amessage2temp = stringsetloc("ABSOLUTELY not.", "scr_armorinfo_slash_scr_armorinfo_gml_645_0");
            var ral_text_lines = [stringsetloc("Give me a K! Give me an R!", "scr_armorinfo_slash_scr_armorinfo_gml_647_0"), stringsetloc("Give me an I! Give me an S!", "scr_armorinfo_slash_scr_armorinfo_gml_648_0"), stringsetloc("Give me an ampersand!", "scr_armorinfo_slash_scr_armorinfo_gml_649_0"), stringsetloc("Give me an S! Give me a U!", "scr_armorinfo_slash_scr_armorinfo_gml_650_0"), stringsetloc("Give me an S! Give me an I!", "scr_armorinfo_slash_scr_armorinfo_gml_651_0"), stringsetloc("Give me an E! Give me an A!", "scr_armorinfo_slash_scr_armorinfo_gml_652_0"), stringsetloc("Give me an R! Give me an E!", "scr_armorinfo_slash_scr_armorinfo_gml_653_0"), stringsetloc("Give me an M! Give me a Y!", "scr_armorinfo_slash_scr_armorinfo_gml_654_0"), stringsetloc("Give me an F! Give me an R!", "scr_armorinfo_slash_scr_armorinfo_gml_655_0"), stringsetloc("Give me an I! Give me an E!", "scr_armorinfo_slash_scr_armorinfo_gml_656_0"), stringsetloc("Give me an N! Give me a D!", "scr_armorinfo_slash_scr_armorinfo_gml_657_0"), stringsetloc("Give me an S!", "scr_armorinfo_slash_scr_armorinfo_gml_658_0"), stringsetloc("Give me an exclamation point!", "scr_armorinfo_slash_scr_armorinfo_gml_659_0"), stringsetloc("Um, that's it!", "scr_armorinfo_slash_scr_armorinfo_gml_660_0"), stringsetloc("D... don't give me anything else!", "scr_armorinfo_slash_scr_armorinfo_gml_661_0"), stringsetloc("Yeah!", "scr_armorinfo_slash_scr_armorinfo_gml_662_0")];
            amessage3temp = ral_text_lines[global.flag[1037]];
            amessage4temp = stringsetloc("Go...  t... team?", "scr_armorinfo_slash_scr_armorinfo_gml_665_0");
            armorattemp = 0;
            armordftemp = 1;
            armormagtemp = 1;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc("Heal+", "scr_armorinfo_slash_scr_armorinfo_gml_676_0");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 1;
            break;
        
        case 27:
            armornametemp = stringsetloc("TennaTie", "scr_armorinfo_slash_scr_armorinfo_gml_682_0");
            armordesctemp = stringsetloc("A giant, heavy-duty, bullet-proof tie.#How to even wear it...?", "scr_armorinfo_slash_scr_armorinfo_gml_683_0");
            amessage2temp = stringsetloc("Bandana-style.", "scr_armorinfo_slash_scr_armorinfo_gml_684_0");
            amessage3temp = stringsetloc("Like a sash...?", "scr_armorinfo_slash_scr_armorinfo_gml_685_0");
            amessage4temp = stringsetloc("Look, I'm like a gift!", "scr_armorinfo_slash_scr_armorinfo_gml_686_0");
            armorattemp = 0;
            armordftemp = 5;
            armormagtemp = -2;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringsetloc(" ", "scr_armorinfo_slash_scr_armorinfo_gml_697_0");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 600;
            break;
        
        case 50:
            armornametemp = stringsetloc("Waferguard", "scr_armorinfo_slash_scr_armorinfo_gml_704_0");
            armordesctemp = stringsetloc("Although it looks brittle, it contains a magical#energy that blunts damage on impact. +4DF", "scr_armorinfo_slash_scr_armorinfo_gml_705_0");
            amessage2temp = stringsetloc("(Don't eat it. Don't eat it.)", "scr_armorinfo_slash_scr_armorinfo_gml_706_0");
            amessage3temp = stringsetloc("It's got drool on it.", "scr_armorinfo_slash_scr_armorinfo_gml_707_0");
            amessage4temp = stringsetloc("What's next, cheezy armor? Faha!", "scr_armorinfo_slash_scr_armorinfo_gml_708_0");
            armorattemp = 0;
            armordftemp = 4;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringset(" ");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 900;
            break;
        
        case 51:
            armornametemp = stringsetloc("MysticBand", "scr_armorinfo_slash_scr_armorinfo_gml_725_0");
            armordesctemp = stringsetloc("A silver armlet stained with amber.#Increases magic only. MAG +4", "scr_armorinfo_slash_scr_armorinfo_gml_726_0");
            amessage2temp = stringsetloc("Let's go, Rude Buster!", "scr_armorinfo_slash_scr_armorinfo_gml_727_0");
            amessage3temp = stringsetloc("Behold! Heal Prayer!", "scr_armorinfo_slash_scr_armorinfo_gml_728_0");
            amessage4temp = stringsetloc("(The other flavor is better)", "scr_armorinfo_slash_scr_armorinfo_gml_729_0");
            armorattemp = 0;
            armordftemp = 0;
            armormagtemp = 4;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringset(" ");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 1234;
            break;
        
        case 52:
            armornametemp = stringsetloc("PowerBand", "scr_armorinfo_slash_scr_armorinfo_gml_746_0");
            armordesctemp = stringsetloc("A silver armlet stained with red essence.#Increases strength only. ATK +4", "scr_armorinfo_slash_scr_armorinfo_gml_747_0");
            amessage2temp = stringsetloc("BLOOD POWER ACTIVATE!", "scr_armorinfo_slash_scr_armorinfo_gml_748_0");
            amessage3temp = stringsetloc("I'm juiced up!", "scr_armorinfo_slash_scr_armorinfo_gml_749_0");
            amessage4temp = stringsetloc("Why always jewelry?", "scr_armorinfo_slash_scr_armorinfo_gml_750_0");
            armorattemp = 4;
            armordftemp = 0;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringset(" ");
            armorabilityicontemp = 0;
            armoricontemp = 4;
            value = 1234;
            break;
        
        case 53:
            armornametemp = stringsetloc("PrincessRBN", "scr_armorinfo_slash_scr_armorinfo_gml_767_0");
            armordesctemp = stringsetloc("Elegant lace ribbon with gloves,#delicate enough to see through. +4 DEF +2 ATK", "scr_armorinfo_slash_scr_armorinfo_gml_768_0");
            amessage2temp = stringsetloc("Nah. Gloves don't fit.", "scr_armorinfo_slash_scr_armorinfo_gml_769_0");
            amessage3temp = stringsetloc("Cute! (Gloves don't fit)", "scr_armorinfo_slash_scr_armorinfo_gml_770_0");
            amessage4temp = stringsetloc("Kris, you can wear the gloves!", "scr_armorinfo_slash_scr_armorinfo_gml_771_0");
            armorattemp = 2;
            armordftemp = 4;
            armormagtemp = 0;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 0;
            armorchar3temp = 1;
            armorchar4temp = 1;
            armorabilitytemp = stringset(/*"Elegance"*/"优雅");
            armorabilityicontemp = 7;
            armoricontemp = 4;
            value = 1234;
            break;
        
        case 54:
            armornametemp = stringsetloc("GoldWidow", "scr_armorinfo_slash_scr_armorinfo_gml_788_0");
            armordesctemp = stringsetloc("A spider made of gold. It gathers coins#into it, reducing $ gained.", "scr_armorinfo_slash_scr_armorinfo_gml_789_0");
            amessage2temp = stringsetloc("Spider on my head. K.", "scr_armorinfo_slash_scr_armorinfo_gml_790_0");
            amessage3temp = stringsetloc("Itsy and/or bitsy!", "scr_armorinfo_slash_scr_armorinfo_gml_791_0");
            amessage4temp = stringsetloc("E-Ew! Kris, get that away!", "scr_armorinfo_slash_scr_armorinfo_gml_792_0");
            armorattemp = 1;
            armordftemp = 5;
            armormagtemp = 1;
            armorboltstemp = 0;
            armorgrazeamttemp = 0;
            armorgrazesizetemp = 0;
            armorchar1temp = 1;
            armorchar2temp = 1;
            armorchar3temp = 1;
            armorchar4temp = 0;
            armorabilitytemp = stringsetloc("$ -10%", "scr_armorinfo_slash_scr_armorinfo_gml_803_0");
            armorabilityicontemp = 6;
            armoricontemp = 4;
            value = 5000;
            break;
    }
}
