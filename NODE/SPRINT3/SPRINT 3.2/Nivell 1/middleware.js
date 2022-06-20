class Middleware {
  constructor() {
    this.middlewares = [];
  }

  use(fn) {
    this.middlewares.push(fn);
  }

  executeMiddleware(data, done) {
    //console.log(this.middlewares.length);
    this.middlewares.reduceRight((done, next) => () => { next(data, done); }, done)(data);

  }

  run(data, fn) {
    //console.log(data);
    this.executeMiddleware(data, (done) => console.log(fn(data)));
  }
}

module.exports = Middleware;
