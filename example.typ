#import "0.1.0/lib.typ": *

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
($(not p or not q)$, $or I quad 6$), // fix!
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
($not not q$, $not I quad 14-17$), // why won't it work
))