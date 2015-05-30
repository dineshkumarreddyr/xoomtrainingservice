var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

//Referring the routes
var home = require('./routes/home');
var course = require('./routes/courselist');
var details = require('./routes/coursedetails');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Headers', 'Content-Type, X-Requested-With, Origin, Accept');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Max-Age', '86400');

    if (req.method.toLowerCase() === "options") {
        res.sendStatus(200);
    }
    else
        next();
});

//Adding the Restful API
app.post('/signup', home.signup);
app.post('/signin', home.signin);
app.get('/courselist', course.getcourselist);
app.get('/countrylist', home.getCountry);
app.post('/cartcount',home.savedCartCount);
//API CALL - Get course details
app.post('/details', details.getCourseDetails);
app.post('/courselite',details.getCourse);
//Forgot Password
app.post('/fpassword',home.forgotPassword);
//Saved Cart
app.post('/savecart',details.saveCart);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

app.listen(9545);
if (app.get('env') === 'development') {
    console.log("App listening at port 9545");
}

module.exports = app;
