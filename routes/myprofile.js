/**
 * Created by BOON on 10-06-2015.
 */

var express = require('express'),
    mysql = require('mysql'),
    config = require('../globals/config');

var app = express();

exports.getMyProfile = function(req,res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query('CALL xoomtrainings.SP_GETUSERDETAILS(' + data.userid + ')', function (error, records) {
                if (!error) {
                    if (records != undefined && records[0] != undefined && records[0].length > 0)
                        res.send({"status": "success", "records": records[0]});
                    else
                        res.send({"status": "error", "ecode": "e2", "emsg": "Data does not exists"});
                }
                else {
                    res.send({"status": "error", "ecode": "e3", "emsg": "API Error"});
                }
            });
            connection.close();
        }
    }
    catch (e) {
        console.log(e.message);
    }
};


exports.updateProfile = function(req,res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query('CALL xoomtrainings.SP_UPDATEPROFILE("' + data.userid + '","' + data.firstname + '","' + data.lastname + '","' +
            data.email + '","' + data.userindian + '","' + data.country + '","' + data.mobile + '")', function (error, records) {
                if (!error) {
                    res.send({"status": "success"});
                }
                else {
                    res.send({"status": "error", "ecode": "e3", "emsg": error});
                }
            });
            connection.close();
        }
    }
    catch (e) {
        console.log(e.message);
    }
};

exports.changePassword = function (req,res) {
    var data = req.body, encryptedoldpass, encryptednewpass;
    try {
        if (data != undefined) {

            //Encrypt password
            if ((data.oldpassword == undefined || data.oldpassword == null) || (data.newpassword == undefined || data.newpassword == null)) {
                res.send({"status": "error", "ecode": "e3", "emsg": "Password missing"});
                return;
            }
            encryptedoldpass = config.module.passwordEncrypt(data.oldpassword);
            encryptednewpass = config.module.passwordEncrypt(data.newpassword);
            if (encryptedoldpass == undefined || encryptedoldpass == null || encryptednewpass == undefined || encryptednewpass == null) {
                res.send({"status": "error", "ecode": "e4", "emsg": "Password encryption failed"});
                return;
            }

            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query('CALL xoomtrainings.SP_CHANGEPASSWORD("' + data.userid + '","' + encryptedoldpass + '","' + encryptednewpass + '")',
                function (error, records) {
                    if (!error) {
                        if (records != undefined && records[0] != undefined && records[0].length > 0) {
                            if (records[0][0].tbRecordCount != '0')
                                res.send({"status": "success"});
                            else if (records[0][0].tbRecordCount == 0)
                                res.send({"status": "error", "ecode": "e5", "emsg": "Invalid old password"});
                        }
                        else
                            res.send({"status": "error"});
                    }
                    else {
                        res.send({"status": "error", "ecode": "e3", "emsg": "Data does not matches"});
                    }
                });
            connection.close();
        }
    }
    catch (e) {
        console.log(e.message);
    }
};

exports.getUserRegisteredCourses = function(req,res) {
    var data = req.body;
    try {
        if (data != undefined) {
            var connection = mysql.createConnection(config.module.dbConfig);
            connection.connect();
            connection.query('CALL xoomtrainings.SP_GETUSERCOURSES(' + data.userid + ')', function (error, records) {
                if (!error) {
                    if (records != undefined && records[0] != undefined && records[0].length > 0) {
                        res.send({"status": "success", "records": records[0]});
                    }
                    else
                        res.send({"stauts": "error", "ecode": "e5", "emsg": "Data does not exist"});
                }
                else
                    res.send({"status": "error", "ecode": "e6", "emsg": error});
            });
            connection.close();
        }
    }
    catch (e) {
        console.log(e.message);
    }
};