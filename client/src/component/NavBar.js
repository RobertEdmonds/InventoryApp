import React from "react";
import {  NavLink } from "react-router-dom";

function NavBar(){
    return(
        <>
            <div className="">
                <NavLink
                to="/"
                className=""
                // activeStyle={{ color: "black" }}
                >
                Home
                </NavLink>
            </div>
        </>
    )
}
export default NavBar;