/**
 * Created by BOON on 19-05-2015.
 */
var express = require('express'),
    mysql = require('mysql'),
    config = require('../globals/config');

var app = express();


exports.getcourselist = function (req, res) {
    try {
        var connection = mysql.createConnection(config.module.dbConfig);
        connection.connect();
        connection.query('CALL xoomtrainings.SP_GETCOURSES();', function (err, records) {
            console.log(err);
            if (!err) {
                res.send({ "status": "success", "records": records[0] });
            }
        });
        connection.close();
    }
    catch (e) {
        console.log(e.message);
    }
}