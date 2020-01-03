155::ms => dur sixteenth;
0.3 => dac.gain;

true => int makeItFunky;

// CREATE SAW OSC

10 => int numSawVoices;
0.008 => float stdGain;
SawOsc saw[numSawVoices];

LPF sawLPF;
700 => sawLPF.freq;
0.4 => sawLPF.Q;

for (0 => int i; i < 10; i++) {
    saw[i] => sawLPF => dac;
    0 => saw[i].gain;
}

while (true) {
    if (makeItFunky) {
        playSaw(2*sixteenth, [44, 56, 60, 63, 67], 0);
        sixteenth => now;
        playSaw(2*sixteenth, [44, 56, 60, 63, 67], 0);
        sixteenth => now;
        playSaw(3*sixteenth, [44, 56, 60, 63, 67], 0);
        3 * sixteenth => now;
        playSaw(2*sixteenth, [44, 56, 60, 63, 67], 0);
        2 * sixteenth => now;
        
        
        playSaw(2*sixteenth, [41, 55, 60, 63, 67], 0);
        sixteenth => now;
        playSaw(2*sixteenth, [41, 55, 60, 63, 67], 0);
        sixteenth => now;
        playSaw(3*sixteenth, [41, 55, 60, 63, 67], 0);
        3 * sixteenth => now;
        playSaw(2*sixteenth, [41, 55, 60, 63, 67], 0);
        playSaw(2*sixteenth, [41, 55, 60, 63, 67], 0);
        
        
        playSaw(2*sixteenth, [43, 58, 62, 65, 69], 0);
        sixteenth => now;
        playSaw(2*sixteenth, [43, 58, 62, 65, 69], 0);
        sixteenth => now;
        playSaw(3*sixteenth, [43, 58, 62, 65, 69], 0);
        3 * sixteenth => now;
        playSaw(2*sixteenth, [43, 58, 62, 65, 69], 0);
        2 * sixteenth => now;
        
        
        playSaw(2*sixteenth, [36, 56, 60, 64, 68], 0);
        sixteenth => now;
        playSaw(2*sixteenth, [36, 56, 60, 64, 68], 0);
        sixteenth => now;
        playSaw(3*sixteenth, [36, 56, 60, 64, 68], 0);
        3 * sixteenth => now;
        playSaw(2*sixteenth, [36, 56, 60, 64, 68], 0);
        playSaw(2*sixteenth, [36, 56, 60, 64, 68], 0);
        
    }
    else {
        playSaw(16*sixteenth, [44, 56, 60, 63, 67], 0);
        playSaw(16*sixteenth, [41, 55, 60, 63, 67], 0);
        playSaw(16*sixteenth, [43, 58, 62, 65, 69], 0);
        playSaw(16*sixteenth, [36, 56, 60, 64, 68], 0);
    }
}

fun void playSaw(dur amount, int voices[], int transpose) {
    // load given notes into saw voices and silence rest
    for (0 => int i; i < numSawVoices; i++) {
        if (i < voices.size()) {  
            Std.mtof(voices[i] + transpose) => saw[i].freq;
            stdGain => saw[i].gain;
        }
        else {
            0 => saw[i].gain;
        }
    }
    // play notes for given multiple of eighth notes
    amount => now;
    for (0 => int i; i < numSawVoices; i++) {
        0 => saw[i].gain;
    }
}