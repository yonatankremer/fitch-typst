#import "lib.typ": ded
#import "src/formula.typ": sps, spe, asm
#import "src/frameline.typ": frameline

= Examples

== De Morgan: $not(p and q) tack (not p or not q)$.
Proof (dynamic mode): 
#ded(asm-mode: "dynamic", (
$not(p and q)$,
asm,
sps,
$not(not p or not q)$,
asm,
sps,
$not p$,
asm,
($(not p or not q)$, $or I quad 3$),
($tack.t$, $tack.t I quad 2,4$),
spe,
($not not p$, $not I quad 3-5$), // automatically add quad as third character?
($p$, $not E quad 6$),
sps,
$not q$,
asm,
($(not p or not q)$, $or I quad 8$),
($tack.t$, $tack.t I quad 2,9$),
sps,
spe,
spe,
($not not q$, $not I quad 8-10$),
($q$, $not E quad 11$),
($(p and q)$, $and I quad 7,12$),
($tack.t$, $tack.t I quad 1,13$),
spe,
($not not(not p or not q)$, $not I quad 2,14$),
($(not p or not q)$, $not E quad 15$),
))

Done!

#pagebreak()

== Natural Deduction Rules

#let and-intro = ded((
  ($m$, $p$, $$),
  // ($$,$dots.v$,$$), // have it as a predefined line?
  ($n$, $q$, $$),
  // ($$,$dots.v$,$$),
  ($o$, $(p and q)$, $and I quad m,n$)
))

#let and-elim = ded((
  ($m$, $(p and q)$, $$),
  ($n_1$, $p$, $and E quad m$),
  ($n_2$, $q$, $and E quad m$),
))

#stack(dir: ltr, spacing: 15em, and-intro, and-elim)

// note how (it seems as) the ones with paren. are further to the right. Idk if true, but consider.