const http = require('http');

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
  res.end("Hello from NodeJS App deployed on AKS using Terraform + Azure DevOps CI/CD 👋");
});

server.listen(PORT, () => {
  console.log(`Server running on port http://0.0.0.0:${PORT}`);
});
