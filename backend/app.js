const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const transacoesRoutes = require('./routes/transacoes');

const app = express();

app.use(cors({ origin: 'http://localhost:4200' }));
app.use(bodyParser.json());

app.use('/transacoes', transacoesRoutes);

const port = 3000;
app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});