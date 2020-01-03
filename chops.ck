155::ms => dur sixteenth;
0.3 => dac.gain;

// VOCAL CHOP BUFFERS

SndBuf chop1 => dac;
me.dir() + "/resources/chop1.wav" => chop1.read;
chop1.samples() => chop1.pos;

SndBuf chop2 => dac;
me.dir() + "/resources/chop2.wav" => chop2.read;
chop2.samples() => chop2.pos;

SndBuf chop3 => dac;
me.dir() + "/resources/chop3.wav" => chop3.read;
chop3.samples() => chop3.pos;

SndBuf chop4 => dac;
me.dir() + "/resources/chop4.wav" => chop4.read;
chop4.samples() => chop4.pos;

SndBuf chop5 => dac;
me.dir() + "/resources/chop5.wav" => chop5.read;
chop5.samples() => chop5.pos;

SndBuf chop6 => dac;
me.dir() + "/resources/chop6.wav" => chop6.read;
chop6.samples() => chop6.pos;

SndBuf chop7 => dac;
me.dir() + "/resources/chop7.wav" => chop7.read;
chop7.samples() => chop7.pos;

SndBuf chop8 => dac;
me.dir() + "/resources/chop8.wav" => chop8.read;
chop8.samples() => chop8.pos;


while (true) {
    loop();
}


fun void loop() {
    0.35 => float veloc;
    trigger(chop1, 1.1, veloc, 0, 3*sixteenth);
    trigger(chop5, 1.1, veloc, 0, sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop4, 1.1, veloc, 0, 4*sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop7, 1.1, veloc, 0, 4*sixteenth);

    trigger(chop1, 1.1, veloc, 0, 3*sixteenth);
    trigger(chop5, 1.1, veloc, 0, sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop4, 1.1, veloc, 0, 4*sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop6, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop6, 1.1, veloc, 0, 2*sixteenth);

    trigger(chop1, 1.1, veloc, 0, 3*sixteenth);
    trigger(chop5, 1.1, veloc, 0, sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop4, 1.1, veloc, 0, 4*sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop7, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop2, 1.1, veloc, 0, 2*sixteenth);

    trigger(chop1, 1.1, veloc, 0, 3*sixteenth);
    trigger(chop5, 1.1, veloc, 0, sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop4, 1.1, veloc, 0, 4*sixteenth);
    trigger(chop3, 1.1, veloc, 0, 2*sixteenth);
    trigger(chop8, 1.1, veloc, 0, 4*sixteenth);
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

    buf.samples() => buf.pos;
}