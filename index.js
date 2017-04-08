const os = require('os');
const restify = require('restify');

const server = restify.createServer();
const port = 8080;

server.get('/', (req, res, next) => {
  res.send(`response from ${os.hostname()}`);
  next();
});

server.listen(port, () => {
  console.log(`${server.name} listening on ${server.url}`);
});
