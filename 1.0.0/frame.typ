// constants

#let height = 30pt

#let frame-length = height
#let frame-girth = .5pt
#let frame-line = line(angle: 90deg, length: frame-length, stroke: frame-girth)

#let asm-length = 25pt
#let asm-girth = frame-girth
#let asm-line-isolated = line(length: asm-length, stroke: asm-girth)

#let space = 11pt
#let spacing = h(space)


// note: removing bottom alignment breaks the design. figure out.
#let add-asm(to) = align(bottom, stack(
  dir: ttb, to,
  move(
    dx: frame-girth/2,
    dy: -asm-girth/2, asm-line-isolated
   )
  ))

#let asm-line = add-asm(frame-line)

#let frame-first-line = line(angle: 270deg, length: frame-length - 10*frame-girth, stroke: frame-girth)

#let asm-first-line = add-asm(frame-first-line)

#let long(to) = {
  if to == frame-first-line {frame-line}
  else if to == asm-first-line {asm-line}
  else if to in (frame-line, asm-line) {to}
  else {panic("even more :(")}
}


#let id = it => it


#import "formula.typ": * // constrain later

// returns an array of each formula's array of frame lines and (asm) spaces
#let frame-arr(fms, frame-style: id, formula-style: id) = { // parse prior?

  let frm = ()
  let new = (frame-line,)
  let is-asm = (false,)

  for line in fms {

    if line == sps {

      if is-asm.last() {new.push(frame-first-line)}
      else {new.push(frame-line)}
      is-asm.push(false)

    }

    else if line == spe {
      
      let _ = new.pop()
      if new.last() == spacing {let _ = new.pop()}
      let _ = is-asm.pop()
      
    }

    else if line == asm {
      frm.last().last() = add-asm(frm.last().last())
      is-asm.last() = true
    }

    // is a visible line
    else {
      frm.push(formula-style(new))
      new.last() = long(new.last())
    }

  }

  return frm

}

// merges two equally lengthed arrays into a pair-array of the same length
#let merge(arr1, arr2) = {

  let l1 = arr1.len()
  let l2 = arr2.len()
  assert(arr1.len() == arr2.len(), message: "Arrays must be of the same length")

  let out = ()
  for i in range(arr1.len()) {out.push((arr1.at(i), arr2.at(i)))}
  return out
}

#let frame(fms, frame-style: id, formula-style: id) = {

  let arr = frame-arr(fms, frame-style: frame-style, formula-style: formula-style)
  fms = parse(fms).filter(x => x not in utils)

  let out = ()

  for (fml, frm) in merge(fms, arr) {

    let move-left = 0pt 
    if frm.last() in (asm-line, asm-first-line) {move-left = asm-length}
    let new = stack(
      dir: ltr,
      spacing: space,
      ..frm,
      align(left+horizon, move(dx: -move-left - 11pt/2, fml.equation)) // fix constant
      )
    out.push(align(left,new))

  }

  return stack(
    dir: ttb,
    ..out
  )

}