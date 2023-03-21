import {  NavLink } from "react-router-dom";
import { useContext } from "react";
import { EmployeeContext } from "../context/Employee.js";
import "bootstrap"

function NavBar(){
    const { employee} = useContext(EmployeeContext)

    return(
        <>
            <ul className="nav nav-tabs">
                {!!employee && (
                <li className="nav-item">
                    <NavLink
                        to="/home"
                        className="nav-link"
                    >
                    Home
                    </NavLink>
                </li>
                )}
                {!employee && (
                    <li className="nav-item">
                        <NavLink
                            to="/login"
                            className="nav-link"
                        >
                        Login
                        </NavLink>
                    </li>
                )}
            </ul>
        </>
    )
}
export default NavBar;