/**
 * Created by BOON on 20-05-2015.
 */
var express = require('express'),
    mysql = require('mysql'),
    config = require('../globals/config'),
    uid = require('uid');

var app = express();

exports.getCourseDetails = function (req, res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query('CALL xoomtrainings.SP_GETCOURSEDETAIL(' + data.courseid + ')', function (error, records) {
                if (!error) {
                    if (records[0].length > 0)
                        res.send({ "status": "success", "records": records[0] });
                    else
                        res.send({ "status": "error", "ecode": "e2", "emsg": "Data does not exist" });
                }
                else
                    res.send({ "status": "error", "ecode": "e3", "emsg": error.message });
            });
            connection.close();
        }
    }
    catch (e) {
        console.log(e.message);
    }
};

exports.getCourse = function(req,res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query('CALL xoomtrainings.SP_GETCOURSE(' + data.courseid + ')', function (error, records) {
                if (!error) {
                    if (records[0].length > 0)
                        res.send({"status": "success", "records": records[0]});
                    else
                        res.send({"status": "error", "ecode": "e2", "emsg": "Data does not exist"});
                }
                else
                    res.send({"status": "error", "ecode": "e3", "emsg": error.message});
            });
            connection.close();
        }
    }
    catch (e) {
        console.log(e.message);
    }
};


//Saved Cart
exports.saveCart = function(req,res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query("CALL xoomtrainings.SP_SAVECART('" + uid(25) + "','" + data.courseid + "','" + data.userid + "','" + data.username + "','" + data.enrollstatus + "')",
                function (error, records) {
                    if (!error) {
                        res.send({"status": "success", records: records[0]});
                    }
                    else {
                        res.send({"status": "error", "ecode": "e2", "emsg": "Duplicate entry"});
                    }
                });
            connection.close();
        }
    } catch (e) {
        console.log(e.message);
    }
};