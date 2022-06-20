const Middleware = require("./Middleware");

class Maths {
  add({a, b}) {
    return a + b;
  }
  subtract({a, b}) {
    return a - b;
  }
  multiply({a, b}) {
    return a * b;
  }
}

const calculator = new Maths();
const app = new Middleware(calculator);

app.use((req, next) => {
  req.a **= 2;
  req.b **= 2;
  console.log("mid1", req);
  next();
});

app.use((req, next) => {
    req.a **= 3;
    req.b **= 3;
    console.log("mid2", req);
    next();
});

app.use((req, next) => {
    req.a /= 2;
    req.b /= 2;
    console.log("mid3", req);
    next();
  });


console.log(app.add({a: 4, b: 3}));
console.log(app.subtract({a: 4, b: 3}));
console.log(app.multiply({a: 4, b: 3}));