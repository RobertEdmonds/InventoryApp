import { useEffect, useState } from "react"

function CustPage(){
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
    // console.log(custList)
    const filterCustomer = custList.filter((cust) => {
        console.log("value", value)
        // if (value === "All") return true;
        if(value.length < cust.name.length) {
            let custSplit = cust.name.slice(0,value.length)
            console.log("slice",cust.name.slice(0,value.length))
            return value.toUpperCase() === custSplit
        }else{
            console.log("else", value.toUpperCase() === cust)
            return value.toUpperCase() === cust.name
        }
      });
    console.log(filterCustomer)
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
        </div>
    )
}

export default CustPage 