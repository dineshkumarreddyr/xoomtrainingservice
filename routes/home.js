/**
 * Created by BOON on 09-05-2015.
 */
var express = require('express'),
    mysql = require('mysql');

var app = express();

var dbConfig = {
    host: 'localhost',
    user: 'sa',
    password: '1234'
};

exports.signup = function (req,res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(dbConfig);
            connection.connect();
            connection.query("CALL xoomtrainings.SP_XTUSERS('" + data.firstname + "','" + data.lastname + "','" + data.phonenumber + "','" +
                data.userindian + "','" + data.country + "','" + data.username + "','" + data.email + "','" + data.userpassword + "','i');",
                function (err, rows) {
                    if (!err)
                        res.send('Success');
                    else if (err.errno != undefined && err.errno === 1062) {
                        res.send({"status": "error", "ecode": "e1", "emsg": "User already exists"});
                    }
                    else
                        res.send(err);
                });
            connection.end();
        }
    }
    catch (exception) {
        console.log(exception);
    }
};

exports.signin = function (req,res) {
    var data = req.body;
    try {
        if (data != undefined && data.username != undefined && data.userpassword != undefined) {
            var connection = mysql.createConnection(dbConfig);
            connection.connect();
            connection.query("CALL xoomtrainings.SP_LOGIN('" + data.username + "','" + data.userpassword + "');", function (err, rows) {
                if (!err) {
                    if (rows != undefined && rows[0] != undefined && rows[0].length > 0) {
                        res.send({"status": "success", "records": rows[0]});
                    }
                    else
                        res.send({"status": "error", "ecode": "d2", "emsg": "Data does not exist"});
                }
                else
                    res.send({"status": "error", "ecode": "d3", "emsg": err.message});
            });
            connection.end();
        }
    }
    catch (exception) {
        console.log(exception);
    }
};
//Get List of courses
exports.getcourselist = function(req,res) {
    try {
        var connection = mysql.createConnection(dbConfig);
        connection.connect();
        connection.query('CALL `xoomtrainings`.`SP_GETCOURSES`();', function (error, response) {
            if (!error) {
                res.send({"status": "success", "records": response[0]});
            }
        });
    }
    catch (exception) {
        console.log(exception);
    }
};
//Get List of countries
exports.getCountry = function(req,res) {
    try {
        var connection = mysql.createConnection(dbConfig);
        connection.connect();
        connection.query('CALL `xoomtrainings`.`SP_GETCOUNTRY`();', function (error, response) {
            if (!error)
                res.send({"status": "success", "records": response[0]});
        });
    } catch (exception) {
        console.log(exception);
    }
};