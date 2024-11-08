const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'projeto_financas',
  password: 'root',
  port: 5432,
});

pool.query('SET search_path TO public');

module.exports = pool;