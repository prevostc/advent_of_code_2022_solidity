const fs = require("fs");
const path = process.argv[2];

const data = fs.readFileSync(path, "utf8");
console.log(JSON.stringify(data));
