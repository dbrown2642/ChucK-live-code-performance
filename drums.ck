155::ms => dur sixteenth;
0.3 => dac.gain;

SndBuf kick => dac;
me.dir() + "/resources/KRS_kick_hip_hop_basic_02.wav" => kick.read;
kick.samples() => kick.pos;

SndBuf snare => dac;
me.dir() + "/resources/OS_TS_Snare_2.wav" => snare.read;
snare.samples() => snare.pos;

SndBuf hats => dac;
me.dir() + "/resources/RP2_PercLoop_85_Hats.wav" => hats.read;
hats.samples() => hats.pos;
hats.length() / (16 * sixteenth) => float hatsRatio;

[0, 0, 0, 0,    1, 0, 0, 0,    0, 0, 0, 0,    1, 0, 0, 0] @=> int snarePattern[];
[1, 0, 0, 1,    0, 0, 1, 0,    0, 0, 0, 1,    0, 0, 0, 1] @=> int kickPattern[];


while (true) {
    spork ~ playKick();
    spork ~ playSnare();
    spork ~ playHats();
    runLoop();
}


fun void playKick() {
    for (0 => int i; i < kickPattern.cap(); ++i) {
        if (kickPattern[i]) {
            trigger(kick, 1.0, 0.5, 0, sixteenth);
        }
        else {
            sixteenth => now;
        }
    }
}

fun void playSnare() {
    for (0 => int i; i < snarePattern.cap(); ++i) {
        if (snarePattern[i]) {
            trigger(snare, 1.0, 0.4, 0, sixteenth);
        }
        else {
            sixteenth => now;
        }
    }
}

fun void playHats() {
    trigger(hats, hatsRatio, 0.15, 0, 16 * sixteenth);
}

fun void trigger(SndBuf buf, float pitch, float velocity, int start, dur amount) {
    // set pitch
    pitch => buf.rate;
    // set velocity (really just changing gain here)
    velocity => buf.gain;
    // play from beginning
    start => buf.pos;
    // send sound to dac
    amount => now;

    //buf.samples() => buf.pos;
}

fun void runLoop() {
    16 * sixteenth => now;
}