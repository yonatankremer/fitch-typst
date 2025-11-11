// type definition

#let formula(depth, index, equation, prev-asm-depths, rule: none, is-last-asm: false) = {

  assert(depth >= 1, message: "Depth must be positive! Remove spe lines.")

  return (
    depth: depth,
    index: index,
    equation: equation,
    rule: rule,
    is-last-asm: is-last-asm,
    prev-asm-depths: prev-asm-depths
  )
}


// utility formulas

#let sps = formula(1,1,"UTIL subproof start", ()) // starts a subproof
#let spe = formula(1,1,"UTIL subproof end", ()) // ends a subproof
#let asm = formula(1,1,"UTIL assumption line", ()) // an assumption line

// parse a single formula; use internally
#let parse-single(fm, depth, line-number, prev-asm-depths) = {

  if type(fm) == content { // just an equation
      return formula(
        depth,
        [#line-number],
        fm,
        prev-asm-depths,
      )
    }

    // otherwise, must be an array

    if type(fm) == array {

      if fm.len() == 2 { // equation, rule
        return formula(
          depth,
          [#line-number],
          fm.at(0), // equation
          rule: fm.at(1), // rule
          prev-asm-depths,
        )
      }

      else if fm.len() == 3 { // index, equation, rule
        return formula(
          depth,
          fm.at(0), // index
          fm.at(1), // index = line-number
          rule: fm.at(2), // rule
          prev-asm-depths
        )
      }

      panic("Array of invalid form! The valid forms are (equation, rule) or (index, equation, rule).")

      }

    panic("Invalid input type! Valid inputs are equations or arrays.")

}

// parse input to array of formulas

#let parse(arr) = {

  assert(arr.first() != asm, message: "First line cannot be an assumption line!")

  let depth = 1
  let formulas = ()
  let line-number = 0
  let cur-asm-depths = ()

  for line in arr {

    line-number += 1

    if line == sps {depth += 1}
    
    else if line == spe {
      if depth in cur-asm-depths {cur-asm-depths.pop()}
      depth -= 1
      }

    else if line == asm { // existence of a last given a 'asm' is verified above
        cur-asm-depths.push(depth)
        formulas.last().is-last-asm = true
      }

    // then is a visible formula

    else {
      formulas.push(parse-single(line, depth, line-number, cur-asm-depths))
      }
  }
  
  return formulas
  
}