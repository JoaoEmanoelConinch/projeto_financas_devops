const express = require('express');
const router = express.Router();
const pool = require('../db');

// Criar uma transação
router.post('/', async (req, res) => {
  const { descricao, valor, data } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO transacoes (descricao, valor, data) VALUES ($1, $2, $3) RETURNING *',
      [descricao, valor, data]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
});

// Listar todas as transações
router.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM transacoes');
    res.json(result.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
});

// Excluir uma transação por ID
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query('DELETE FROM transacoes WHERE id = $1', [id]);
    res.status(204).send();
  } catch (error) {
    res.status(500).send(error.message);
  }
});

module.exports = router;