const { Pool } = require("pg");
 
// const pool = new Pool()
const { Pool } = require('pg')
require('dotenv').config()

const pool = new Pool({
  connectionString: "postgres://default:53LYgWVROBbl@ep-yellow-morning-a4skmabh-pooler.us-east-1.aws.neon.tech:5432/verceldb?sslmode=require?sslmode=require",
})



module.exports ={
     query: (text, params) => pool.query(text, params) 
};