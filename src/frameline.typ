// type definition
#let frameline(length: 3em, thick: .05em, stroke: black, is-short: false, is-asm: false, asm-length: 2.25em, asm-thick: .05em, asm-stroke: black) = {
  (
    length: length,
    thick: thick,
    stroke: stroke,
    is-short: is-short,
    is-asm: is-asm,
    asm-length: asm-length,
    asm-thick: asm-thick,
    asm-stroke: asm-stroke
  )
}

// changes a value of a frameline
/*
#let fl-set(fl, key, value) = {
  assert(key in fl.keys(), message: "Field DNE!")
  fl.insert(key, value)
}
Doesn't work! I guess Typst creates a new variable in memory.
*/

/*
// returns a new modified frameline
#let fl-with(fl, key, value) = {
  let out = fl
  fl-set(out, key, value)
  return out
}
Ignore for now.
*/

// display a frameline
#let fl-display(fl) = {

  let length = fl.length
  if fl.is-short {length -= .5em}

  let ln = line(angle: 90deg, length: length, stroke: fl.thick + fl.stroke)  
  if fl.is-asm {
    ln = stack(dir: ttb, ln, move(
      dx: fl.thick/2,
      dy: -fl.asm-thick/2,
      line(length: fl.asm-length, stroke: fl.asm-thick)
      )
    )
  }
  
  //ln = align(left+bottom, ln) 
  // won't "work" for some reason
  return ln
}