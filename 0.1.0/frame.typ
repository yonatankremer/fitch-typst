// constants

#let height = 30pt

#let frame-length = height
#let frame-girth = 1.5pt
#let frame-line = line(angle: 90deg, length: frame-length, stroke: frame-girth)
#let horizontal-spacing = 10pt


#let asm-length = 30pt
#let asm-girth = 0.6pt
#let asm-line-isolated = line(length: asm-length, stroke: asm-girth)

#let asm-line = stack(
  dir: ttb, frame-line,
  move(
    dx: frame-girth/2,
    dy: -asm-girth/2, asm-line-isolated
   )
)

#let space-box = line(stroke: 0pt, length: asm-length - horizontal-spacing)


// frame

#let frame-array(len, insert-space) = {
  
  // although it's internal, just to make sure. Otherwise the function son't make sense
  insert-space = insert-space.sorted()

  let arr = ()
  for i in range(len) {

    if i in insert-space {
      arr.push(space-box)
      insert-space.remove(0)
    }
      arr.push(frame-line)
  }
  
  return arr
}

#import "formula.typ": formula

#let frame-single(fm) = {
  let arr = frame-array(fm.depth, fm.prev-asm-depths)
  if fm.is-last-asm {arr.last() = asm-line}

  let out = stack(
    dir: ltr,
    spacing: horizontal-spacing,
    ..arr
  )

  return out
}


#let frame(fms) = {
  let arr = ()
  for fm in fms {arr.push(frame-single(fm))}

  let out = stack(
    dir: ttb,
    spacing: 0pt, // redundant
    ..arr
  )
  return out
}