/**
 * Created by BOON on 19-05-2015.
 */
 var express = require('express'),
 mysql = require('mysql'),
 config = require('../globals/config'),
 common = require('../globals/common');

 var app = express();


 exports.getcourselist = function (req, res) {
    try {
        common.dbQuery(config.module.dbConfig,'CALL xoomtrainings.SP_GETCOURSES();', function (err, records) {
            if (!err) {
                res.send({ "status": "success", "records": records[0] });
            }
        });
    }
    catch (e) {
        console.log(e.message);
    }
}