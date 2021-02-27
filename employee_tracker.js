const mysql = require("mysql");
const inquirer = require("inquirer");
const { printTable } = require("console-table-printer");
const figlet = require("figlet");

let roles;
let departments;
let managers;
let employees;

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "Spartans66!",
  database: "employee_tracker_db",
});

figlet("Employee Tracker", (err, result) => {
  console.log(err || result);
});

start = () => {
  inquirer
    .prompt({
      name: "choices",
      type: "list",
      message: "What do you want to do?",
      choices: ["ADD", "VIEW", "UPDATE", "DELETE", "EXIT"],
    })
    .then(function (answer) {
      if (answer.choices === "ADD") {
        addSomething();
      }
      if (answer.choices === "VIEW") {
        viewSomething();
      }
      if (answer.choices === "UPDATE") {
        updateSomething();
      }
      if (answer.choices === "DELETE") {
        deleteSomething();
      }
      if (answer.choices === "EXIT") {
        figlet("Thanks for using the Employee Tracker!", (err, result) => {
          console.log(err || result);
        });

        connection.end();
      } else {
        connection.end();
      }
    });
};

// connect to the mysql server and sql database
connection.connect(function (err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  start();
  getDepartments();
  getRoles();
  getManagers();
  getEmployees();
});
