class Middleware {
  constructor() {
    this.middlewares = [];
  }

  use(fn) {
    this.middlewares.push(fn);
  }

  async executeMiddleware(data, callback) {
    // console.log(this.middlewares.length);
    try {
      for (let i = 0; i < this.middlewares.length; i++) {
        //console.log(i);
        await this.middlewares[i](data);
      }
      callback();
    } catch (err) {
      console.log(err);
    }
  }

  run(data) {
    
    this.executeMiddleware(data, () => console.log("Ha passat a través de tots els middlewares"));
  }
}

module.exports = Middleware;
