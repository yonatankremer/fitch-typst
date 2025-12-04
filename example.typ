#import "1.0.0/lib.typ": ded
#import "1.0.0/formula.typ": sps, spe, asm

De Morgan: $not(p and q) tack (not p or not q)$.
Proof:
#ded((
$not(p and q)$,
sps,
$not(not p or not q)$,
asm,
sps,
$not p$,
asm,
($(not p or not q)$, $or I quad 6$),
($tack.t$, $tack.t I quad 3,8$),
spe,
($not not p$, $not I quad 3-9$), // automatically add quad as third character?
($p$, $not E quad 11$),
sps,
$not q$,
asm,
($(not p or not q)$, $or I quad 14$),
($tack.t$, $tack.t I quad 3,16$),
sps,
spe,
spe,
($not not q$, $not I quad 14-17$),
($q$, $not E quad 11$),
($(p and q)$, $and I quad 7,12$),
($tack.t$, $tack.t I quad 1,13$),
spe,
($not not(not p or not q)$, $not I quad 2,14$),
($(not p or not q)$, $not E quad 15$)
))

