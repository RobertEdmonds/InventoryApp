import { useEffect, useState } from "react";

function Product(){
    const [product, setProduct] = useState([])
    useEffect(() => {
        fetch("/products").then(r => {
            if(r.ok){
                r.json().then(tiles => setProduct(tiles))
            }
        })
    },[])

    return(
        <div>
            {product.map(tile => {
                console.log(tile.pictures[0].picture_url)
                return(
                    <div className="card" style={{width: "18rem"}} key={tile.id}>
                        <img src={tile.pictures[0].picture_url} className="card-img-top" alt="tile"/>
                        <div className="card-body">
                            <h5 className="card-title">{tile.name}</h5>
                            <h6 className="card-title">${tile.cost}</h6>
                            <p className="card-text">{tile.description}</p>
                            <p className="card-text">{tile.inventory}</p>
                            <button href="#" className="btn btn-primary">Go somewhere</button>
                        </div>
                    </div>
                )
            })}
            <h1>Product</h1>
        </div>
    )
}

export default Product;