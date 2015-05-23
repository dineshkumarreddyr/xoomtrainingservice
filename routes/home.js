/**
 * Created by BOON on 09-05-2015.
 */
var express = require('express'),
    mysql = require('mysql'),
    config = require('../globals/config');

var app = express();

exports.signup = function (req, res) {
    var data = req.body, encryptedPassword;
    try {
        if (data != undefined) {
            //Encrypt password
            if (data.userpassword == undefined || data.userpassword == null) {
                res.send({ "status": "error", "ecode": "e3", "emsg": "Password missing" });
                return;
            }
            encryptedPassword = config.module.passwordEncrypt(data.userpassword);
            if (encryptedPassword == undefined || encryptedPassword == null) {
                res.send({ "status": "error", "ecode": "e4", "emsg": "Password encryption failed" });
                return;
            }
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query("CALL xoomtrainings.SP_XTUSERS('" + data.firstname + "','" + data.lastname + "','" + data.phonenumber + "','" +
                data.userindian + "','" + data.country + "','" + data.username + "','" + data.email + "','" + encryptedPassword + "','i');",
                function (err, rows) {
                    if (!err)
                        res.send({ "status": "success" });
                    else if (err.errno != undefined && err.errno === 1062) {
                        res.send({ "status": "error", "ecode": "e1", "emsg": "User already exists" });
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

exports.signin = function (req, res) {
    var data = req.body, encryptedPassword;
    try {
        if (data != undefined && data.username != undefined && data.userpassword != undefined) {
            //Encrypt Password
            if (data.userpassword == undefined || data.userpassword == null) {
                res.send({ "status": "error", "ecode": "d3", "emsg": "Password missing" });
                return;
            }
            encryptedPassword = config.module.passwordEncrypt(data.userpassword);
            if (encryptedPassword == undefined || encryptedPassword == null) {
                res.send({ "status": "error", "ecode": "d4", "emsg": "Password encryption failed" });
                return;
            }
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query("CALL xoomtrainings.SP_LOGIN('" + data.username + "','" + encryptedPassword + "');", function (err, rows) {
                if (!err) {
                    if (rows != undefined && rows[0] != undefined && rows[0].length > 0) {
                        res.send({ "status": "success", "records": rows[0] });
                    }
                    else
                        res.send({ "status": "error", "ecode": "e2", "emsg": "Data does not exist" });
                }
                else
                    res.send({ "status": "error", "ecode": "e3", "emsg": err.message });
            });
            connection.end();
        }
    }
    catch (exception) {
        console.log(exception);
    }
};
//Get List of courses
exports.getcourselist = function (req, res) {
    try {
        var connection = mysql.createConnection(config.module.dbConfig);
        connection.connect();
        connection.query('CALL `xoomtrainings`.`SP_GETCOURSES`();', function (error, response) {
            if (!error) {
                res.send({ "status": "success", "records": response[0] });
            }
        });
    }
    catch (exception) {
        console.log(exception);
    }
};
//Get List of countries
exports.getCountry = function (req, res) {
    try {
        var connection = mysql.createConnection(config.module.dbConfig);
        connection.connect();
        connection.query('CALL `xoomtrainings`.`SP_GETCOUNTRY`();', function (error, response) {
            if (!error)
                res.send({ "status": "success", "records": response[0] });
        });
    } catch (exception) {
        console.log(exception);
    }
};

//Forgot Password email
exports.forgotPassword = function(req,res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query('CALL 1xoomtrainings`.`SP_CHECKUSER(' + data.email + ')', function (error, records) {
                if (!error) {
                    if (records[0].length > 0 && records[0].emailaddress > 0) {
                        res.send({"status": "success"});
                    }
                }
            });
            connection.close();
        }
    }
    catch (e) {
        console.log(e.message);
    }
};