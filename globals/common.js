/**
 * Created by BOON on 25-05-2015.
 */

 var express = require('express'),
 mysql = require('mysql');

 var app = express();

 exports.dbQuery = function(dbConfig,query,response) {
 	try {
 		var cosmicdbPool = mysql.createPool(dbConfig);
 		cosmicdbPool.getConnection(function(err,connection){
 			connection.query(query, function(err,rows){
 				connection.release();
 				response(err,rows);
 			});
 		});
 	} catch (e) {
 		return e.message
 	}
 };