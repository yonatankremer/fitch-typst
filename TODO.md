## Functional
- constrain [lib.typ](lib.typ) to just the deduction function
- rethink library structure:
    - a proof environment?
    - ~~default parameters + argument flow~~ no default parameters or input verification beyond [lib.typ](lib.typ) (suppose it is always valid)
        - note: [frameline.typ](src/frameline.typ) or a future user-oriented version of it as an exception.
- implement styling; specialize styling for the different elements: text, equations, lines
- custom auto indexation using typst's indexation capabilities; nested indexation for subproofs? that'll be pretty cool! So - implementation of indexation schemes
- add the option to manually define asm-lines. can either "obey" to dynamic, ignore it, or be settable.
- asm-mode is either a constant or "dynamic"; could maybe add some "curved length" sometime (just a composition of the measure part with some function of a domain... idk, range of the interval \(0,1\]). Perhaps "dynamic" itself should be non-linear.

## QOL
- write the [README](README.md)
- restrict imports
- strengthen input checking
- try to utilize as much built-in functions as possible
- try to get rid of the "merge" function
- submit to [Typst Universe](https://github.com/typst/packages) when ready.

## Naming
- rething utility line naming: start/end or open/close + ass or assume perhaps with some pre/post-fixes.
- rename ded? deduce? deduc? fitch? chart?