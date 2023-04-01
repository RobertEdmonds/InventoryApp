import { useEffect, useState, useContext } from "react";
import {CustomerContext} from "../context/Customer.js";


function CustPage(){
    const {customer, setCustomer} = useContext(CustomerContext)
    const [ custList, setCustList ] = useState([])
    const [value, setValue] = useState('')

    useEffect(() => {
        fetch('/users')
        .then(resp => {
            if(resp.ok){
                resp.json().then(persons => setCustList(persons))
            }
        })
    },[])

    const filterCustomer = custList.filter((cust) => {
        if(value.length < cust.name.length) {
            let custSplit = cust.name.slice(0,value.length)
            return value.toUpperCase() === custSplit
        }else{
            console.log("else", value.toUpperCase() === cust)
            return value.toUpperCase() === cust.name
        }
      });
    console.log(customer)
    return(
        <div>
            <div className="mb-3">
                <label htmlFor="findACustomer" className="form-label">Find A Customer</label>
                <input 
                    type="text"    
                    className="form-control"    
                    id="findACustomer"   
                    placeholder="First Last Name"
                    value={value}
                    onChange={e => setValue(e.target.value)}
                    />
            </div>
            <div className="container text-center">
                <div className="row">
            {filterCustomer.map(cust => {
                return(
                    <div className="col" key={cust.id}>
                        <div className="card" style={{width: "18rem"}}>
                            <div className="card-body">
                                <h5 className="card-title">{cust.name}</h5>
                                <h6 className="card-subtitle mb-2 text-body-secondary">{cust.phone_number}</h6>
                                <p className="card-text">{cust.email}</p>
                                <p className="card-text">{cust.address}<br/>{cust.city}, {cust.state} {cust.zip_code}</p>
                                <button className="card-link btn btn-primary">Samples</button>
                                <button className="card-link btn btn-primary">Orders</button>
                                <button className="card-link btn btn-primary" onClick={() => setCustomer(cust)}>Set Customer</button>
                            </div>
                        </div>
                    </div>
                )
            })}
                </div>
            </div>
        </div>
    )
}

export default CustPage 