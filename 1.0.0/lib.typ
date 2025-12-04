#import "diagram.typ": diagram
#import "formula.typ": sps, spe, asm


#let id = it => it
#let ded(
  index-style: id, frame-style: id, formula-style: id, rule-style: id,
  row-height: 3em, asm-mode: "fixed", fms) = diagram(
    
  index-style, frame-style, formula-style, rule-style,
  row-height, asm-mode, fms)