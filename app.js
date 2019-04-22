const faker = require('faker');
const express = require('express');
const sql = require('mssql');
// const http = require('http');
const app = express();
const dbConfig = {
    user: 'sa',
    password: '',
    server: 'localhost', 
    database: 'instagram_clone_app',
};

const data = [];
for(let i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}
const q = 'INSERT INTO users (email, created_at) VALUES ?';
sql.connect(dbConfig).then(() => {
    // return sql.query('select * from users')
    return sql.query(q, [data])
}).then(result => {
    console.log(result)
});