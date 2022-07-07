import React from "react";
import ReactDOM from "react-dom";
import * as APIUtils from "./util/session_api_util"

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
  
  window.signup = APIUtils.signup;
  window.login = APIUtils.login;
  window.logout = APIUtils.logout;



});