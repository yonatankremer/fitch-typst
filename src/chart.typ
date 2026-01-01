#import "formula.typ": *
#import "frame.typ": *
#import "frameline.typ": *

#let indices(formulas, height) = context {
    return stack(
      dir: ttb,
      spacing: height - par.leading,
      ..formulas.map(it => move(dy: (height - par.leading)/2, it.index))
    )
}

#let rules(formulas, height) = context {
    return stack(
      dir: ttb,
      spacing: height - par.leading,
      ..formulas.map(it => move(dy: (height - par.leading)/2, it.rule))
    )
}

#let chart(frameline, asm-mode, formulas) = {

  let parsed = parse(formulas)
  let filtered = parsed.filter(x => x not in utils)

  return stack(
    dir: ltr,
    spacing: .5em,
    indices(filtered, frameline.length),
    frame(frameline, asm-mode, parsed),
    rules(filtered, frameline.length)
  )
}
