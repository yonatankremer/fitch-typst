#import "formula.typ": formula
#import "frame.typ": frame, horizontal-spacing, height, asm-length


#let indent-equation(fm) = {
  let by = (
    (fm.depth - 1) * horizontal-spacing) + (
      asm-length * (fm.depth - 1)
    )

  return move(dx: by, fm.equation) 
}

#let indent-equations(fms) = {

  let max-depth = calc.max(..fms.map(it => it.depth))
  let max-asms = calc.max(..fms.map(it => it.prev-asm-depths.len()))


  let by = (max-depth * horizontal-spacing) + (max-asms * asm-length) - 14pt

  let font-size = 11pt // depends

  let indented-stack = stack(
    dir: ttb,
    spacing: height - font-size + 3.5pt,
    ..fms.map(it => indent-equation(it))
  )

  return move(dx: -by, dy: font-size, indented-stack)
}



#let framed-equations(fms) = {
  return stack(
    dir: ltr,
    frame(fms),
    indent-equations(fms)
  )
}

#let indices(fms) = {
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, it.index))
    )
}

#let rules(fms) = {
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, $it.rule$))
    )
}


#let diagram(fms) = {
  stack(
    dir: ltr,
    spacing: 10pt,
    indices(fms),
    framed-equations(fms),
    rules(fms)
  )
}