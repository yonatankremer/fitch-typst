#import "formula.typ": *
#import "frame.typ": *

#let indices(fms, style) = {
  
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, style(text(size: 11pt, it.index)))) // fix larger text
    )
}

#let rules(fms, style) = {
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, style($it.rule$)))
    )
}


#let diagram(index-style, frame-style, formula-style, rule-style, row-height, asm-mode, fms) = {

  let parsed = parse(fms).filter(x =>
  x != spacing and
  x not in utils // I hate this
  )

  stack(
    dir: ltr,
    spacing: 11pt,
    indices(parsed, index-style),
    frame(fms, frame-style: frame-style, formula-style: formula-style),
    rules(parsed, rule-style)
  )
}

