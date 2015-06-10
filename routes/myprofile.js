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
