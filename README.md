# ChucK-live-code-performance

## Performance
A performance of this live coding experiment can be watched here: https://youtu.be/gj5asouhVkM

## Concept
This project aims to use the [miniAudicle](http://audicle.cs.princeton.edu/mini/) IDE as a performance tool for a piece written in the [ChucK](https://chuck.cs.princeton.edu/) programming language. Utilizing live coding and the affordances of the miniAudicle code shredding interface, the piece presents a song that evolves through performer interaction.

## Interaction Components
* Array manipulation: in the **drums.ck** file, arrays containing 16 boolean values act as a code representation of a 16-step drum machine
* Simple boolean value changing: in the **chords.ck** file, changing the `makeItFunky` variable between true and false enables quick switching between two rhythm structures
* Adding shred: using miniAudicle's Add Shred (`cmd +` on Mac) feature enables the user to add elements of the piece at the desired time
* Replace shred: using the miniAudicle's Replace Shred(`cmd =` on Mac) feature enables the user to enact changes made to a file at the desired time, or create a sample stutter effect
