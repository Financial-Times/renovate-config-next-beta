const fs = require('fs');
const path = require('path');
const JSON5 = require('json5');
const configFile = path.join(__dirname, '../renovate-config.json5');
const outPutFile = path.join(__dirname, '../renovate.json');

try {
    fs.writeFileSync(
      outPutFile,
      JSON.stringify(
        JSON5.parse(fs.readFileSync(configFile)),
        null,
        ' '
      )
    );
    
    console.log('Finished converting JSON5 file to JSON.')
} catch (error) {
    console.log('There was an error converting JSON5 to JSON. ', error);
}