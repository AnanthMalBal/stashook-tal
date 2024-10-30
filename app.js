var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var commonRouter = require('./src/routes/common-router');
var timesheetRouter = require('./src/routes/timesheet-router');
var attendanceRouter = require('./src/routes/attendance-router');
var leaveRouter = require('./src/routes/leave-router');
var utilRouter = require('./src/routes/util-router');
var dailyLogRouter = require('./src/routes/userdailylog-router');
var holidayRouter = require('./src/routes/holiday-router');

var app = express();

// view engine setup
// app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

const CONTEXT_PATH = '/stashook';

app.use(CONTEXT_PATH, commonRouter);
app.use(CONTEXT_PATH, timesheetRouter);
app.use(CONTEXT_PATH, attendanceRouter);
app.use(CONTEXT_PATH, leaveRouter);
app.use(CONTEXT_PATH, utilRouter);
app.use(CONTEXT_PATH, dailyLogRouter);
app.use(CONTEXT_PATH, holidayRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
