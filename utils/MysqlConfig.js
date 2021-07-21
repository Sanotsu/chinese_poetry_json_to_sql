const mysql = require("mysql2");

const dbName = "chinese_poetry";

/**
 * mysql连接配置（实际是tidb或mariadb）
 */
const pool = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'root',
    database: dbName,
    connectionLimit: 150,
});

const promisePool = pool.promise();

module.exports = {
    promisePool
}