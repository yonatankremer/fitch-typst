#import "src/formula.typ": *
#import "src/frameline.typ": *
#import "src/interface.typ": *
#import "src/frame.typ": *

#let ded(frameline: frameline(), asm-mode: "manual", formulas) = {
  
  assert(asm-mode in asm-modes, message: asm-mode-error)
  frame(frameline, asm-mode, parse(formulas))
}