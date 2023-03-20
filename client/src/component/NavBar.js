import {  NavLink } from "react-router-dom";
import "bootstrap"

function NavBar(){
    return(
        <>
            <ul className="nav nav-tabs">
                <li className="nav-item">
                    <NavLink
                        to="/"
                        className="nav-link"
                    >
                    Home
                    </NavLink>
                </li>
                <li className="nav-item">
                    <NavLink
                        to="/login"
                        className="nav-link"
                    >
                    Login
                    </NavLink>
                </li>
            </ul>
        </>
    )
}
export default NavBar;