function quadrat(a){
  return a**2;
}

function cub(a){
  return a**3;
}

function divideix(a, b) {
  try {
    return a / b;
  } catch {
    return "Infinit";
  }
}

//let op = [suma,resta,multiplica,divideix];

module.exports = { quadrat, cub, divideix };
