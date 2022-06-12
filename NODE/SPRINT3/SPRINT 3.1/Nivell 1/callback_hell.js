// const {
//   readdir,
//   readFile,
//   writeFile
// } = require("fs");
const fsp = require("fs/promises") //Per utilitzar async/await les funcions fs s'han d'utilitzar amb la llibreria fs/promises
const {
  join
} = require("path");
const inbox = join(__dirname, "inbox");
const outbox = join(__dirname, "outbox");

const reverseText = str =>
  str
    .split("")
    .reverse()
    .join("");
/*
// Read and reverse contents of text files in a directory
readdir(inbox, (error, files) => {
  if (error) return console.log("Error: Folder inaccessible");
  files.forEach(file => {
    readFile(join(inbox, file), "utf8", (error, data) => {
      if (error) return console.log("Error: File error");
      writeFile(join(outbox, file), reverseText(data), error => {
        if (error) return console.log("Error: File could not be saved!");
        console.log(`${file} was successfully saved in the outbox!`);
      });
    });
  });
});
*/

(async function callback_hell() {
  try {
    let files = await fsp.readdir(inbox); //retorna array de fitxers
    for (let file of files) { //async/await no funciona amb forEach/map -> passar a for/while
      let file2 = await fsp.readFile(join(inbox, file), 'utf8'); //retorna el text passat a utf8, si s'omiteix pasa buffer en hexadecimal
      let escriure = await fsp.writeFile(join(outbox, file), reverseText(file2)); // crear fitxer reescribin-te'l al revés
      console.log(`${file} salvat`);
    }
  } catch (err) {
    console.log(err);
  }
})()
